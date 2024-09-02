using System.ComponentModel.DataAnnotations;

namespace TooL82.Web.Models.ViewModels;

public class RegisterViewModel
{
    [Required(ErrorMessage = "이름을 입력하세요")]
    [Display(Name = "이름")]
    public string Name { get; set; } = string.Empty;

    [Required(ErrorMessage = "아이디를 입력하세요")]
    [Display(Name = "아이디")]
    public string UserId { get; set; } = string.Empty;

    [Required(ErrorMessage = "비밀번호를 입력하세요")]
    [DataType(DataType.Password)]
    [Display(Name = "비밀번호")]
    public string Password { get; set; } = string.Empty;

    [Required(ErrorMessage = "비밀번호 확인을 입력하세요")]
    [DataType(DataType.Password)]
    [Compare("Password", ErrorMessage = "비밀번호가 일치하지 않습니다")]
    [Display(Name = "비밀번호 확인")]
    public string ConfirmPassword { get; set; } = string.Empty;

    [Required(ErrorMessage = "이메일을 입력하세요")]
    [EmailAddress(ErrorMessage = "올바른 이메일 형식이 아닙니다")]
    [Display(Name = "이메일")]
    public string Email { get; set; } = string.Empty;

    [Display(Name = "판매자 등록")]
    public bool IsSeller { get; set; }
}
