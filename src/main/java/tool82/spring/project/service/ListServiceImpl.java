package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.GameDAO;
import tool82.spring.project.dao.ListDAO;
import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;
import tool82.spring.project.vo.Sellist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("lsrv")
public class ListServiceImpl implements ListService {

    @Autowired private ListDAO ldao;

    @Override
    public List<Sellist> readSell(String cp) {
        int snum = (Integer.parseInt(cp) - 1 ) * 10;
        return ldao.selectSell(snum);
    }

    @Override
    public List<Sellist> readSell(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 10;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return ldao.findSelectSell(params);
    }

    @Override
    public List<Buylist> readBuy(String cp) {
        int snum = (Integer.parseInt(cp) - 1) * 10;
        return ldao.selectBuy(snum);
    }

    @Override
    public List<Buylist> readBuy(String cp, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 10;
        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);
        return ldao.findSelectBuy(params);
    }

    @Override
    public Sellist readSellUid(String mno) {
        return ldao.selectOneSellUid(mno);
    }

    @Override
    public Buylist readBuyUid(String mno) {
        return ldao.selectOneBuyUid(mno);
    }

    @Override
    public int countSell() {
        return ldao.selectCountSell();
    }

    @Override
    public int countSell(String ftype, String fkey) {
        return ldao.selectCountSell();
    }

    @Override
    public int countBuy() {
        return ldao.selectCountBuy();
    }

    @Override
    public int countBuy(String ftype, String fkey) {
        return ldao.selectCountBuy();
    }

}
