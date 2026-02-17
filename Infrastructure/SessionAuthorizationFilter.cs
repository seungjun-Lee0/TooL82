using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using TooL82.Web.Models.Entities;

namespace TooL82.Web.Infrastructure;

/// <summary>
/// Custom authorization filter for session-based authentication
/// </summary>
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false)]
public class SessionAuthorizeAttribute : Attribute, IAuthorizationFilter
{
    public bool RequireSeller { get; set; } = false;

    public void OnAuthorization(AuthorizationFilterContext context)
    {
        var session = context.HttpContext.Session;
        var memberJson = session.GetString("MyInfo");

        if (string.IsNullOrEmpty(memberJson))
        {
            context.Result = new RedirectToActionResult("Login", "Account", null);
            return;
        }

        var member = JsonSerializer.Deserialize<Member>(memberJson);
        if (member == null)
        {
            context.Result = new RedirectToActionResult("Login", "Account", null);
            return;
        }

        // Check seller requirement
        if (RequireSeller && member.SellerYn != "Y")
        {
            context.HttpContext.Items["TempData_ErrorMessage"] = "판매자만 이용할 수 있습니다.";
            context.Result = new RedirectToActionResult("MyPage", "Account", null);
            return;
        }

        // Store member in HttpContext.Items for easy access
        context.HttpContext.Items["CurrentMember"] = member;
    }
}

/// <summary>
/// Allows anonymous access to actions decorated with this attribute
/// </summary>
[AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false)]
public class AllowAnonymousSessionAttribute : Attribute
{
}
