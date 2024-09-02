using System.ComponentModel.DataAnnotations;

namespace TooL82.Web.Models.ViewModels;

public class ModifyInfoViewModel
{
    public string UserId { get; set; } = string.Empty;

    [Required(ErrorMessage = "비밀번호를 입력하세요")]
    [DataType(DataType.Password)]
    [Display(Name = "비밀번호")]
    public string Password { get; set; } = string.Empty;

    [Required(ErrorMessage = "이메일을 입력하세요")]
    [EmailAddress(ErrorMessage = "올바른 이메일 형식이 아닙니다")]
    [Display(Name = "이메일")]
    public string Email { get; set; } = string.Empty;

    [Display(Name = "판매자 등록")]
    public bool IsSeller { get; set; }
}
