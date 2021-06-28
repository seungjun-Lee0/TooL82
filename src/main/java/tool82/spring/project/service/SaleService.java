package tool82.spring.project.service;

import org.springframework.web.multipart.MultipartFile;
import tool82.spring.project.vo.Product;

public interface SaleService {

    // with img
    boolean newSale(Product p, MultipartFile[] img, String mno);
    boolean newSaleList(Product p, String mno);

    Product readOneProd(String pno);

    void modifySaleItem(Product p, MultipartFile[] img);

    void deleteSale(String pno, String mno);
}
