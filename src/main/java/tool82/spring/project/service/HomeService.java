package tool82.spring.project.service;

import tool82.spring.project.vo.Notice;
import tool82.spring.project.vo.Product;

import java.util.List;

public interface HomeService {

    List<Product> readList();
    List<Notice>  readNoticeList();
}
