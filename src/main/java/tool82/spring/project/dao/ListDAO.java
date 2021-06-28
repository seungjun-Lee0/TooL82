package tool82.spring.project.dao;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;

import java.util.List;
import java.util.Map;

public interface ListDAO {

    List<Product> selectSell(Map<String, Object> param);
    List<Product> findSelectSell(Map<String, Object> param);
    List<Buylist> selectBuy(Map<String, Object> param);
    List<Buylist> findSelectBuy(Map<String, Object> param);

    int selectCountSell(String mno);
    int selectCountSell(Map<String, Object> param);
    int selectCountBuy(String mno);
    int selectCountBuy(Map<String, Object> param);

    int insertBuyList(Map<String, Object> params);
    int countDuplicateItem(Map<String, Object> params);

}
