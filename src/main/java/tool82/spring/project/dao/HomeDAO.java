package tool82.spring.project.dao;

import tool82.spring.project.vo.Notice;
import tool82.spring.project.vo.Product;

import java.util.List;

public interface HomeDAO {
    List<Product> selectList();
    List<Notice> selectNoticeList();
}
