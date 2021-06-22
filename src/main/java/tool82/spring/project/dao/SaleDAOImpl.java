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
}
