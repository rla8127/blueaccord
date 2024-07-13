package com.shopping.toy.service.cart;

import com.shopping.toy.dao.cart.CartDao;
import com.shopping.toy.dao.cart.CartItemDao;
import com.shopping.toy.dao.item.ItemDao;
import com.shopping.toy.domain.cart.CartItemDto;
import com.shopping.toy.domain.cart.CartListDto;
import com.shopping.toy.domain.exception.OutOfStockException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    CartDao cartDao;

    @Autowired
    CartItemDao cartItemDao;

    @Autowired
    ItemDao itemDao;

    // member_id를 통한 cart_id 조회하기
    @Override
    public int getCartId(String id) {
        int cart_id = cartDao.selectCartId(id);
        return cart_id;
    }

    @Override
    public int insert(int cart_id, int ino, int count) throws Exception{
        CartItemDto cartItemDto = new CartItemDto(cart_id, ino, count);

        int stock = itemDao.getStock(ino);
        // 만약 현재 상품의 재고수량이, 사용자가 구입하고자 하는 수량보다 적다면
        if(stock < count){
            throw new OutOfStockException("상품의 재고가 부족 합니다. 현재 재고 수량: " + stock + ")");
        }

        // 만약 특정 상품을 이미 cart_id에 추가했다면, 개수만 update 한다.
        if(cartItemDao.selectCartItem(cart_id, ino)!= null) {
            cartItemDao.addUpdate(cartItemDto);
        }

        // 해당 상품을 처음 장바구니에 넣는 것이라면, 장바구니 항목을 생성한다.
        else {
            cartItemDao.insert(cartItemDto);
        }

        return cartItemDao.getCartItemId(cartItemDto);
    }

    @Override
    public int update(int cart_id, int ino, int count) throws Exception{

        int stock = itemDao.getStock(ino);
        // 만약 현재 상품의 재고수량이, 사용자가 구입하고자 하는 수량보다 적다면
        if(stock < count){
            throw new OutOfStockException("상품의 재고가 부족 합니다. 현재 재고 수량: " + stock + ")");
        }

        else {
            CartItemDto cartItemDto = new CartItemDto(cart_id, ino, count);
            return cartItemDao.update(cartItemDto);
        }
    }

    @Override
    public List<CartListDto> selectCartListAll(int cart_id) throws Exception{
        List<CartListDto> list = cartItemDao.selectMyCartListAll(cart_id);
        return list;
    }

    @Override
    public List<CartListDto> selectCartList(int cart_item_id) throws Exception{
        List<CartListDto> list = cartItemDao.selectMyCartList(cart_item_id);
        return list;
    }

    @Override
    public int delete(int cart_item_id) throws Exception{
        return cartItemDao.delete(cart_item_id);
    }



}
