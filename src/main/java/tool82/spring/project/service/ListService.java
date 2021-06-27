package tool82.spring.project.service;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;

import java.util.List;
import java.util.Map;

public interface ListService {

    List<Product> readSell(String cp, String mno);
    List<Product> readSell(String cp, String mno, String ftype, String fkey);
    List<Buylist> readBuy(String cp, String mno);
    List<Buylist> readBuy(String cp, String mno, String ftype, String fkey);

    int countSell(String mno);
    int countSell(String ftype, String fkey, String mno);
    int countBuy(String mno);
    int countBuy(String ftype, String fkey, String mno);


    int newBuyList(String pno, String mno, String category, String title,
                    String edate, String sprice);
    int duplicateCheck(String pno, String mno);
}
