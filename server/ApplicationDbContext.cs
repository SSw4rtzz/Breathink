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
