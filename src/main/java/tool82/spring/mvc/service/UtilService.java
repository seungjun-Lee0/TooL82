package tool82.spring.mvc.service;

import tool82.spring.mvc.vo.Product;

import java.util.List;

public interface UtilService {

    List<Product> readUtil(String cp);
    Product readOneUtil(String pno);

    int countUtil();

}
