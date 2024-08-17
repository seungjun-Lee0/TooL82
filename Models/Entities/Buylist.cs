using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TooL82.Web.Models.Entities;

[Table("buylist")]
public class Buylist
{
    [Key]
    [Column("buyno")]
    public int BuyNo { get; set; }

    [Column("pno")]
    public int Pno { get; set; }

    [Column("mno")]
    public int Mno { get; set; }

    [Required]
    [MaxLength(50)]
    [Column("userid")]
    public string UserId { get; set; } = string.Empty;

    [MaxLength(10)]
    [Column("category")]
    public string Category { get; set; } = string.Empty;

    [MaxLength(200)]
    [Column("title")]
    public string Title { get; set; } = string.Empty;

    [Column("party")]
    public int Party { get; set; }

    [Column("cpartied")]
    public int CPartied { get; set; }

    [MaxLength(100)]
    [Column("email")]
    public string? Email { get; set; }

    [Column("bdate")]
    public DateTime BDate { get; set; }

    [Column("edate")]
    public DateTime EDate { get; set; }

    [Column("sprice")]
    public int SPrice { get; set; }

    [Column("buystat")]
    public int BuyStat { get; set; }

    // Navigation Properties
    [ForeignKey("Pno")]
    public virtual Product? Product { get; set; }

    [ForeignKey("Mno")]
    public virtual Member? Member { get; set; }
}
