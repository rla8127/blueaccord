package com.shopping.toy.service.cart;

import com.shopping.toy.domain.cart.CartListDto;

import java.util.List;

public interface CartService {
    // member_id를 통한 cart_id 조회하기
    int getCartId(String member_id);

    int insert(int cart_id, int item_id, int count) throws Exception;

    List<CartListDto> selectCartListAll(int cart_id) throws Exception;

    List<CartListDto> selectCartList(int cart_item_id) throws Exception;

    int delete(int cart_item_id) throws Exception;

    int update(int cart_id, int item_id, int count) throws Exception;

}
