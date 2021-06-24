package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import tool82.spring.project.dao.SaleDAO;
import tool82.spring.project.util.ImgUploadUtil;
import tool82.spring.project.vo.Product;

import java.io.File;
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

        sdao.insertSale(p);

        return true;
    }

    @Override
    public Product readOneProd(String pno) {
        return sdao.selectOneProd(pno);
    }

    @Override
    public void modifySaleItem(Product p, MultipartFile[] img) {
        // 수정된 첨부이미지를 지정한 위치에 저장
        // 수정된 이미지파일의 정보를 테이블에 수정
        // 수정된 이미지가 첫 번째 이미지인 경우 다시 썸네일 생성 (선택사항)
        // 기존 이미지와 썸네일을 제거 (선택사항)

        String uuid = imgutil.makeUUID(); // 식별코드 생성

        // 첨부파일이 존재한다면
        if(imgutil.checkSaleFiles(img)){


            // 업로드한 이미지파일명을 저장하기 위해 동적배열 생성
            List<String> imgs = new ArrayList<>();

            // 첨부파일이 존재한다면 서버에 저장하고
            // 그 결과로 파일이름을 받아서 동적배열에 저장
            for(MultipartFile f : img) {
                if (!f.getOriginalFilename().isEmpty())
                    imgs.add(imgutil.ImageUpload(f, p.getUuid()));
                else
                    imgs.add("-/-");
            }

            // 기존 fnames를 읽어옴
            String fn = sdao.readFnames(p.getPno());

            // 새로 생성된 fnames를
            // 기존의 fnames에 수정
            String[] ofn = fn.split("[/]");

            String fnames = "";

            for (int i = 0; i < imgs.size(); ++i) {
                fnames += imgs.get(i).split("[/]")[0] + "/";
            }

            String[] nfn = fnames.split("[/]");

            // todie = 13
            // ofn[0].split()[0] = 새로수정된 파일1명
            // ofn[2].split()[2] = 새로수정된 파일2명
            String todie[] = new String[2];     // 삭제대상 파일이름

            for(int i=0; i < p.getTodie().length(); ++i){
                int pos = Integer.parseInt(p.getTodie().substring(i, i+1));
                ofn[pos-1] = nfn[i];    // 변경한 파일이름 저장
                todie[i] = fn.split("[/]")[pos-1];  // 삭제할 파일이름 저장
            }
            // 수정된 결과 확인
            //System.out.println(String.join("/", ofn));

            fnames = String.join("/", ofn);

            p.setFnames( fnames );

            // 이미지 파일과 썸네일 제거
            // abc123.png, uuid
            // => abc123uuid.png
            // => small_글번호_abc123uuid.png

            String fpath = "/opt/homebrew/var/www/cdn/";
            for (int i=0; i < todie.length; ++i){
                try {
                    int pos = todie[i].lastIndexOf(".");
                    String name = todie[i].substring(0, pos);
                    String ext = todie[i].substring(pos + 1);
                    String one = name + p.getUuid() + "." + ext;
                    // String two = "thumb/small_" + p.getPno() + "_" + one;

                    File f = new File(fpath + one);    // 이미지
                    f.delete();
                    //f = new File(fpath + two);         // 썸네일
                    //f.delete();
                }catch (Exception e){}

            }
        }

        // 수정된 내용 및 파일정보를 테이블에 저장
        sdao.updateSaleItem(p);

        // 업로드한 이미지들 중 첫번째 이미지를 썸내일로 만듬
//        String ofname = p.getFnames().split("/")[0];
//        int pos = ofname.lastIndexOf(".");
//        String fname = ofname.substring(0, pos);
//        String fext = ofname.substring(pos+1);
//        ofname = fname + p.getUuid() + "." + fext;


    }

}
