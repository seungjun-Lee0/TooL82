package tool82.spring.project.dao;

import java.util.List;

public interface EmailDAO {


    int updateSussStat();
    int updateFailStat();
    int updateSussBuyStat();
    int updateFailBuyStat();

    void updateEmailStat();

    List<String> selectEmail();
    List<String> selectName();
    List<String> selectTitle();
}
