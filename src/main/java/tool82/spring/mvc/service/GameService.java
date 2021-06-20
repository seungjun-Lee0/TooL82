package tool82.spring.mvc.service;

import tool82.spring.mvc.vo.Product;

import java.util.List;

public interface GameService {

    List<Product> readGame(String cp);
    Product readOneGame(String pno);

    int countGame();
//    String readNxtGm(String cp);

}
