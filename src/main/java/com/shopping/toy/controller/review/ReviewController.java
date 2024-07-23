package com.shopping.toy.controller.review;

import com.shopping.toy.domain.helpful.HelpfulDto;
import com.shopping.toy.domain.review.ReviewDto;
import com.shopping.toy.service.review.ReviewService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/review", produces="application/string;charset=UTF-8")
public class ReviewController {

    @Autowired
    ReviewService reviewService;

    @ResponseBody
    @PostMapping("/insert")
    public ResponseEntity<String> insert(HttpServletRequest request, @RequestBody ReviewDto reviewDto, Model m){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        reviewDto.setReviewer(id);

        try {
            reviewService.insert(reviewDto);
            return new ResponseEntity<>("OK", HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = e.getMessage();
            m.addAttribute("errorMsg", errorMsg);
            return new ResponseEntity<>(errorMsg, HttpStatus.BAD_REQUEST);
        }
    }

    @ResponseBody
    @DeleteMapping("/delete")
    public ResponseEntity<String> delete(HttpServletRequest request, @RequestBody int review_id){
        HttpSession session = request.getSession();
        String id = (String) session.getAttribute("id");
        try {
            reviewService.delete(review_id);
            return new ResponseEntity<>("OK", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            String errorMsg = e.getMessage();
            return new ResponseEntity<>(errorMsg, HttpStatus.BAD_REQUEST);
        }
    }

    @PostMapping("/helpful")
    public ResponseEntity<String> markHelpful(HttpServletRequest request, @RequestBody Integer review_id){
        HttpSession session = request.getSession();
        int id = (Integer) session.getAttribute("memberId");

        HelpfulDto helpfulDto = new HelpfulDto(review_id, id);

        try {
            String status = reviewService.toggleHelpful(helpfulDto);
            System.out.println("status = " + status);
            return new ResponseEntity<>(status, HttpStatus.OK);

        } catch (Exception e) {
            e.printStackTrace();
            return new ResponseEntity<>("ERR", HttpStatus.BAD_REQUEST);
        }
    }
}
