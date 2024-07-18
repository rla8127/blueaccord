package com.shopping.toy.dao.order;

import com.shopping.toy.domain.order.OrderDto;
import com.shopping.toy.domain.order.OrderItemDto;
import com.shopping.toy.domain.order.OrderItemListDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.orderMapper.";

    @Override
    public OrderItemListDto selectItem(int item_id) throws Exception{
        return session.selectOne(namespace+"selectOrderRequest", item_id);
    }

    @Override
    public int insert(OrderDto orderDto) throws Exception{
        return session.insert(namespace+"insert", orderDto);
    }

    @Override
    public int insertOrderItem(OrderItemDto orderItemDto) throws Exception{
        return session.insert(namespace+"insertOrderItem", orderItemDto);
    }

    @Override
    public List<OrderItemDto> getOrderItems(int order_id) throws Exception{
        return session.selectList(namespace+"getOrderItems", order_id);
    }

    @Override
    public List<OrderItemListDto> getOrderItemList(int order_id) throws Exception{
        return session.selectList(namespace+"getOrderItemList", order_id);
    }

    @Override
    public OrderDto getOrder(int order_id) throws Exception{
        return session.selectOne(namespace+"getOrder", order_id);
    }

    @Override
    public List<OrderDto> getOrderAll(String id) throws Exception{
        return session.selectList(namespace+"getOrderAll", id);
    }
}
