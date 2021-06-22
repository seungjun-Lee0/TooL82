package tool82.spring.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tool82.spring.project.dao.NoticeDAO;
import tool82.spring.project.vo.Notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service("nsrv")
public class NoticeServiceImpl implements NoticeService {

    @Autowired private NoticeDAO ndao;

    @Override
    public boolean newNotice(Notice n) {
        boolean isInserted = false;
        if (ndao.insertNotice(n) > 0) isInserted = true;

        return isInserted;
    }

    @Override
    public List<Notice> readNotice(String cp) {
        int snum = 10*(Integer.parseInt(cp)-1);

        return ndao.selectNotice(snum);
    }

    @Override
    public List<Notice> readNotice(String cp, String ftype, String fkey) {
        int snum = 10*(Integer.parseInt(cp)-1);
        Map<String, Object> params = new HashMap<>();
        params.put("snum", snum);
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return ndao.findSelectNotice(params);
    }

    @Override
    public Notice readOneNotice(String bno) {
        return ndao.selectOneNotice(bno);
    }

    @Override
    public int countNotice() {
        return ndao.selectCountNotice();
    }

    @Override
    public int countNotice(String ftype, String fkey) {
        Map<String, Object> params = new HashMap<>();
        params.put("ftype", ftype);
        params.put("fkey", fkey);

        return ndao.selectCountNotice(params);
    }

    @Override
    public boolean viewCountNotice(String bno) {
        boolean isUpdated = false;
        if (ndao.viewCountNotice(bno) > 0) isUpdated = true;

        return isUpdated;
    }

    @Override
    public String readPrvbno(String bno) {
        return ndao.selectPrvbno(bno);
    }

    @Override
    public String readNxtbno(String bno) {
        return ndao.selectNxtbno(bno);
    }
}
