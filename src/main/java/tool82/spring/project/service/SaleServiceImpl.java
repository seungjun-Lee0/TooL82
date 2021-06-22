package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tool82.spring.project.dao.SaleDAO;
import tool82.spring.project.util.ImgUploadUtil;
import tool82.spring.project.vo.Product;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Service("ssrv")
public class SaleServiceImpl implements SaleService {

    @Autowired private SaleDAO sdao;
    @Autowired private ImgUploadUtil imgutil;

    // with img
    @Override
    public boolean newSale(Product p, MultipartFile[] img) {
        String uuid = imgutil.makeUUID();

        if(imgutil.checkSaleFiles(img)) {
            // 업로드한 이미지파일명을 서버에 저장하기 위해 동적배열 생성
            List<String> imgs = new ArrayList<>();

            // 그 결과로 파일이름을 받아서 동적배열에 저장하기 위해
            // 하나하나 조사하기 시작.
            for (MultipartFile f : img) {
                if (!Objects.requireNonNull(f.getOriginalFilename()).isEmpty())
                    imgs.add(imgutil.ImageUpload(f, uuid));
                    // 업로드한 뒤 결과값은 '파일명/파일크기'로 넘어옴
                else
                    imgs.add("-/-");
                // 업로드를 하지 못한 경우는 '-/-'만 넘김
            } // for

            // 결과값을 테이블에 저장하기 위해
            // 파일명과 파일크기별로 분리해서
            // 단일변수에 저장한다
            String fnames = "";

            for (int i = 0; i < imgs.size(); ++i) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
            }
            // 조합한 문구들을 테이블에 각각 저장
            p.setFnames(fnames);
            p.setUuid(uuid);

        } // if

        int id = sdao.insertSale(p);

        String ofname = p.getFnames().split("/")[0];
        int pos = ofname.lastIndexOf(".");
        String fname = ofname.substring(0, pos);
        String fext = ofname.substring(pos+1);
        ofname = fname + uuid + "." + fext;

        imgutil.logoResize(ofname, id + "");

        return true;

    }

    // without img
//    @Override
//    public boolean newSale(Product p) {
//        boolean isInserted = false;
//        if (sdao.insertSale(p) > 0) isInserted = true;
//        return isInserted;
//    }

}
