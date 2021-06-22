package tool82.spring.project.dao;

import tool82.spring.project.vo.Product;

import java.util.List;
import java.util.Map;

public interface UtilDAO {

    List<Product> selectUtil(int snum);
    Product selectOneUtil(String pno);

    int selectCountUtil();

}
