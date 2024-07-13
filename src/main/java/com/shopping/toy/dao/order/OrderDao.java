package com.shopping.toy.dao.order;

import com.shopping.toy.domain.order.OrderDto;
import com.shopping.toy.domain.order.OrderItemDto;
import com.shopping.toy.domain.order.OrderItemListDto;

import java.util.List;

public interface OrderDao {

    int insert(OrderDto orderDto) throws Exception;
    OrderItemListDto selectItem(int ino) throws Exception;
    int insertOrderItem(OrderItemDto orderItemDto) throws Exception;
    List<OrderItemDto> getOrderItems(int order_id) throws Exception;
    List<OrderItemListDto> getOrderItemList(int order_id) throws Exception;
    OrderDto getOrder(int order_id) throws Exception;
    List<OrderDto> getOrderAll(String id) throws Exception;
}
