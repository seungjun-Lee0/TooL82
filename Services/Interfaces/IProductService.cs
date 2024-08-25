using TooL82.Web.Models.Entities;

namespace TooL82.Web.Services.Interfaces;

public interface IProductService
{
    Task<IEnumerable<Product>> GetProductsAsync(string category, int page, int pageSize = 8);
    Task<Product?> GetProductByIdAsync(int pno, string? category = null);
    Task<int> GetProductCountAsync(string category);
    Task<IEnumerable<Product>> GetLatestProductsAsync(int count = 4);
}
