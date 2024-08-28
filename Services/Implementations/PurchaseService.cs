using Microsoft.EntityFrameworkCore;
using TooL82.Web.Data;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Services.Implementations;

public class PurchaseService : IPurchaseService
{
    private readonly ApplicationDbContext _context;

    public PurchaseService(ApplicationDbContext context)
    {
        _context = context;
    }

    // 구매 목록
    public async Task<IEnumerable<Buylist>> GetBuyListAsync(int mno, int page, int pageSize = 10)
    {
        var skip = (page - 1) * pageSize;
        return await _context.Buylists
            .Where(b => b.Mno == mno)
            .OrderByDescending(b => b.BDate)
            .Skip(skip)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task<int> GetBuyCountAsync(int mno)
    {
        return await _context.Buylists.CountAsync(b => b.Mno == mno);
    }

    public async Task<IEnumerable<Buylist>> SearchBuyListAsync(int mno, string filterType, string keyword)
    {
        var query = _context.Buylists.Where(b => b.Mno == mno);

        query = filterType switch
        {
            "buying" => query.Where(b => b.BuyStat == 0),
            "buysuss" => query.Where(b => b.BuyStat == 1),
            "buyfail" => query.Where(b => b.BuyStat == 2),
            "redeem" => query.Where(b => b.BuyStat == 3),
            "video" => query.Where(b => b.Category == "v"),
            "music" => query.Where(b => b.Category == "m"),
            "util" => query.Where(b => b.Category == "u"),
            "game" => query.Where(b => b.Category == "g"),
            _ => query
        };

        if (!string.IsNullOrEmpty(keyword))
        {
            query = query.Where(b => b.Title.Contains(keyword));
        }

        return await query.OrderByDescending(b => b.EDate).ToListAsync();
    }

    // 판매 목록
    public async Task<IEnumerable<Product>> GetSellListAsync(int mno, int page, int pageSize = 10)
    {
        var skip = (page - 1) * pageSize;

        // mno로 userid 조회 후 판매 목록 조회
        var member = await _context.Members.FirstOrDefaultAsync(m => m.Mno == mno);
        if (member == null) return Enumerable.Empty<Product>();

        return await _context.Products
            .Where(p => p.UserId == member.UserId)
            .OrderByDescending(p => p.EDate)
            .Skip(skip)
            .Take(pageSize)
            .ToListAsync();
    }

    public async Task<int> GetSellCountAsync(int mno)
    {
        var member = await _context.Members.FirstOrDefaultAsync(m => m.Mno == mno);
        if (member == null) return 0;

        return await _context.Products.CountAsync(p => p.UserId == member.UserId);
    }

    public async Task<IEnumerable<Product>> SearchSellListAsync(int mno, string filterType, string keyword)
    {
        var member = await _context.Members.FirstOrDefaultAsync(m => m.Mno == mno);
        if (member == null) return Enumerable.Empty<Product>();

        var query = _context.Products.Where(p => p.UserId == member.UserId);

        query = filterType switch
        {
            "selling" => query.Where(p => p.SellStat == 0),
            "sellsuss" => query.Where(p => p.SellStat == 1),
            "sellfail" => query.Where(p => p.SellStat == 2),
            "video" => query.Where(p => p.Category == "v"),
            "music" => query.Where(p => p.Category == "m"),
            "util" => query.Where(p => p.Category == "u"),
            "game" => query.Where(p => p.Category == "g"),
            _ => query
        };

        if (!string.IsNullOrEmpty(keyword))
        {
            query = query.Where(p => p.Title.Contains(keyword));
        }

        return await query.OrderByDescending(p => p.EDate).ToListAsync();
    }

    // 구매 처리
    public async Task<bool> AddToBuyListAsync(int pno, int mno, string category, string title, DateTime edate, int sprice)
    {
        using var transaction = await _context.Database.BeginTransactionAsync();
        try
        {
            // 구매 목록에 추가
            var buylist = new Buylist
            {
                Pno = pno,
                Mno = mno,
                Category = category,
                Title = title,
                EDate = edate,
                SPrice = sprice,
                BDate = DateTime.Now,
                BuyStat = 0
            };

            _context.Buylists.Add(buylist);

            // 상품의 참여 인원 증가
            var product = await _context.Products.FirstOrDefaultAsync(p => p.Pno == pno);
            if (product != null)
            {
                product.CPartied += 1;
            }

            await _context.SaveChangesAsync();
            await transaction.CommitAsync();
            return true;
        }
        catch
        {
            await transaction.RollbackAsync();
            return false;
        }
    }

    public async Task<bool> IsDuplicatePurchaseAsync(int pno, int mno)
    {
        return await _context.Buylists.AnyAsync(b => b.Pno == pno && b.Mno == mno);
    }
}
