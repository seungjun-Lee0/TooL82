package tool82.spring.project.dao;


import tool82.spring.project.vo.Product;

import java.util.Map;

public interface SaleDAO {

    int insertSale(Map<String, Object> params);

    Product selectOneProd(String pno);

    String readFnames(String pno);

    int updateSaleItem(Product p);

    int insertSaleList(Map<String, Object> param);

    void deleteSaleItem(Map<String, Object> param);
}
