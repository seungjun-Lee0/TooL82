package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.GameDAO;
import tool82.spring.project.vo.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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




}
