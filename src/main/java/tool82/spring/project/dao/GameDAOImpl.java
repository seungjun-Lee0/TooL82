package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Product;

import java.util.List;

@Repository("gdao")
public class GameDAOImpl implements GameDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public List<Product> selectGame(int snum) {
        return sqlSession.selectList("game.selectGame", snum);
    }

    @Override
    public Product selectOneGame(String pno) {
        return sqlSession.selectOne("game.selectOne", pno);
    }

    @Override
    public int selectCountGame() {
        return sqlSession.selectOne("game.countGame");
    }

//    @Override
//    public String selectNxtGm(int snum) {
//        return sqlSession.selectOne("game.selectNext", snum);
//    }

}
