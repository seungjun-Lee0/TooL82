package tool82.spring.mvc.dao;

import tool82.spring.mvc.vo.Product;

import java.util.List;
import java.util.Map;

public interface MusicDAO {

    List<Product> selectMusic(int snum);
    Product selectOneMusic(String pno);

    int selectCountMusic();


}
