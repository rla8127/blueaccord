package com.shopping.toy.domain.order;
import lombok.Data;

@Data
public class OrderItemDto {

    private int order_item_id;
    private int order_id;
    private int item_id;
    private int order_price;
    private int count;


}
