package com.shopping.toy.dao.cart;

import com.shopping.toy.domain.cart.CartDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDaoImpl implements CartDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.cartMapper.";

    @Override
    public int insert(int member_id){
        return session.insert(namespace+"insert", member_id);
    }

    @Override
    public CartDto select(int member_id){
        return session.selectOne(namespace+"select", member_id);
    }

    @Override
    public int selectCartId(String id){
        return session.selectOne(namespace+"selectCartId", id);
    }

    @Override
    public int delete(int member_id){
        return session.delete(namespace+"delete", member_id);
    }
}
