package tool82.spring.project.dao;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Product;

import java.util.List;
import java.util.Map;

public interface GameDAO {

    List<Product> selectGame(int snum);
    Product selectOneGame(String pno);

    int selectCountGame();


}
