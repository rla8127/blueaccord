package com.shopping.toy.service.cs;

import com.shopping.toy.domain.cs.QuestionDto;
import com.shopping.toy.domain.search.SearchCondition;

import java.util.List;
import java.util.Map;

public interface QuestionService {
    int getCount() throws Exception;

    int delete(int question_id, int member_id) throws Exception;

    int write(QuestionDto questionDto) throws Exception;

    List<QuestionDto> getList() throws Exception;

    QuestionDto read(Integer question_id) throws Exception;

    List<QuestionDto> getPage(Map map) throws Exception;

    int modify(QuestionDto questionDto) throws Exception;

    List<QuestionDto> getSearchResultPage(SearchCondition sc) throws Exception;

    int getSearchResultCnt(SearchCondition sc) throws Exception;
}
