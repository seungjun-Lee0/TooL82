package tool82.spring.project.service;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Sellist;

import java.util.List;

public interface ListService {

    List<Sellist> readSell(String cp, String mno);
    List<Sellist> readSell(String cp, String ftype, String fkey);
    List<Buylist> readBuy(String cp, String mno);
    List<Buylist> readBuy(String cp, String ftype, String fkey);

    Sellist readSellUid(String mno);
    Buylist readBuyUid(String mno);

    int countSell();
    int countSell(String ftype, String fkey);
    int countBuy();
    int countBuy(String ftype, String fkey);


}
