package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.GameDAO;
import tool82.spring.project.dao.MusicDAO;
import tool82.spring.project.vo.Product;

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
