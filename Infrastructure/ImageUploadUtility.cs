using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;

namespace TooL82.Web.Infrastructure;

public class ImageUploadUtility
{
    private readonly IWebHostEnvironment _environment;
    private readonly string _uploadPath;

    public ImageUploadUtility(IWebHostEnvironment environment)
    {
        _environment = environment;
        _uploadPath = Path.Combine(_environment.WebRootPath, "uploads");

        if (!Directory.Exists(_uploadPath))
            Directory.CreateDirectory(_uploadPath);
    }

    public static string MakeUuid()
    {
        return Guid.NewGuid().ToString("N");
    }

    public async Task<string?> UploadImageAsync(IFormFile file, int maxWidth = 800)
    {
        if (file == null || file.Length == 0)
            return null;

        var uuid = MakeUuid();
        var ext = Path.GetExtension(file.FileName).ToLower();
        var allowedExtensions = new[] { ".jpg", ".jpeg", ".png", ".gif", ".webp" };

        if (!allowedExtensions.Contains(ext))
            return null;

        var fileName = $"{uuid}{ext}";
        var filePath = Path.Combine(_uploadPath, fileName);

        try
        {
            using var image = await Image.LoadAsync(file.OpenReadStream());

            // 이미지 리사이징 (최대 너비 제한)
            if (image.Width > maxWidth)
            {
                var ratio = (double)maxWidth / image.Width;
                var newHeight = (int)(image.Height * ratio);
                image.Mutate(x => x.Resize(maxWidth, newHeight));
            }

            await image.SaveAsync(filePath);
            return fileName;
        }
        catch
        {
            // 이미지 처리 실패 시 원본 저장
            using var stream = new FileStream(filePath, FileMode.Create);
            await file.CopyToAsync(stream);
            return fileName;
        }
    }

    public async Task<List<string>> UploadImagesAsync(List<IFormFile> files, int maxWidth = 800)
    {
        var fileNames = new List<string>();

        foreach (var file in files)
        {
            var fileName = await UploadImageAsync(file, maxWidth);
            if (!string.IsNullOrEmpty(fileName))
                fileNames.Add(fileName);
        }

        return fileNames;
    }

    public bool DeleteImage(string fileName)
    {
        if (string.IsNullOrEmpty(fileName))
            return false;

        var filePath = Path.Combine(_uploadPath, fileName);
        if (System.IO.File.Exists(filePath))
        {
            System.IO.File.Delete(filePath);
            return true;
        }

        return false;
    }

    public void DeleteImages(string fileNames)
    {
        if (string.IsNullOrEmpty(fileNames))
            return;

        foreach (var fileName in fileNames.Split(','))
        {
            DeleteImage(fileName.Trim());
        }
    }
}
