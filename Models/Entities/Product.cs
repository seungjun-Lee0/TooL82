using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TooL82.Web.Models.Entities;

[Table("pdetail")]
public class Product
{
    [Key]
    [Column("pno")]
    public int Pno { get; set; }

    [Required]
    [MaxLength(50)]
    [Column("userid")]
    public string UserId { get; set; } = string.Empty;

    [Required]
    [MaxLength(10)]
    [Column("category")]
    public string Category { get; set; } = string.Empty;

    [Required]
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

    [Column("sdate")]
    public DateTime SDate { get; set; }

    [Column("edate")]
    public DateTime EDate { get; set; }

    [Column("oprice")]
    public int OPrice { get; set; }

    [Column("sprice")]
    public int SPrice { get; set; }

    [Column("contents")]
    public string? Contents { get; set; }

    [Column("fnames")]
    public string? FNames { get; set; }

    [MaxLength(50)]
    [Column("uuid")]
    public string? Uuid { get; set; }

    [Column("sellstat")]
    public int SellStat { get; set; }

    // Computed Properties (Not Mapped to DB)
    [NotMapped]
    public int PriceRate => OPrice > 0 ? (int)Math.Round(100 - ((double)SPrice / OPrice * 100)) : 0;

    [NotMapped]
    public int PartyRate => Party > 0 ? (int)Math.Round((double)CPartied / Party * 100) : 0;

    [NotMapped]
    public int LeftDays => (EDate.Date - DateTime.Today).Days;

    [NotMapped]
    public bool IsClosed => Party == CPartied || LeftDays < 0;

    // Navigation Property
    [ForeignKey("UserId")]
    public virtual Member? Member { get; set; }
}
