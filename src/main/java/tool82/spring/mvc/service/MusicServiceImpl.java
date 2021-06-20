package tool82.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.mvc.dao.GameDAO;
import tool82.spring.mvc.dao.MusicDAO;
import tool82.spring.mvc.vo.Product;

import java.util.List;

@Service("msrv")
public class MusicServiceImpl implements MusicService {

    @Autowired private MusicDAO mdao;

    @Override
    public List<Product> readMusic(String cp) {
        int snum = (Integer.parseInt(cp) - 1 ) * 8;
        return mdao.selectMusic(snum);
    }

    @Override
    public Product readOneMusic(String pno) {
        return mdao.selectOneMusic(pno);
    }

    @Override
    public int countMusic() {
        return mdao.selectCountMusic();
    }
}
