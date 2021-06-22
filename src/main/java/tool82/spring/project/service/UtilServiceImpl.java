package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.MusicDAO;
import tool82.spring.project.dao.UtilDAO;
import tool82.spring.project.vo.Product;

import java.util.List;

@Service("usrv")
public class UtilServiceImpl implements UtilService {

    @Autowired private UtilDAO udao;

    @Override
    public List<Product> readUtil(String cp) {
        int snum = (Integer.parseInt(cp) - 1 ) * 8;
        return udao.selectUtil(snum);
    }

    @Override
    public Product readOneUtil(String pno) {
        return udao.selectOneUtil(pno);
    }

    @Override
    public int countUtil() {
        return udao.selectCountUtil();
    }
}
