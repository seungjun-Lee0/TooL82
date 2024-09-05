using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

public class SaleController : Controller
{
    private readonly ISaleService _saleService;
    private readonly IWebHostEnvironment _environment;

    public SaleController(ISaleService saleService, IWebHostEnvironment environment)
    {
        _saleService = saleService;
        _environment = environment;
    }

    // 판매자 확인 필터
    private Member? GetCurrentMember()
    {
        var memberJson = HttpContext.Session.GetString("MyInfo");
        if (string.IsNullOrEmpty(memberJson))
            return null;

        return JsonSerializer.Deserialize<Member>(memberJson);
    }

    private bool IsSeller()
    {
        var member = GetCurrentMember();
        return member?.SellerYn == "Y";
    }

    // 상품 등록 페이지
    [HttpGet]
    public IActionResult Create()
    {
        if (!IsSeller())
        {
            TempData["ErrorMessage"] = "판매자만 상품을 등록할 수 있습니다.";
            return RedirectToAction("MyPage", "Account");
        }

        return View();
    }

    // 상품 등록 처리
    [HttpPost]
    public async Task<IActionResult> Create(Product product, List<IFormFile> files)
    {
        var member = GetCurrentMember();
        if (member == null || member.SellerYn != "Y")
        {
            TempData["ErrorMessage"] = "판매자만 상품을 등록할 수 있습니다.";
            return RedirectToAction("MyPage", "Account");
        }

        // 파일 업로드 처리
        var fileNames = new List<string>();
        if (files != null && files.Count > 0)
        {
            var uploadPath = Path.Combine(_environment.WebRootPath, "uploads");
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    var uuid = Guid.NewGuid().ToString("N");
                    var ext = Path.GetExtension(file.FileName);
                    var fileName = $"{uuid}{ext}";
                    var filePath = Path.Combine(uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }

                    fileNames.Add(fileName);
                }
            }
        }

        product.UserId = member.UserId;
        product.FNames = string.Join(",", fileNames);
        product.Uuid = Guid.NewGuid().ToString("N").Substring(0, 8);

        var result = await _saleService.CreateProductAsync(product, member.Mno);

        if (result)
        {
            TempData["Message"] = "상품이 등록되었습니다.";
            return RedirectToAction("SellerPage", "Purchase");
        }

        TempData["ErrorMessage"] = "상품 등록에 실패했습니다.";
        return View(product);
    }

    // 상품 수정 페이지
    [HttpGet]
    public async Task<IActionResult> Edit(int pno)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        var product = await _saleService.GetProductForEditAsync(pno);
        if (product == null)
            return NotFound();

        if (product.UserId != member.UserId)
        {
            TempData["ErrorMessage"] = "수정 권한이 없습니다.";
            return RedirectToAction("SellerPage", "Purchase");
        }

        return View(product);
    }

    // 상품 수정 처리
    [HttpPost]
    public async Task<IActionResult> Edit(Product product, List<IFormFile> files, bool deleteFiles = false)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        // 새 파일 업로드
        if (files != null && files.Count > 0)
        {
            var uploadPath = Path.Combine(_environment.WebRootPath, "uploads");
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            var fileNames = new List<string>();
            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    var uuid = Guid.NewGuid().ToString("N");
                    var ext = Path.GetExtension(file.FileName);
                    var fileName = $"{uuid}{ext}";
                    var filePath = Path.Combine(uploadPath, fileName);

                    using (var stream = new FileStream(filePath, FileMode.Create))
                    {
                        await file.CopyToAsync(stream);
                    }

                    fileNames.Add(fileName);
                }
            }

            product.FNames = string.Join(",", fileNames);
        }
        else if (deleteFiles)
        {
            product.FNames = "";
        }

        product.Uuid = Guid.NewGuid().ToString("N").Substring(0, 8);

        var result = await _saleService.UpdateProductAsync(product);

        if (result)
        {
            TempData["Message"] = "상품이 수정되었습니다.";
            return RedirectToAction("SellerPage", "Purchase");
        }

        TempData["ErrorMessage"] = "상품 수정에 실패했습니다.";
        return View(product);
    }

    // 상품 삭제
    [HttpPost]
    public async Task<IActionResult> Delete(int pno)
    {
        var member = GetCurrentMember();
        if (member == null)
            return RedirectToAction("Login", "Account");

        var result = await _saleService.DeleteProductAsync(pno, member.Mno);

        if (result)
        {
            TempData["Message"] = "상품이 삭제되었습니다.";
        }
        else
        {
            TempData["ErrorMessage"] = "상품 삭제에 실패했습니다.";
        }

        return RedirectToAction("SellerPage", "Purchase");
    }
}
