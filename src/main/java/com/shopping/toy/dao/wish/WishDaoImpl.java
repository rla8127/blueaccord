package com.shopping.toy.dao.wish;

import com.shopping.toy.domain.wish.WishDto;
import com.shopping.toy.domain.wish.WishListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class WishDaoImpl implements WishDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.wishMapper.";
    
    @Override
    public int insert(int ino, int member_id) throws Exception{
        Map map = new HashMap();
        map.put("ino", ino);
        map.put("member_id", member_id);
        return session.insert(namespace+"insert", map);
    }

    @Override
    public WishDto select(int ino, int member_id) throws Exception{
        Map map = new HashMap();
        map.put("ino", ino);
        map.put("member_id", member_id);
        return session.selectOne(namespace+"select", map);
    }
    
//    @Override
//    public List<WishDto> selectList(int member_id) throws Exception{
//        return session.selectList(namespace+"selectList", member_id);
//    }

    @Override
    public int count(int member_id) throws Exception{
        return session.selectOne(namespace+"count", member_id);
    }

    @Override
    public List<WishListDto> selectWishList(int member_id) throws Exception{
        return session.selectList(namespace+"selectWishList", member_id);
    }

    @Override
    public int delete(int wish_id) throws Exception{
        return session.delete(namespace+"delete", wish_id);
    }


}
