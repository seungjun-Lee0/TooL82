using System.Text.Json;
using Microsoft.AspNetCore.Mvc;
using TooL82.Web.Infrastructure;
using TooL82.Web.Models.Entities;
using TooL82.Web.Models.ViewModels;
using TooL82.Web.Services.Interfaces;

namespace TooL82.Web.Controllers;

public class AccountController : Controller
{
    private readonly IMemberService _memberService;

    public AccountController(IMemberService memberService)
    {
        _memberService = memberService;
    }

    // 회원가입 약관 동의
    [HttpGet]
    public IActionResult RegAgree()
    {
        return View();
    }

    // 회원가입 폼
    [HttpGet]
    public IActionResult Register()
    {
        return View();
    }

    // 회원가입 처리
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Register(RegisterViewModel model)
    {
        if (!ModelState.IsValid)
            return View(model);

        var member = new Member
        {
            Name = model.Name,
            UserId = model.UserId,
            Passwd = model.Password,
            Email = model.Email,
            SellerYn = model.IsSeller ? "Y" : "N"
        };

        await _memberService.CreateMemberAsync(member);
        return RedirectToAction("Login");
    }

    // 아이디 중복 검사 (AJAX)
    [HttpGet]
    public async Task<IActionResult> CheckUserId(string uid)
    {
        var exists = await _memberService.CheckUserIdExistsAsync(uid);
        return Content(exists ? "1" : "0");
    }

    // 로그인 페이지
    [HttpGet]
    public IActionResult Login()
    {
        return View();
    }

    // 로그인 처리
    [HttpPost]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(LoginViewModel model)
    {
        if (!ModelState.IsValid)
            return View(model);

        var member = await _memberService.CheckLoginAsync(model.UserId, model.Password);

        if (member != null)
        {
            HttpContext.Session.SetString("MyInfo", JsonSerializer.Serialize(member));
            return RedirectToAction("Index", "Home");
        }

        TempData["ErrorMessage"] = "아이디 또는 비밀번호가 일치하지 않습니다!!";
        return View(model);
    }

    // 로그인 실패
    [HttpGet]
    public IActionResult LoginFail()
    {
        return View();
    }

    // 로그아웃
    [HttpGet]
    public IActionResult Logout()
    {
        HttpContext.Session.Clear();
        return RedirectToAction("Index", "Home");
    }

    // 마이페이지
    [HttpGet]
    [SessionAuthorize]
    public IActionResult MyPage()
    {
        var member = HttpContext.Items["CurrentMember"] as Member;
        return View(member);
    }

    // 정보 수정 페이지
    [HttpGet]
    [SessionAuthorize]
    public IActionResult ModifyInfo()
    {
        var member = HttpContext.Items["CurrentMember"] as Member;
        var model = new ModifyInfoViewModel
        {
            UserId = member?.UserId ?? "",
            Email = member?.Email ?? "",
            IsSeller = member?.SellerYn == "Y"
        };

        return View(model);
    }

    // 정보 수정 처리
    [HttpPost]
    [SessionAuthorize]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> ModifyInfo(ModifyInfoViewModel model)
    {
        if (!ModelState.IsValid)
            return View(model);

        var member = new Member
        {
            UserId = model.UserId,
            Passwd = model.Password,
            Email = model.Email,
            SellerYn = model.IsSeller ? "Y" : "N"
        };

        var result = await _memberService.UpdateMemberAsync(member);

        // 세션 업데이트
        var updatedMember = await _memberService.GetMemberByUserIdAsync(model.UserId);
        if (updatedMember != null)
        {
            HttpContext.Session.SetString("MyInfo", JsonSerializer.Serialize(updatedMember));
        }

        TempData["Message"] = result;
        return RedirectToAction("MyPage");
    }

    // 회원 탈퇴 페이지
    [HttpGet]
    [SessionAuthorize]
    public IActionResult Remove()
    {
        return View();
    }

    // 회원 탈퇴 처리
    [HttpPost]
    [SessionAuthorize]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Remove(string password)
    {
        var member = HttpContext.Items["CurrentMember"] as Member;
        if (member == null)
            return RedirectToAction("Login");

        var result = await _memberService.DeleteMemberAsync(member.UserId, password);

        if (result == "fail")
        {
            TempData["ErrorMessage"] = "현재 구매 또는 판매가 진행중인 상품이 있습니다. 확인 후 탈퇴를 진행해 주세요!";
            return RedirectToAction("RemoveFail");
        }

        HttpContext.Session.Clear();
        TempData["Message"] = "정상적으로 탈퇴되었습니다!";
        return RedirectToAction("Index", "Home");
    }

    // 회원 탈퇴 실패
    [HttpGet]
    public IActionResult RemoveFail()
    {
        return View();
    }
}
