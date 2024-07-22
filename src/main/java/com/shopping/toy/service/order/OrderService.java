package com.shopping.toy.service.order;

import com.shopping.toy.domain.order.OrderDto;
import com.shopping.toy.domain.order.OrderItemListDto;

import java.util.List;

public interface OrderService {
    int order(OrderDto orderDto, List<Integer> cartItemIds) throws Exception;

    List<OrderItemListDto> getOrderItemList(int order_id) throws Exception;

    OrderDto getOrderDto(int order_id) throws Exception;

    List<OrderDto> getOrderAll(String id) throws Exception;
}
