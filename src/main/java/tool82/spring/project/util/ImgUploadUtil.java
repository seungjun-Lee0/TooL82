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

    private String uploadPath = "/opt/homebrew/var/www/cdn/";

    public boolean checkSaleFiles(MultipartFile[] img) {
        boolean isFiles = false;
        for(MultipartFile f : img) {
            if(!f.getOriginalFilename().isEmpty()) {
                isFiles = true;
                break;
            }
        }
        System.out.println(">>>" +isFiles);
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

    public String makeUUID() {
        String fmt = "yyyyMMddHHmmss";
        SimpleDateFormat sdf = new SimpleDateFormat(fmt);

        return sdf.format(new Date());
    }

}
