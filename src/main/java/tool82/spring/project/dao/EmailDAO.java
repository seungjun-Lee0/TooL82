package tool82.spring.project.dao;

import tool82.spring.project.vo.Buylist;
import tool82.spring.project.vo.Member;
import tool82.spring.project.vo.Product;

import java.util.List;

public interface EmailDAO {

    List<Member> selectEmail(String buystat);

    int updateSussStat();
    int updateFailStat();
    int updateSussBuyStat();
    int updateFailBuyStat();

}
