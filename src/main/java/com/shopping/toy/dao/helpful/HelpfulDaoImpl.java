package com.shopping.toy.dao.helpful;


import com.shopping.toy.domain.helpful.HelpfulDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpfulDaoImpl implements HelpfulDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.helpfulMapper.";

    @Override
    public boolean hasMarkedHelpful(HelpfulDto helpfulDto) throws Exception{
        int count = session.selectOne(namespace+"count", helpfulDto);
        if(count == 1){
            return true;
        }
        else
            return false;
    }

    @Override
    public int insert(HelpfulDto helpfulDto) throws Exception{
        return session.insert(namespace+"insert", helpfulDto);
    }

    @Override
    public int delete(HelpfulDto helpfulDto) throws Exception{
        return session.delete(namespace+"delete", helpfulDto);
    }

}
