package com.shopping.toy.dao.cart;

import com.shopping.toy.domain.cart.CartItemDto;
import com.shopping.toy.domain.cart.CartListDto;

import java.util.List;

public interface CartItemDao {
    int insert(CartItemDto cartItemDto);

    CartItemDto select(int cart_item_id);

    int delete(int cart_item_id);

    CartItemDto selectCartItem(int cart_id, int item_id);

    List<CartListDto> selectMyCartList(int cart_item_id) throws Exception;

    CartListDto selectMyCart(int cart_item_id) throws Exception;

    int update(CartItemDto cartItemDto);

    int addUpdate(CartItemDto cartItemDto);

    List<CartListDto> selectMyCartListAll(int cart_id);

    int getCartItemId(CartItemDto cartItemDto);
}
