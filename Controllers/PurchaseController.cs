using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

public class PurchaseController : Controller
{
    private readonly IPurchaseService _purchaseService;

    public PurchaseController(IPurchaseService purchaseService)
    {
        _purchaseService = purchaseService;
    }

    private Member? GetCurrentMember()
    {
        var memberJson = HttpContext.Session.GetString("MyInfo");
        if (string.IsNullOrEmpty(memberJson))
            return null;

        return JsonSerializer.Deserialize<Member>(memberJson);
    }

    // 구매자 페이지 (구매 목록)
    [HttpGet]
    public async Task<IActionResult> BuyerPage(int page = 1)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        var buyList = await _purchaseService.GetBuyListAsync(member.Mno, page);
        var totalCount = await _purchaseService.GetBuyCountAsync(member.Mno);
        var totalPages = (int)Math.Ceiling(totalCount / 10.0);

        ViewBag.CurrentPage = page;
        ViewBag.TotalPages = totalPages;
        ViewBag.TotalCount = totalCount;

        return View(buyList);
    }

    // 구매 목록 검색
    [HttpGet]
    public async Task<IActionResult> BuyerSearch(string ftype, string fkey)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        var buyList = await _purchaseService.SearchBuyListAsync(member.Mno, ftype, fkey ?? "");

        ViewBag.FilterType = ftype;
        ViewBag.FilterKey = fkey;

        return View("BuyerPage", buyList);
    }

    // 판매자 페이지 (판매 목록)
    [HttpGet]
    public async Task<IActionResult> SellerPage(int page = 1)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        if (member.SellerYn != "Y")
        {
            TempData["ErrorMessage"] = "판매자만 이용할 수 있습니다.";
            return RedirectToAction("MyPage", "Account");
        }

        var sellList = await _purchaseService.GetSellListAsync(member.Mno, page);
        var totalCount = await _purchaseService.GetSellCountAsync(member.Mno);
        var totalPages = (int)Math.Ceiling(totalCount / 10.0);

        ViewBag.CurrentPage = page;
        ViewBag.TotalPages = totalPages;
        ViewBag.TotalCount = totalCount;

        return View(sellList);
    }

    // 판매 목록 검색
    [HttpGet]
    public async Task<IActionResult> SellerSearch(string ftype, string fkey)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        if (member.SellerYn != "Y")
        {
            TempData["ErrorMessage"] = "판매자만 이용할 수 있습니다.";
            return RedirectToAction("MyPage", "Account");
        }

        var sellList = await _purchaseService.SearchSellListAsync(member.Mno, ftype, fkey ?? "");

        ViewBag.FilterType = ftype;
        ViewBag.FilterKey = fkey;

        return View("SellerPage", sellList);
    }
}
