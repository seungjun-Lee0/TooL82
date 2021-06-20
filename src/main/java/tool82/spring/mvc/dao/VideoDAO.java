package tool82.spring.mvc.dao;

import tool82.spring.mvc.vo.Product;

import java.util.List;
import java.util.Map;

public interface VideoDAO {

    List<Product> selectVideo(int snum);
    Product selectOneVideo(String pno);

    int selectCountVideo();

}
