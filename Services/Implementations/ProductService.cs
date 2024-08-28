using Microsoft.EntityFrameworkCore;
using TooL82.Web.Data;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Services.Implementations;

public class ProductService : IProductService
{
    private readonly ApplicationDbContext _context;

    public ProductService(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<IEnumerable<Product>> GetProductsAsync(string category, int page, int pageSize = 8)
    {
        var skip = (page - 1) * pageSize;

        return await _context.Products
            .Where(p => p.Category == category)
            .OrderByDescending(p => p.Pno)
            .Skip(skip)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task<Product?> GetProductByIdAsync(int pno, string? category = null)
    {
        var query = _context.Products.Where(p => p.Pno == pno);

        if (!string.IsNullOrEmpty(category))
        {
            query = query.Where(p => p.Category == category);
        }

        return await query.FirstOrDefaultAsync();
    }

    public async Task<int> GetProductCountAsync(string category)
    {
        return await _context.Products.CountAsync(p => p.Category == category);
    }

    public async Task<IEnumerable<Product>> GetLatestProductsAsync(int count = 4)
    {
        return await _context.Products
            .OrderByDescending(p => p.Pno)
            .Take(count)
            .ToListAsync();
    }
}
