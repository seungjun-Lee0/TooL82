package tool82.spring.mvc.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.mvc.vo.Product;

import java.util.List;
import java.util.Map;

@Repository("mdao")
public class MusicDAOImpl implements MusicDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public List<Product> selectMusic(int snum) {
        return sqlSession.selectList("music.selectMusic", snum);
    }

    @Override
    public Product selectOneMusic(String pno) {
        return sqlSession.selectOne("music.selectOne", pno);
    }

    @Override
    public int selectCountMusic() {
        return sqlSession.selectOne("music.countMusic");
    }

}
