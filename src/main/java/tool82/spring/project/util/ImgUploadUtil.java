package tool82.spring.project.util;

import org.imgscalr.Scalr;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

@Component("imgutil")
public class ImgUploadUtil {

    private String uploadPath = "C:/Java/nginx-1.20.1/html/detail/";
    private String logoPath = "C:/Java/nginx-1.20.1/html/logo/";

    public boolean checkSaleFiles(MultipartFile[] img) {
        boolean isFiles = false;
        for(MultipartFile f : img) {
            if(!f.getOriginalFilename().isEmpty()) {
                isFiles = true;
                break;
            }
        }
        return isFiles;
    }


    public String ImageUpload(MultipartFile f, String uuid) {
        String ofname = f.getOriginalFilename();

        int pos = ofname.lastIndexOf(".");
        String nfame = ofname.substring(0, pos) + uuid + "." +
                        ofname.substring(pos+1);

        try {
            f.transferTo(new File(uploadPath + nfame));
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        return ofname;
    }

    public void logoResize(String fname, String id) {

        // 서버에 업로드된 파일이름 (썸내일 대상)
        String ofname = uploadPath + fname;
        // 업로드된 파일이름에서 확장자 부분 추출
        String imgtype = fname.substring(fname.lastIndexOf(".")+1);
        // 썸내일 이미지 이름 설정
        String tfname = logoPath + "small_" + id + "_" + fname;

        try {
            BufferedImage image = ImageIO.read(new File(ofname));

            int imgwidth = Math.min(image.getHeight(), image.getWidth());
            int imgheight = imgwidth;

            // 지정한 위치를 기준으로 잘라냄
            BufferedImage scaledImg = Scalr.crop( image,
                    (image.getWidth() - imgwidth) / 2,
                    (image.getHeight() - imgheight) / 2,
                    imgwidth, imgheight, null );

            // 잘라낸 이미지를 220x220으로 재조정
            BufferedImage resizedImg = Scalr.resize(
                    scaledImg, 40, 40, null);

            // 재조정한 이미지를 실제경로에 저장함
            ImageIO.write(resizedImg, imgtype, new File(tfname));

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public String makeUUID() {
        String fmt = "yyyyMMddHHmmss";
        SimpleDateFormat sdf = new SimpleDateFormat(fmt);

        return sdf.format(new Date());
    }

}
