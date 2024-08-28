using Microsoft.EntityFrameworkCore;
using TooL82.Web.Data;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Services.Implementations;

public class SaleService : ISaleService
{
    private readonly ApplicationDbContext _context;

    public SaleService(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<bool> CreateProductAsync(Product product, int mno)
    {
        try
        {
            product.SDate = DateTime.Now;
            product.CPartied = 0;
            product.SellStat = 0;

            _context.Products.Add(product);
            var result = await _context.SaveChangesAsync();
            return result > 0;
        }
        catch
        {
            return false;
        }
    }

    public async Task<Product?> GetProductForEditAsync(int pno)
    {
        return await _context.Products.FirstOrDefaultAsync(p => p.Pno == pno);
    }

    public async Task<string?> GetProductFileNamesAsync(int pno)
    {
        var product = await _context.Products
            .Where(p => p.Pno == pno)
            .Select(p => p.FNames)
            .FirstOrDefaultAsync();
        return product;
    }

    public async Task<bool> UpdateProductAsync(Product product)
    {
        var existingProduct = await _context.Products.FirstOrDefaultAsync(p => p.Pno == product.Pno);
        if (existingProduct == null)
            return false;

        existingProduct.Category = product.Category;
        existingProduct.Title = product.Title;
        existingProduct.Party = product.Party;
        existingProduct.Email = product.Email;
        existingProduct.EDate = product.EDate;
        existingProduct.OPrice = product.OPrice;
        existingProduct.SPrice = product.SPrice;
        existingProduct.Contents = product.Contents;
        existingProduct.Uuid = product.Uuid;

        if (!string.IsNullOrEmpty(product.FNames))
        {
            existingProduct.FNames = product.FNames;
        }

        var result = await _context.SaveChangesAsync();
        return result > 0;
    }

    public async Task<bool> DeleteProductAsync(int pno, int mno)
    {
        var product = await _context.Products
            .FirstOrDefaultAsync(p => p.Pno == pno);

        if (product == null)
            return false;

        _context.Products.Remove(product);
        var result = await _context.SaveChangesAsync();
        return result > 0;
    }
}
