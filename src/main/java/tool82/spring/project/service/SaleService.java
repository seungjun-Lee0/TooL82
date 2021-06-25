package tool82.spring.project.service;

import org.springframework.web.multipart.MultipartFile;
import tool82.spring.project.vo.Product;
import tool82.spring.project.vo.Sellist;

public interface SaleService {

    // with img
    boolean newSale(Product p, MultipartFile[] img);
    boolean newSaleList(Sellist sl);

    Product readOneProd(String pno);

    void modifySaleItem(Product p, MultipartFile[] img);
}
