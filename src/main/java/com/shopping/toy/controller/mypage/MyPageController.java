package com.shopping.toy.controller.mypage;

import com.shopping.toy.domain.member.MemberDto;
import com.shopping.toy.domain.order.OrderDto;
import com.shopping.toy.domain.order.OrderItemListDto;
import com.shopping.toy.service.member.MemberService;
import com.shopping.toy.service.order.OrderService;
import com.shopping.toy.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("mypage")
public class MyPageController {
    @Autowired
    OrderService orderService;

    @Autowired
    MemberService memberService;

    @Autowired
    ReviewService reviewService;

    @GetMapping
    public String getMyPage(HttpServletRequest request, Model m){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        try {
            // 회원등급, 역할, 마일리지, 이름 등 동적으로 불러오려면 필요함.
            MemberDto member = memberService.selectById(id);
            int reviewCount = reviewService.count(id);

            List<OrderDto> orders = orderService.getOrderAll(id);
            int orderCount = orders.size();
            Map<OrderDto, List<OrderItemListDto>> orderMap = new HashMap<>();

            for (OrderDto order : orders) {
                List<OrderItemListDto> orderItems = orderService.getOrderItemList(order.getOrder_id());
                orderMap.put(order, orderItems);
            }

            m.addAttribute("member", member);
            m.addAttribute("orderMap", orderMap);
            m.addAttribute("reviewCount", reviewCount);
            m.addAttribute("orderCount", orderCount);
            System.out.println("orderMap = " + orderMap);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/index";
    }

    @GetMapping("/order")
    public String getMyOrder(HttpServletRequest request, Model m){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");

        try {
            List<OrderDto> orders = orderService.getOrderAll(id);
            Map<OrderDto, List<OrderItemListDto>> orderMap = new HashMap<>();

            for (OrderDto order : orders) {
                List<OrderItemListDto> orderItems = orderService.getOrderItemList(order.getOrder_id());
                orderMap.put(order, orderItems);
            }

            m.addAttribute("orderMap", orderMap);
            System.out.println("orderMap = " + orderMap);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/order";
    }

    @GetMapping("/order/detail")
    public String getMyOrderDetail(HttpServletRequest request, @RequestParam int orderId, Model m){
        try {
            HttpSession session = request.getSession();
            String id = (String) session.getAttribute("id");
            int member_id = memberService.selectMemberId(id);

            OrderDto order = orderService.getOrderDto(orderId);

            // 주문정보를 조회하기 위해선, 그 주문을 결제한 사람인지 확인해야 함.
            if(member_id == order.getMember_id()){
                List<OrderItemListDto> orderItems = orderService.getOrderItemList(orderId);
                m.addAttribute("order", order);
                m.addAttribute("orderItems", orderItems);
                System.out.println("order = " + order);
                System.out.println("orderItems = " + orderItems);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "mypage/detail";
    }

    @GetMapping("/member/modify")
    public String modifyMyInfo(HttpServletRequest request, Model m){

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        try {
            MemberDto member = memberService.selectById(id);
            m.addAttribute("member", member);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "mypage/modify";
    }
}
