package com.shopping.toy.service.cs;

import com.shopping.toy.dao.cs.AnswerDao;
import com.shopping.toy.dao.member.MemberDao;
import com.shopping.toy.domain.cs.AnswerDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AnswerServiceImpl implements AnswerService {

    @Autowired
    AnswerDao answerDao;

    @Autowired
    MemberDao memberDao;

    @Override
    public void insert(AnswerDto answerDto) throws Exception{
        answerDao.insert(answerDto);
        answerDao.addAnswer(answerDto.getQuestion_id());
    }

    @Override
    public AnswerDto getAnswer(int question_id) throws Exception{
        return answerDao.getAnswer(question_id);
    }

    @Override
    public int modify(AnswerDto answerDto) throws Exception{
        return answerDao.update(answerDto);
    }

    @Override
    public void delete(int answer_id, int question_id) throws Exception{
        answerDao.remove(answer_id);
        answerDao.delAnswer(question_id);
    }
}
