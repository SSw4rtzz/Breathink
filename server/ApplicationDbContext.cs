using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using server.Models;

public class ApplicationDbContext : IdentityDbContext<ApplicationUser> {
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options) {
    }

    public DbSet<Book> Books { get; set; }
    public DbSet<Bookshelf> Bookshelves { get; set; }
    protected override void OnModelCreating(ModelBuilder modelBuilder) {
        base.OnModelCreating(modelBuilder);

        modelBuilder.Entity<Bookshelf>()
            .HasOne(b => b.User)
            .WithMany(u => (u.Bookshelves)
            .HasForeignKey(b => b.UserId);

        modelBuilder.Entity<Bookshelf>()
            .HasOne(ub => ub.Book)
            .WithMany(b => b.Bookshelves)
            .HasForeignKey(ub => ub.BookId);
    }
}
