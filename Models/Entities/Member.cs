using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TooL82.Web.Models.Entities;

[Table("register")]
public class Member
{
    [Key]
    [Column("mno")]
    public int Mno { get; set; }

    [Required]
    [MaxLength(50)]
    [Column("name")]
    public string Name { get; set; } = string.Empty;

    [Required]
    [MaxLength(50)]
    [Column("userid")]
    public string UserId { get; set; } = string.Empty;

    [Required]
    [MaxLength(100)]
    [Column("passwd")]
    public string Passwd { get; set; } = string.Empty;

    [Required]
    [MaxLength(100)]
    [Column("email")]
    public string Email { get; set; } = string.Empty;

    [Column("regdate")]
    public DateTime RegDate { get; set; } = DateTime.Now;

    [MaxLength(1)]
    [Column("selleryn")]
    public string SellerYn { get; set; } = "N";

    // Navigation Properties
    public virtual ICollection<Product> Products { get; set; } = new List<Product>();
    public virtual ICollection<Buylist> Purchases { get; set; } = new List<Buylist>();
}
