package com.shopping.toy.dao.cs;

import com.shopping.toy.domain.cs.AnswerDto;

public interface AnswerDao {
    int insert(AnswerDto answerDto) throws Exception;

    AnswerDto getAnswer(int question_id) throws Exception;

    int addAnswer(int question_id) throws Exception;

    int delAnswer(int question_id) throws Exception;

    int update(AnswerDto answerDto) throws Exception;

    int remove(int answer_id) throws Exception;
}
