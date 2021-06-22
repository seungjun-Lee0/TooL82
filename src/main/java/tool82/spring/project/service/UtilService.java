package tool82.spring.project.service;

import tool82.spring.project.vo.Product;

import java.util.List;

public interface UtilService {

    List<Product> readUtil(String cp);
    Product readOneUtil(String pno);

    int countUtil();

}
