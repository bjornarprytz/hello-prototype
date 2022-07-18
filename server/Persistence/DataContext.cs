using Domain;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace Persistence;

public class DataContext : IdentityDbContext<AppUser>
{
    public DataContext(DbContextOptions options) : base(options)
    {
        
    }
    
    public DbSet<Building> Buildings { get; set; }
    public DbSet<Set> Sets { get; set; }
    public DbSet<Crew> Crews { get; set; }
    public DbSet<Enemy> Enemies { get; set; }

}