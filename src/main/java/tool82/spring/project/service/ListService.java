package tool82.spring.project.service;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Sellist;

import java.util.List;
import java.util.Map;

public interface ListService {

    List<Sellist> readSell(String cp, String mno);
    List<Sellist> readSell(String cp, String mno, String ftype, String fkey);
    List<Buylist> readBuy(String cp, String mno);
    List<Buylist> readBuy(String cp, String mno, String ftype, String fkey);

    /*Sellist readSellUid(String mno);
    Buylist readBuyUid(String mno);*/

    int countSell(String mno);
    int countSell(String ftype, String fkey, String mno);
    int countBuy(String mno);
    int countBuy(String ftype, String fkey, String mno);


    void newBuyList(Map<String, Object> params);
    void modifyParty(String pno);
}
