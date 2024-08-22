using Microsoft.EntityFrameworkCore;
using TooL82.Web.Models.Entities;

namespace TooL82.Web.Data;

public class ApplicationDbContext : DbContext
{
    public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options)
        : base(options)
    {
    }

    public DbSet<Member> Members { get; set; }
    public DbSet<Product> Products { get; set; }
    public DbSet<Buylist> Buylists { get; set; }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);

        // Member configuration
        modelBuilder.Entity<Member>(entity =>
        {
            entity.HasIndex(e => e.UserId).IsUnique();
        });

        // Product configuration
        modelBuilder.Entity<Product>(entity =>
        {
            entity.HasOne(p => p.Member)
                .WithMany(m => m.Products)
                .HasForeignKey(p => p.UserId)
                .HasPrincipalKey(m => m.UserId)
                .OnDelete(DeleteBehavior.Restrict);
        });

        // Buylist configuration
        modelBuilder.Entity<Buylist>(entity =>
        {
            entity.HasOne(b => b.Product)
                .WithMany()
                .HasForeignKey(b => b.Pno)
                .OnDelete(DeleteBehavior.Restrict);

            entity.HasOne(b => b.Member)
                .WithMany(m => m.Purchases)
                .HasForeignKey(b => b.Mno)
                .OnDelete(DeleteBehavior.Restrict);
        });
    }
}
