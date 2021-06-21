package tool82.spring.mvc.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.mvc.dao.GameDAO;
import tool82.spring.mvc.vo.Product;

import java.util.List;

@Service("gsrv")
public class GameServiceImpl implements GameService {

    @Autowired private GameDAO gdao;

    @Override
    public List<Product> readGame(String cp) {
        int snum = (Integer.parseInt(cp) - 1 ) * 8;
        return gdao.selectGame(snum);
    }

    @Override
    public Product readOneGame(String pno) {
        return gdao.selectOneGame(pno);
    }

    @Override
    public int countGame() {
        return gdao.selectCountGame();
    }
//
//    @Override
//    public String readNxtGm(String cp) {
//        int snum = (Integer.parseInt(cp) - 1 ) * 8;
//        return gdao.selectNxtGm(snum);
//    }


}
