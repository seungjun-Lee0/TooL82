using TooL82.Web.Models.Entities;

namespace TooL82.Web.Services.Interfaces;

public interface IPurchaseService
{
    // 구매 목록
    Task<IEnumerable<Buylist>> GetBuyListAsync(int mno, int page, int pageSize = 10);
    Task<int> GetBuyCountAsync(int mno);
    Task<IEnumerable<Buylist>> SearchBuyListAsync(int mno, string filterType, string keyword);

    // 판매 목록
    Task<IEnumerable<Product>> GetSellListAsync(int mno, int page, int pageSize = 10);
    Task<int> GetSellCountAsync(int mno);
    Task<IEnumerable<Product>> SearchSellListAsync(int mno, string filterType, string keyword);

    // 구매 처리
    Task<bool> AddToBuyListAsync(int pno, int mno, string category, string title, DateTime edate, int sprice);
    Task<bool> IsDuplicatePurchaseAsync(int pno, int mno);
}
