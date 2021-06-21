package tool82.spring.mvc.service;

import tool82.spring.mvc.vo.Product;

import java.util.List;

public interface VideoService {

    List<Product> readVideo(String cp);
    Product readOneVideo(String pno);

    int countVideo();

}
