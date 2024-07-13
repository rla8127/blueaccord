package com.shopping.toy.dao.cs;

import com.shopping.toy.domain.cs.QuestionDto;
import com.shopping.toy.domain.search.SearchCondition;

import java.util.List;
import java.util.Map;

public interface QuestionDao {
    int count() throws Exception;

    int deleteAll();

    int delete(int question_id, int member_id) throws Exception;

    int deleteByAdmin(int question_id) throws Exception;

    int insert(QuestionDto dto) throws Exception;

    List<QuestionDto> selectAll() throws Exception;

    QuestionDto select(Integer question_id) throws Exception;

    List<QuestionDto> selectPage(Map map) throws Exception;

    int update(QuestionDto dto) throws Exception;

    int updateCommentCnt(Integer question_id, int cnt) throws Exception;

    int increaseViewCnt(Integer question_id) throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;

    List<QuestionDto> searchSelectPage(SearchCondition sc) throws Exception;
}
