package tool82.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.mvc.vo.Product;

import java.util.List;
import java.util.Map;

@Repository("vdao")
public class VideoDAOImpl implements VideoDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public List<Product> selectVideo(int snum) {
        return sqlSession.selectList("video.selectVideo", snum);
    }

    @Override
    public Product selectOneVideo(String pno) {
        return sqlSession.selectOne("video.selectOne", pno);
    }

    @Override
    public int selectCountVideo() {
        return sqlSession.selectOne("video.countVideo");
    }

}
