package tool82.spring.mvc.service;

import tool82.spring.mvc.vo.Product;

import java.util.List;

public interface MusicService {

    List<Product> readMusic(String cp);
    Product readOneMusic(String pno);

    int countMusic();

}
