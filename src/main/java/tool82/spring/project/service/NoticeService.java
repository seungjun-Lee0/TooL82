package tool82.spring.project.service;

import tool82.spring.project.vo.Notice;

import java.util.List;

public interface NoticeService {

    boolean newNotice(Notice n);

    List<Notice> readNotice(String cp);
    List<Notice> readNotice(String cp, String ftype, String fkey);
    Notice readOneNotice(String bno);

    int countNotice();
    int countNotice(String ftype, String fkey);
    boolean viewCountNotice(String bno);

    String readPrvbno(String bno);
    String readNxtbno(String bno);
}
