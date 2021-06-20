package tool82.spring.mvc.dao;

import tool82.spring.mvc.vo.Product;

import java.util.List;

public interface GameDAO {

    List<Product> selectGame(int snum);
    Product selectOneGame(String pno);

    int selectCountGame();
//    String selectNxtGm(int snum);

}
