package tool82.spring.project.service;

import tool82.spring.project.vo.Product;

import java.util.List;

public interface MusicService {

    List<Product> readMusic(String cp);
    Product readOneMusic(String pno);

    int countMusic();

}
