package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Product;

import java.util.Map;

@Repository("sdao")
public class SaleDAOImpl implements SaleDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertSale(Map<String, Object> params) {
        return sqlSession.insert("sale.insertSale", params);
    }

    @Override
    public Product selectOneProd(String pno) {
        return sqlSession.selectOne("sale.selectOneProd", pno);
    }

    @Override
    public String readFnames(String pno) {
        return sqlSession.selectOne("sale.readFname", pno);
    }

    @Override
    public int updateSaleItem(Product p) {
        return sqlSession.update("sale.updateSaleItem", p);
    }

    @Override
    public int insertSaleList(Map<String, Object> param) {
        return sqlSession.update("sale.insertSaleList", param);
    }

    @Override
    public void deleteSaleItem(Map<String, Object> param) {
        sqlSession.delete("sale.deleteSaleItem", param );
    }
}
