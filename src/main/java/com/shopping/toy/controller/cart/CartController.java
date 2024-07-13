package com.shopping.toy.controller.cart;

import com.shopping.toy.domain.cart.CartListDto;
import com.shopping.toy.service.cart.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/cart")
public class CartController {

    @Autowired
    CartService cartService;

    @ResponseBody
    @PostMapping("/add")
    public ResponseEntity<Map<String, Object>> AddCart(HttpServletRequest request, int ino, int count, Model m) {
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        int cart_id = cartService.getCartId(id);

        try {
            int cartItemId = cartService.insert(cart_id, ino, count);
            System.out.println("cartItemId = " + cartItemId);

            Map<String, Object> response = new HashMap<>();
            response.put("status", "OK");
            response.put("cartItemId", cartItemId);

            return new ResponseEntity<>(response, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();

            Map<String, Object> response = new HashMap<>();
            response.put("status", "ERR");

            return new ResponseEntity<>(response, HttpStatus.BAD_REQUEST);
        }
    }

    @GetMapping("/list")
    public String cartView(HttpServletRequest request, Model m){

        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        int cart_id = cartService.getCartId(id);

        m.addAttribute("cart_id", cart_id);

        try {
            List<CartListDto> list = cartService.selectCartListAll(cart_id);
            m.addAttribute("list", list);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "cart/list";
    }

    @DeleteMapping("/delete")
    public ResponseEntity<String> deleteCart(@RequestBody List<Integer> selectedItems, Model m){
        try {
            System.out.println("selectedItems = " + selectedItems);
            System.out.println("selectedItems.size() = " + selectedItems.size());

            for(int i=0; i<selectedItems.size(); i++) {
                cartService.delete(selectedItems.get(i));
            }
            return new ResponseEntity<>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @PatchMapping("/update")
    public ResponseEntity<String> updateCart(HttpServletRequest request,@RequestBody CartListDto cartLstDto, Model m){
        // 현재 세션에 있는 MemberID 조회 => MemberID를 통한 Cart_id 구하기
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        System.out.println("id = " + id);
        int cart_id = cartService.getCartId(id);

        // Cart_id, Item_id, count를 Cart_item 생성자 인자로 넘겨줌
        // Cart_item insert Service 호출
        try {
            cartService.update(cart_id, cartLstDto.getIno(), cartLstDto.getCount());
            return new ResponseEntity<>("OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
        }
    }
}
