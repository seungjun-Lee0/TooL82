package tool82.spring.project.dao;


import tool82.spring.project.vo.Product;

public interface SaleDAO {

    int insertSale(Product p);

    Product selectOneProd(String pno);

    String readFnames(String pno);

    int updateSaleItem(Product p);
}
