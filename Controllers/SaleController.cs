using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Infrastructure;
using TooL82.Web.Models.Entities;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

[SessionAuthorize(RequireSeller = true)]
public class SaleController : Controller
{
    private readonly ISaleService _saleService;
    private readonly IWebHostEnvironment _environment;
    private const long MaxFileSize = 10 * 1024 * 1024; // 10MB
    private static readonly string[] AllowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".webp" };

    public SaleController(ISaleService saleService, IWebHostEnvironment environment)
    {
        _saleService = saleService;
        _environment = environment;
    }

    private Member GetCurrentMember()
    {
        return (HttpContext.Items["CurrentMember"] as Member)!;
    }

    // 상품 등록 페이지
    [HttpGet]
    public IActionResult Create()
    {
        return View();
    }

    // 상품 등록 처리
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Create(Product product, List<IFormFile> files)
    {
        var member = GetCurrentMember();

        // 서버 측 유효성 검증
        if (product.Party < 10)
        {
            ModelState.AddModelError("Party", "공동구매 인원은 최소 10명 이상이어야 합니다.");
            return View(product);
        }

        if (product.SPrice >= product.OPrice)
        {
            ModelState.AddModelError("SPrice", "판매가는 정가보다 낮아야 합니다.");
            return View(product);
        }

        if (product.EDate <= DateTime.Now)
        {
            ModelState.AddModelError("EDate", "마감일은 현재 시간 이후여야 합니다.");
            return View(product);
        }

        // 파일 업로드 처리
        var fileNames = new List<string>();
        if (files != null && files.Count > 0)
        {
            if (files.Count > 5)
            {
                ModelState.AddModelError("", "최대 5개의 파일만 업로드할 수 있습니다.");
                return View(product);
            }

            var uploadPath = Path.Combine(_environment.WebRootPath, "uploads");
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    // 파일 크기 검증
                    if (file.Length > MaxFileSize)
                    {
                        ModelState.AddModelError("", $"파일 '{file.FileName}'의 크기가 10MB를 초과합니다.");
                        return View(product);
                    }

                    // 확장자 검증
                    var ext = Path.GetExtension(file.FileName).ToLowerInvariant();
                    if (!AllowedExtensions.Contains(ext))
                    {
                        ModelState.AddModelError("", $"허용되지 않는 파일 형식입니다: {ext}");
                        return View(product);
                    }

                    var uuid = Guid.NewGuid().ToString("N");
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
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Edit(Product product, List<IFormFile> files, bool deleteFiles = false)
    {
        var member = GetCurrentMember();

        // 권한 재검증
        var existingProduct = await _saleService.GetProductForEditAsync(product.Pno);
        if (existingProduct == null || existingProduct.UserId != member.UserId)
        {
            TempData["ErrorMessage"] = "수정 권한이 없습니다.";
            return RedirectToAction("SellerPage", "Purchase");
        }

        // 새 파일 업로드
        if (files != null && files.Count > 0)
        {
            if (files.Count > 5)
            {
                ModelState.AddModelError("", "최대 5개의 파일만 업로드할 수 있습니다.");
                return View(product);
            }

            var uploadPath = Path.Combine(_environment.WebRootPath, "uploads");
            if (!Directory.Exists(uploadPath))
                Directory.CreateDirectory(uploadPath);

            var fileNames = new List<string>();
            foreach (var file in files)
            {
                if (file.Length > 0)
                {
                    if (file.Length > MaxFileSize)
                    {
                        ModelState.AddModelError("", $"파일 '{file.FileName}'의 크기가 10MB를 초과합니다.");
                        return View(product);
                    }

                    var ext = Path.GetExtension(file.FileName).ToLowerInvariant();
                    if (!AllowedExtensions.Contains(ext))
                    {
                        ModelState.AddModelError("", $"허용되지 않는 파일 형식입니다: {ext}");
                        return View(product);
                    }

                    var uuid = Guid.NewGuid().ToString("N");
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
        else
        {
            // 기존 파일 유지
            product.FNames = existingProduct.FNames;
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
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Delete(int pno)
    {
        var member = GetCurrentMember();

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
