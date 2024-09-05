using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Models;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

public class HomeController : Controller
{
    private readonly IProductService _productService;

    public HomeController(IProductService productService)
    {
        _productService = productService;
    }

    public async Task<IActionResult> Index()
    {
        var latestProducts = await _productService.GetLatestProductsAsync(8);
        return View(latestProducts);
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
