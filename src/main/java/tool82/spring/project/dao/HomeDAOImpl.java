package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.service.HomeService;
import tool82.spring.project.vo.Notice;
import tool82.spring.project.vo.Product;

import java.util.List;

@Repository("hdao")
public class HomeDAOImpl implements HomeDAO{

    @Autowired private SqlSession sqlSession;

    @Override
    public List<Product> selectList() {
        return sqlSession.selectList("home.selectList");
    }

    @Override
    public List<Notice> selectNoticeList() {
        return sqlSession.selectList("home.selectNoticeList");
    }
}
