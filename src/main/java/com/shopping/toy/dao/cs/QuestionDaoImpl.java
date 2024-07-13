package com.shopping.toy.dao.cs;

import com.shopping.toy.domain.cs.QuestionDto;
import com.shopping.toy.domain.search.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class QuestionDaoImpl implements QuestionDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.cs.questionMapper.";

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

    @Override
    public int deleteAll() {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int delete(int question_id, int member_id) throws Exception {
        Map map = new HashMap();
        map.put("question_id", question_id);
        map.put("member_id", member_id);
        return session.delete(namespace+"delete", map);
    }

    @Override
    public int deleteByAdmin(int question_id) throws Exception {
        return session.delete(namespace+"deleteByAdmin", question_id);
    }

    @Override
    public int insert(QuestionDto questionDto) throws Exception {
        return session.insert(namespace+"insert", questionDto);
    }

    @Override
    public List<QuestionDto> selectAll() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public QuestionDto select(Integer question_id) throws Exception {
        return session.selectOne(namespace + "select", question_id);
    }

    @Override
    public List<QuestionDto> selectPage(Map map) throws Exception {
        return session.selectList(namespace+"selectPage", map);
    }

    @Override
    public int update(QuestionDto dto) throws Exception {
        return session.update(namespace+"update", dto);
    }

    @Override
    public int increaseViewCnt(Integer question_id) throws Exception {
        return session.update(namespace+"increaseViewCnt", question_id);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"searchResultCnt", sc );
    }

    @Override
    public List<QuestionDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage", sc);
    }

    @Override
    public int updateCommentCnt(Integer question_id, int cnt) throws Exception {
        Map map = new HashMap();
        map.put("cnt", cnt);
        map.put("question_id", question_id);
        return session.update(namespace+"updateCommentCnt", map);

    }

}
