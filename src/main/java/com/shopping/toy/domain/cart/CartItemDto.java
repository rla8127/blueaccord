package com.shopping.toy.domain.cart;

import lombok.Data;

@Data
public class CartItemDto {

    private int cart_item_id;
    private int cart_id;
    private int ino;
    private int count;

    public CartItemDto(int cart_id, int ino, int count) {
        this.cart_id = cart_id;
        this.ino = ino;
        this.count = count;
    }
}
