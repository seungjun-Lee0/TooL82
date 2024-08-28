using Microsoft.EntityFrameworkCore;
using TooL82.Web.Data;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Services.Implementations;

public class MemberService : IMemberService
{
    private readonly ApplicationDbContext _context;

    public MemberService(ApplicationDbContext context)
    {
        _context = context;
    }

    public async Task<string> CreateMemberAsync(Member member)
    {
        try
        {
            member.RegDate = DateTime.Now;
            member.Passwd = BCrypt.Net.BCrypt.HashPassword(member.Passwd);
            _context.Members.Add(member);
            var result = await _context.SaveChangesAsync();
            return result > 0 ? "회원정보가 정상적으로 저장되었습니다!" : "회원정보 저장에 실패하였습니다!";
        }
        catch
        {
            return "회원정보 저장에 실패하였습니다!";
        }
    }

    public async Task<bool> CheckUserIdExistsAsync(string userId)
    {
        return await _context.Members.AnyAsync(m => m.UserId == userId);
    }

    public async Task<Member?> CheckLoginAsync(string userId, string password)
    {
        var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
        if (member == null) return null;

        return BCrypt.Net.BCrypt.Verify(password, member.Passwd) ? member : null;
    }

    public async Task<Member?> GetMemberByUserIdAsync(string userId)
    {
        return await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
    }

    public async Task<string> UpdateMemberAsync(Member member)
    {
        var existingMember = await _context.Members.FirstOrDefaultAsync(m => m.UserId == member.UserId);
        if (existingMember == null)
            return "회원정보 수정 실패";

        existingMember.Passwd = BCrypt.Net.BCrypt.HashPassword(member.Passwd);
        existingMember.Email = member.Email;
        existingMember.SellerYn = member.SellerYn;

        var result = await _context.SaveChangesAsync();
        return result > 0 ? "회원정보 수정 성공" : "회원정보 수정 실패";
    }

    public async Task<string> DeleteMemberAsync(string userId, string password)
    {
        if (await HasPendingTransactionsAsync(userId))
            return "fail";

        var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
        if (member == null || !BCrypt.Net.BCrypt.Verify(password, member.Passwd))
            return "fail";

        _context.Members.Remove(member);
        await _context.SaveChangesAsync();
        return "success";
    }

    public async Task<bool> HasPendingTransactionsAsync(string userId)
    {
        var member = await _context.Members.FirstOrDefaultAsync(m => m.UserId == userId);
        if (member == null) return false;

        // 진행중인 구매(buystat=0) 또는 판매(sellstat=0)가 있는지 확인
        var hasPendingBuy = await _context.Buylists.AnyAsync(b => b.Mno == member.Mno && b.BuyStat == 0);
        var hasPendingSell = await _context.Products.AnyAsync(p => p.UserId == userId && p.SellStat == 0);

        return hasPendingBuy || hasPendingSell;
    }
}
