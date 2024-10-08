using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using server.Models;

public class ApplicationDbContext : IdentityDbContext<ApplicationUser> {
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options) {
    }

    public DbSet<Book> Books { get; set; }
    public DbSet<Bookshelf> Bookshelves { get; set; }
    public DbSet<State> States { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder) {
        base.OnModelCreating(modelBuilder);

        // IDs fixos para o administrador e o role de admin
        string adminRoleId = "admin-role-id";
        string adminUserId = "admin-user-id";

        // Adiciona o Role de Administrador
        modelBuilder.Entity<IdentityRole>().HasData(new IdentityRole {
            Id = adminRoleId,
            Name = "Admin",
            NormalizedName = "ADMIN"
        });

        var adminUser = new ApplicationUser {
            Id = adminUserId,
            UserName = "admin",
            NormalizedUserName = "ADMIN",
            SecurityStamp = Guid.NewGuid().ToString(),
            Nick = "Admin",
            Bookshelves = new List<Bookshelf>()  // Inicializa a coleção como uma lista vazia
        };

        // Cria um hash da password usando o utilizador admin
        var hasher = new PasswordHasher<ApplicationUser>();
        adminUser.PasswordHash = hasher.HashPassword(adminUser, "Admin@123");

        // Adiciona o utilizador admin ao modelBuilder
        modelBuilder.Entity<ApplicationUser>().HasData(adminUser);

        // Atribuir o Role de Administrador ao utilizador admin
        modelBuilder.Entity<IdentityUserRole<string>>().HasData(new IdentityUserRole<string> {
            UserId = adminUserId,
            RoleId = adminRoleId
        });

        // Relacionamento entre Bookshelf e ApplicationUser
        modelBuilder.Entity<Bookshelf>()
            .HasOne(b => b.User)
            .WithMany(u => u.Bookshelves)
            .HasForeignKey(b => b.UserId);

        // Relacionamento entre Bookshelf e Book
        modelBuilder.Entity<Bookshelf>()
            .HasOne(ub => ub.Book)
            .WithMany(b => b.Bookshelves)
            .HasForeignKey(ub => ub.BookId);

        // Relacionamento entre Bookshelf e State
        modelBuilder.Entity<Bookshelf>()
            .HasOne(bs => bs.State)
            .WithMany(s => s.BookList)
            .HasForeignKey(bs => bs.StateFK);
    }
}
