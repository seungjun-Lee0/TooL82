package tool82.spring.project.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import tool82.spring.project.vo.Notice;

import java.util.List;
import java.util.Map;

@Repository("ndao")
public class NoticeDAOImpl implements NoticeDAO{

    @Autowired private SqlSession sqlSession;

    @Override
    public int insertNotice(Notice n) {
        return sqlSession.insert("board.insertNotice", n);
    }

    @Override
    public List<Notice> selectNotice(int snum) {
        return sqlSession.selectList("board.selectNotice", snum);
    }

    @Override
    public List<Notice> findSelectNotice(Map<String, Object> param) {
        return sqlSession.selectList("board.findSelect", param);
    }

    @Override
    public Notice selectOneNotice(String bno) {
        return sqlSession.selectOne("board.selectOne", bno);
    }

    @Override
    public int selectCountNotice() {
        return sqlSession.selectOne("board.countNotice");
    }

    @Override
    public int selectCountNotice(Map<String, Object> param) {
        return sqlSession.selectOne("board.findSelectCount", param);
    }

    // 조회수
    @Override
    public int viewCountNotice(String bno) {
        return sqlSession.update("board.viewNotice", bno);
    }

    @Override
    public String selectPrvbno(String bno) {
        return sqlSession.selectOne("board.selectPrev", bno);
    }

    @Override
    public String selectNxtbno(String bno) {
        return sqlSession.selectOne("board.selectNext", bno);
    }
}
