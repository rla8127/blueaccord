package com.shopping.toy.service.cs;


import com.shopping.toy.dao.cs.QuestionDao;
import com.shopping.toy.dao.member.MemberDao;
import com.shopping.toy.domain.cs.QuestionDto;
import com.shopping.toy.domain.search.SearchCondition;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class QuestionServiceImpl implements QuestionService {
    @Autowired
    QuestionDao questionDao;

    @Autowired
    MemberDao memberDao;

    @Override
    public List<QuestionDto> getSearchResultPage(SearchCondition sc) throws Exception {
        return questionDao.searchSelectPage(sc);
    }

    @Override
    public int getSearchResultCnt(SearchCondition sc) throws Exception {
        return questionDao.searchResultCnt(sc);
    }

    @Override
    public int getCount() throws Exception {
        return questionDao.count();
    }

    @Override
    public int delete(int question_id, int member_id) throws Exception {
        return questionDao.delete(question_id, member_id);
    }

    @Override
    public int write(QuestionDto questionDto) throws Exception {
        return questionDao.insert(questionDto);
    }

    @Override
    public List<QuestionDto> getList() throws Exception {
        return questionDao.selectAll();
    }

    @Override
    public QuestionDto read(Integer question_id) throws Exception {
        QuestionDto questionDto = questionDao.select(question_id);
        questionDao.increaseViewCnt(question_id);
        return questionDto;
    }

    @Override
    public List<QuestionDto> getPage(Map map) throws Exception {
        return questionDao.selectPage(map);
    }

    @Override
    public int modify(QuestionDto questionDto) throws Exception {
        return questionDao.update(questionDto);
    }

}
