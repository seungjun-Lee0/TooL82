using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Infrastructure;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

public class ProductController : Controller
{
    private readonly IProductService _productService;
    private readonly IPurchaseService _purchaseService;

    public ProductController(IProductService productService, IPurchaseService purchaseService)
    {
        _productService = productService;
        _purchaseService = purchaseService;
    }

    // 상품 목록 (카테고리별)
    [HttpGet]
    public async Task<IActionResult> List(string category = "g", int page = 1)
    {
        // 카테고리 유효성 검증
        var validCategories = new[] { "g", "m", "v", "u" };
        if (!validCategories.Contains(category.ToLower()))
        {
            category = "g";
        }

        // 페이지 번호 유효성 검증
        if (page < 1) page = 1;

        var products = await _productService.GetProductsAsync(category, page);
        var totalCount = await _productService.GetProductCountAsync(category);
        var totalPages = (int)Math.Ceiling(totalCount / 8.0);

        if (page > totalPages && totalPages > 0) page = totalPages;

        ViewBag.Category = category;
        ViewBag.CurrentPage = page;
        ViewBag.TotalPages = totalPages;
        ViewBag.TotalCount = totalCount;

        return View(products);
    }

    // 상품 상세
    [HttpGet]
    public async Task<IActionResult> Detail(int pno, string? category = null)
    {
        var product = await _productService.GetProductByIdAsync(pno, category);
        if (product == null)
            return NotFound();

        ViewBag.Category = category ?? product.Category;
        return View(product);
    }

    // 구매 신청 (공동구매 참여)
    [HttpPost]
    [SessionAuthorize]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Buy(int pno, string category, string title, DateTime edate, int sprice)
    {
        var member = HttpContext.Items["CurrentMember"] as Member;
        if (member == null)
        {
            TempData["ErrorMessage"] = "로그인이 필요합니다.";
            return RedirectToAction("Login", "Account");
        }

        // 마감일 검증
        if (edate <= DateTime.Now)
        {
            TempData["ErrorMessage"] = "이미 마감된 상품입니다.";
            return RedirectToAction("Detail", new { pno, category });
        }

        // 중복 구매 확인
        if (await _purchaseService.IsDuplicatePurchaseAsync(pno, member.Mno))
        {
            TempData["ErrorMessage"] = "이미 참여한 상품입니다.";
            return RedirectToAction("Detail", new { pno, category });
        }

        // 구매 처리
        var result = await _purchaseService.AddToBuyListAsync(pno, member.Mno, category, title, edate, sprice);

        if (result)
        {
            TempData["Message"] = "구매 신청이 완료되었습니다.";
            return RedirectToAction("BuyerPage", "Purchase");
        }

        TempData["ErrorMessage"] = "구매 신청에 실패했습니다.";
        return RedirectToAction("Detail", new { pno, category });
    }
}
