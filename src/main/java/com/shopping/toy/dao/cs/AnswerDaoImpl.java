package com.shopping.toy.dao.cs;

import com.shopping.toy.domain.cs.AnswerDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AnswerDaoImpl implements AnswerDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.cs.answerMapper.";

    @Override
    public int addAnswer(int question_id) throws Exception{
        return session.update(namespace+"addAnswer", question_id);
    }

    @Override
    public int delAnswer(int question_id) throws Exception{
        return session.update(namespace+"delAnswer", question_id);
    }

    @Override
    public int insert(AnswerDto answerDto) throws Exception{
        return session.insert(namespace+"insert", answerDto);
    }

    @Override
    public AnswerDto getAnswer(int question_id) throws Exception{
        return session.selectOne(namespace+"getAnswer", question_id);
    }

    @Override
    public int update(AnswerDto answerDto) throws Exception{
        return session.update(namespace+"update", answerDto);
    }

    @Override
    public int remove(int answer_id) throws Exception{
        return session.delete(namespace+"delete", answer_id);
    }
}
