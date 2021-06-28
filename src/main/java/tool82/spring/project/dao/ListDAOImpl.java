package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;

import java.util.List;
import java.util.Map;

@Repository("ldao")
public class ListDAOImpl implements ListDAO {

    @Autowired private SqlSession sqlSession;


    @Override
    public List<Buylist> selectBuy(Map<String, Object> param) {
        return sqlSession.selectList("sellbuy.selectBuy", param);
    }

    @Override
    public List<Buylist> findSelectBuy(Map<String, Object> param) {
        return sqlSession.selectList("sellbuy.findSelectBuy", param);
    }

    @Override
    public List<Product> selectSell(Map<String, Object> param) {
        return sqlSession.selectList("sellbuy.selectSell", param);
    }

    @Override
    public List<Product> findSelectSell(Map<String, Object> param) {
        return sqlSession.selectList("sellbuy.findSelectSell", param);
    }

    @Override
    public int selectCountSell(String mno) {
        return sqlSession.selectOne("sellbuy.countSell", mno);
    }

    @Override
    public int selectCountSell(Map<String, Object> param) {
        return sqlSession.selectOne("sellbuy.findCountSell", param);
    }

    @Override
    public int selectCountBuy(String mno) {
        return sqlSession.selectOne("sellbuy.countBuy", mno);
    }

    @Override
    public int selectCountBuy(Map<String, Object> param) {
        return sqlSession.selectOne("sellbuy.findCountBuy", param);
    }

    @Override
    public int insertBuyList(Map<String, Object> params) {
        sqlSession.insert("sellbuy.insertBuyList", params);
        sqlSession.update("sellbuy.plusParty", params);
        return 0;
    }

    @Override
    public int countDuplicateItem(Map<String, Object> params) {
        return sqlSession.selectOne("sellbuy.duplicateCheck", params);
    }

}
