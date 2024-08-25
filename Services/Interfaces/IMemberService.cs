using TooL82.Web.Models.Entities;

namespace TooL82.Web.Services.Interfaces;

public interface IMemberService
{
    Task<string> CreateMemberAsync(Member member);
    Task<bool> CheckUserIdExistsAsync(string userId);
    Task<Member?> CheckLoginAsync(string userId, string password);
    Task<Member?> GetMemberByUserIdAsync(string userId);
    Task<string> UpdateMemberAsync(Member member);
    Task<string> DeleteMemberAsync(string userId, string password);
    Task<bool> HasPendingTransactionsAsync(string userId);
}
