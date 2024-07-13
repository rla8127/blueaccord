package com.shopping.toy.domain.cart;

import lombok.Data;

@Data
public class CartListDto {

    private int cart_id;
    private int cart_item_id;
    private int ino;
    private String item_nm;
    private int price;
    private int count;
    private String rep_img_url;

}
