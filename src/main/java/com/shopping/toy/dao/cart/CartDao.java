package com.shopping.toy.dao.cart;

import com.shopping.toy.domain.cart.CartDto;

public interface CartDao {
    int insert(int member_id);

    CartDto select(int member_id);

    int delete(int member_id);

    int selectCartId(String id);

}
