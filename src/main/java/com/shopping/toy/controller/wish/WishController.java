package com.shopping.toy.controller.wish;

import com.shopping.toy.domain.wish.WishListDto;
import com.shopping.toy.service.wish.WishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping(value="/wish", produces="application/string;charset=UTF-8")
public class WishController {

    @Autowired
    WishService wishService;

    @GetMapping("/list")
    public String wishList(HttpSession session, Model m){
        String id = (String) session.getAttribute("id");
        try {
            List<WishListDto> list = wishService.selectList(id);
            m.addAttribute("list", list);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "wish/list";
    }

    @ResponseBody
    @PostMapping
    public ResponseEntity<String> insert(HttpSession session, @RequestBody int item_id, Model m){
        try {
            String id = (String) session.getAttribute("id");
            wishService.insert(item_id, id);
            return new ResponseEntity<>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = e.getMessage();
            return new ResponseEntity<>(errorMsg, HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @DeleteMapping("/delete")
    public ResponseEntity<String> delete(@RequestBody List<Integer> selectedItems, Model m){
        for(int i=0; i<selectedItems.size(); i++){
            try {
                wishService.delete(selectedItems.get(i));
            } catch (Exception e) {
                e.printStackTrace();
                return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
            }
        }
        return new ResponseEntity<>("OK", HttpStatus.OK);
    }

}
