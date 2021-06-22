package tool82.spring.project.dao;

import tool82.spring.project.vo.Product;

import java.util.List;
import java.util.Map;

public interface MusicDAO {

    List<Product> selectMusic(int snum);
    Product selectOneMusic(String pno);

    int selectCountMusic();


}
