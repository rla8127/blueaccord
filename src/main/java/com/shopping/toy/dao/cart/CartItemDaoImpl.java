package com.shopping.toy.dao.cart;

import com.shopping.toy.domain.cart.CartItemDto;
import com.shopping.toy.domain.cart.CartListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartItemDaoImpl implements CartItemDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.cartItemMapper.";

    @Override
    public int insert(CartItemDto cartItemDto){
        return session.insert(namespace+"insert", cartItemDto);
    }

    @Override
    public CartItemDto select(int cart_item_id){
        return session.selectOne(namespace+"select", cart_item_id);
    }

    @Override
    public CartItemDto selectCartItem(int cart_id, int item_id){
        Map map = new HashMap();
        map.put("item_id", item_id);
        map.put("cart_id", cart_id);
        return session.selectOne(namespace+"selectCartItem", map);
    }

    @Override
    public int addUpdate(CartItemDto cartItemDto){
        return session.update(namespace+"addUpdate", cartItemDto);
    }

    @Override
    public int update(CartItemDto cartItemDto){
        return session.update(namespace+"update", cartItemDto);
    }

    @Override
    public int delete(int cart_item_id){
        return session.delete(namespace+"delete", cart_item_id);
    }

    @Override
    public List<CartListDto> selectMyCartListAll(int cart_id){
        return session.selectList(namespace+"selectMyCartListAll", cart_id);
    }

    @Override
    public List<CartListDto> selectMyCartList(int cart_item_id) throws Exception{
        return session.selectList(namespace+"selectMyCartList", cart_item_id);
    }

    @Override
    public CartListDto selectMyCart(int cart_item_id) throws Exception{
        return session.selectOne(namespace+"selectMyCartList", cart_item_id);
    }

    @Override
    public int getCartItemId(CartItemDto cartItemDto){
        return session.selectOne(namespace+"getCartItemId", cartItemDto);
    }

}
