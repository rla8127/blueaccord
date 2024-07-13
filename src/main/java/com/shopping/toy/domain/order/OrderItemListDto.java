package com.shopping.toy.domain.order;

import lombok.Data;

@Data
public class OrderItemListDto {
    private int order_item_id;
    private int ino;
    private int order_id;
    private String item_nm;
    private int order_price;
    private int count;
    private String rep_img_url;
}
