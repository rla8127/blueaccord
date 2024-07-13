package com.shopping.toy.domain.order;

import com.shopping.toy.constant.OrderStatus;
import lombok.AllArgsConstructor;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class OrderDto {

    private int order_id;
    private int member_id;
    private String orderer_name;
    private String orderer_email;
    private String orderer_phone;
    private String recipient_name;
    private String recipient_address;
    private String recipient_phone;
    private String order_message;
    private int total_price;
    private Timestamp order_date;
    private OrderStatus order_status;

}
