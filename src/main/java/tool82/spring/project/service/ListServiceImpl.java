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
    public List<Sellist> readSell(String cp, String mno) {
        int snum = (Integer.parseInt(cp) - 1 ) * 10;

        Map<String, Object> params = new HashMap<>();

        params.put("MNO", mno);
        params.put("snum", snum);

        return ldao.selectSell(params);
    }

    @Override
    public List<Sellist> readSell(String cp, String mno, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 10;

        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);
        params.put("MNO", mno);

        return ldao.findSelectSell(params);
    }

    @Override
    public List<Buylist> readBuy(String cp, String mno) {
        int snum = (Integer.parseInt(cp) - 1) * 10;

        Map<String, Object> params = new HashMap<>();
        params.put("MNO", mno);
        params.put("snum", snum);

        return ldao.selectBuy(params);
    }

    @Override
    public List<Buylist> readBuy(String cp, String mno, String ftype, String fkey) {
        int snum = (Integer.parseInt(cp) - 1) * 10;
        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);
        params.put("MNO", mno);
        return ldao.findSelectBuy(params);
    }

  /*  @Override
    public Sellist readSellUid(String mno) {
        return ldao.selectOneSellUid(mno);
    }

    @Override
    public Buylist readBuyUid(String mno) {
        return ldao.selectOneBuyUid(mno);
    }*/

    @Override
    public int countSell(String mno) {
        return ldao.selectCountSell(mno);
    }

    @Override
    public int countSell(String ftype, String fkey, String mno) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);
        params.put("MNO", mno);
        return ldao.selectCountSell(params);
    }

    @Override
    public int countBuy(String mno) {
        return ldao.selectCountBuy(mno);
    }

    @Override
    public int countBuy(String ftype, String fkey, String mno) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);
        params.put("MNO", mno);
        return ldao.selectCountBuy(params);
    }

    @Override
    public void newBuyList(Map<String, Object> params) {

    }

    @Override
    public void modifyParty(String pno) {

    }

}
