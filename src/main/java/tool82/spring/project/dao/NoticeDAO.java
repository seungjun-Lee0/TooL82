package tool82.spring.project.dao;

import tool82.spring.project.vo.Notice;

import java.util.List;
import java.util.Map;

public interface NoticeDAO {

    int insertNotice(Notice n);

    List<Notice> selectNotice(int snum);
    List<Notice> findSelectNotice(Map<String, Object> param);
    Notice selectOneNotice(String bno);

    int selectCountNotice();
    int selectCountNotice(Map<String, Object> param);
    int viewCountNotice(String bno);

    String selectPrvbno(String bno);
    String selectNxtbno(String bno);
}
