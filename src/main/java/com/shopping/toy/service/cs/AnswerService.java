package com.shopping.toy.service.cs;

import com.shopping.toy.domain.cs.AnswerDto;

public interface AnswerService {
    void insert(AnswerDto answerDto) throws Exception;

    AnswerDto getAnswer(int question_id) throws Exception;

    int modify(AnswerDto answerDto) throws Exception;

    void delete(int answer_id, int question_id) throws Exception;
}
