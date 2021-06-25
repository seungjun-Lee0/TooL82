package tool82.spring.project.dao;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Sellist;

import java.util.List;
import java.util.Map;

public interface ListDAO {

    List<Sellist> selectSell(Map<String, Object> param);
    List<Sellist> findSelectSell(Map<String, Object> param);
    List<Buylist> selectBuy(Map<String, Object> param);
    List<Buylist> findSelectBuy(Map<String, Object> param);

    Sellist selectOneSellUid(String mno);
    Buylist selectOneBuyUid(String mno);

    int selectCountSell();
    int selectCountSell(Map<String, Object> param);
    int selectCountBuy();
    int selectCountBuy(Map<String, Object> param);

}
