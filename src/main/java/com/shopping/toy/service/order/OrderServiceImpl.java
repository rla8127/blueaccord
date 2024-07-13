package com.shopping.toy.service.order;

import com.shopping.toy.constant.OrderStatus;
import com.shopping.toy.dao.cart.CartItemDao;
import com.shopping.toy.dao.item.ItemDao;
import com.shopping.toy.dao.order.OrderDao;
import com.shopping.toy.domain.cart.CartListDto;
import com.shopping.toy.domain.order.OrderDto;
import com.shopping.toy.domain.order.OrderItemDto;
import com.shopping.toy.domain.order.OrderItemListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderDao orderDao;
    @Autowired
    CartItemDao cartItemDao;
    @Autowired
    ItemDao itemDao;

    @Override
    public int order(OrderDto orderDto, List<Integer> cartItemIds) throws Exception{

        // order_id 랜덤 8글자 설정 및 order_status 변경
        Random random = new Random();
        int order_id = 10000000 + random.nextInt(90000000);
        orderDto.setOrder_id(order_id);
        orderDto.setOrder_status(OrderStatus.ORDER);
        orderDao.insert(orderDto);

        // cartItemId 조회하여 OrderItem 생성
        for (int cartItemId : cartItemIds) {
            OrderItemDto orderItemDto = new OrderItemDto();
            CartListDto cartListDto = cartItemDao.selectMyCart(cartItemId);

            orderItemDto.setOrder_id(order_id);
            orderItemDto.setIno(cartListDto.getIno());
            orderItemDto.setCount(cartListDto.getCount());
            orderItemDto.setOrder_price(cartListDto.getPrice());
            orderDao.insertOrderItem(orderItemDto);

            // 재고수량 감소
            itemDao.stockUpdate(cartListDto.getIno(), -cartListDto.getCount());

            //장바구니 삭제
            cartItemDao.delete(cartItemId);
        }
        return order_id;
    }

    @Override
    public List<OrderItemListDto> getOrderItemList(int order_id) throws Exception{
        List<OrderItemListDto> list = orderDao.getOrderItemList(order_id);
        return list;
    }

    // 해당 서비스는, 주문 직후, 어떤 주문을 수행했는지 해당 주문ID를 조회하기 위해 필요함.
    @Override
    public OrderDto getOrderDto(int order_id) throws Exception{
       return orderDao.getOrder(order_id);
    }

    // 전체 주문 조회 (마이페이지 등)
    @Override
    public List<OrderDto> getOrderAll(String id) throws Exception{
        return orderDao.getOrderAll(id);
    }
    

}
