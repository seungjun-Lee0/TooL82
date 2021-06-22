package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.HomeDAOImpl;
import tool82.spring.project.vo.Notice;
import tool82.spring.project.vo.Product;

import java.util.List;

@Service("hsrv")
public class HomeServiceImpl implements HomeService{

    @Autowired private HomeDAOImpl hdao;

    @Override
    public List<Product> readList() {
        return hdao.selectList();
    }

    @Override
    public List<Notice> readNoticeList() {
        return hdao.selectNoticeList();
    }
}
