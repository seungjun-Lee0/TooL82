package tool82.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.mvc.dao.MusicDAO;
import tool82.spring.mvc.dao.VideoDAO;
import tool82.spring.mvc.vo.Product;

import java.util.List;

@Service("vsrv")
public class VideoServiceImpl implements VideoService {

    @Autowired private VideoDAO vdao;

    @Override
    public List<Product> readVideo(String cp) {
        int snum = (Integer.parseInt(cp) - 1 ) * 8;
        return vdao.selectVideo(snum);
    }

    @Override
    public Product readOneVideo(String pno) {
        return vdao.selectOneVideo(pno);
    }

    @Override
    public int countVideo() {
        return vdao.selectCountVideo();
    }
}
