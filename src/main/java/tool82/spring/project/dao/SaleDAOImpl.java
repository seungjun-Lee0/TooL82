package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Product;

@Repository("sdao")
public class SaleDAOImpl implements SaleDAO {

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertSale(Product p) {
        return sqlSession.insert("sale.insertSale", p);
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
}
