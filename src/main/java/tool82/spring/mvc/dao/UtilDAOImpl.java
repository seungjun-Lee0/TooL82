package tool82.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.mvc.vo.Product;

import java.util.List;
import java.util.Map;

@Repository("udao")
public class UtilDAOImpl implements UtilDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public List<Product> selectUtil(int snum) {
        return sqlSession.selectList("util.selectUtil", snum);
    }

    @Override
    public Product selectOneUtil(String pno) {
        return sqlSession.selectOne("util.selectOne", pno);
    }

    @Override
    public int selectCountUtil() {
        return sqlSession.selectOne("util.countUtil");
    }

}
