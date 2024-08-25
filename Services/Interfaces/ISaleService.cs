using TooL82.Web.Models.Entities;

namespace TooL82.Web.Services.Interfaces;

public interface ISaleService
{
    Task<bool> CreateProductAsync(Product product, int mno);
    Task<Product?> GetProductForEditAsync(int pno);
    Task<string?> GetProductFileNamesAsync(int pno);
    Task<bool> UpdateProductAsync(Product product);
    Task<bool> DeleteProductAsync(int pno, int mno);
}
