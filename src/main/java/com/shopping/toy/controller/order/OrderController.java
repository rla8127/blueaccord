package com.shopping.toy.controller.order;

import com.shopping.toy.domain.cart.CartListDto;
import com.shopping.toy.domain.order.OrderDto;
import com.shopping.toy.domain.order.OrderItemListDto;
import com.shopping.toy.service.cart.CartService;
import com.shopping.toy.service.member.MemberService;
import com.shopping.toy.service.order.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class OrderController {

    @Autowired
    CartService cartService;

    @Autowired
    MemberService memberService;

    @Autowired
    OrderService orderService;

    /* 주문 입력 Form 페이지 호출 */
    @PostMapping("/order")
    public String viewOrderPage(@RequestParam("cart_item_id_list") List<Integer> cartItemIds, Model m) {
        try {
            List<CartListDto> totalList = new ArrayList<>();

            for (Integer cartItemId : cartItemIds) {
                System.out.println("cartItemIds = " + cartItemIds);
                List<CartListDto> list = cartService.selectCartList(cartItemId);
                System.out.println("list = " + list);
                totalList.addAll(list);
            }

            m.addAttribute("list", totalList);
            m.addAttribute("request", "cart");
            return "order/orderForm";

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "order/orderForm";
    }

    /* 주문 처리완료 */
    @PostMapping("/order/new")
    public String order(HttpServletRequest request, OrderDto orderDto, @RequestParam List<Integer> cartItemIds, Model m){
        // MemberId 조회
        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");
            int memberId = memberService.selectMemberId(id);

            System.out.println("orderDto = " + orderDto);
            orderDto.setMember_id(memberId);
            
            int order_id = orderService.order(orderDto, cartItemIds);
            List<OrderItemListDto> list = orderService.getOrderItemList(order_id);

            m.addAttribute(orderDto);
            m.addAttribute("list", list);
            
            return "redirect:/order/" + order_id; //PRG 패턴 적용, 새로고침 후 정보 손실 방지
            

        } catch (Exception e) {
            e.printStackTrace();
            return "errorPage";
        }
    }

    /* 주문 확인 페이지 */
    @GetMapping("/order/{orderId}")
    public String showOrderCheckPage(@PathVariable("orderId") int orderId, Model m) {

        try {
            // 주문 정보 조회 등의 로직 추가
            OrderDto orderDto = orderService.getOrderDto(orderId);
            List<OrderItemListDto> itemList = orderService.getOrderItemList(orderId);
            m.addAttribute("orderDto", orderDto);
            m.addAttribute("list", itemList);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        return "order/orderCheck";
    }
}
