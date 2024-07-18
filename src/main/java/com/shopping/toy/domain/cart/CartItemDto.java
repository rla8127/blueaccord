package com.shopping.toy.domain.cart;

import lombok.Data;

@Data
public class CartItemDto {

    private int cart_item_id;
    private int cart_id;
    private int item_id;
    private int count;

    public CartItemDto(int cart_id, int item_id, int count) {
        this.cart_id = cart_id;
        this.item_id = item_id;
        this.count = count;
    }
}
