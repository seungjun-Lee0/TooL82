using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Infrastructure;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

[SessionAuthorize]
public class PurchaseController : Controller
{
    private readonly IPurchaseService _purchaseService;

    public PurchaseController(IPurchaseService purchaseService)
    {
        _purchaseService = purchaseService;
    }

    private Member GetCurrentMember()
    {
        return (HttpContext.Items["CurrentMember"] as Member)!;
    }

    // 구매자 페이지 (구매 목록)
    [HttpGet]
    public async Task<IActionResult> BuyerPage(int page = 1)
    {
        var member = GetCurrentMember();

        // 페이지 번호 유효성 검증
        if (page < 1) page = 1;

        var buyList = await _purchaseService.GetBuyListAsync(member.Mno, page);
        var totalCount = await _purchaseService.GetBuyCountAsync(member.Mno);
        var totalPages = (int)Math.Ceiling(totalCount / 10.0);

        // 페이지가 범위를 벗어나면 조정
        if (page > totalPages && totalPages > 0) page = totalPages;

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

        var buyList = await _purchaseService.SearchBuyListAsync(member.Mno, ftype, fkey ?? "");

        ViewBag.FilterType = ftype;
        ViewBag.FilterKey = fkey;

        return View("BuyerPage", buyList);
    }

    // 판매자 페이지 (판매 목록)
    [HttpGet]
    [SessionAuthorize(RequireSeller = true)]
    public async Task<IActionResult> SellerPage(int page = 1)
    {
        var member = GetCurrentMember();

        // 페이지 번호 유효성 검증
        if (page < 1) page = 1;

        var sellList = await _purchaseService.GetSellListAsync(member.Mno, page);
        var totalCount = await _purchaseService.GetSellCountAsync(member.Mno);
        var totalPages = (int)Math.Ceiling(totalCount / 10.0);

        if (page > totalPages && totalPages > 0) page = totalPages;

        ViewBag.CurrentPage = page;
        ViewBag.TotalPages = totalPages;
        ViewBag.TotalCount = totalCount;

        return View(sellList);
    }

    // 판매 목록 검색
    [HttpGet]
    [SessionAuthorize(RequireSeller = true)]
    public async Task<IActionResult> SellerSearch(string ftype, string fkey)
    {
        var member = GetCurrentMember();

        var sellList = await _purchaseService.SearchSellListAsync(member.Mno, ftype, fkey ?? "");

        ViewBag.FilterType = ftype;
        ViewBag.FilterKey = fkey;

        return View("SellerPage", sellList);
    }
}
