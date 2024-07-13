package com.shopping.toy.controller.auth;

import com.shopping.toy.domain.member.MemberDto;
import com.shopping.toy.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class RegisterController {

    @Autowired
    MemberService memberService;

    @GetMapping("/register/add")
    public String register() {
        return "auth/registerForm";
    }



    @PostMapping("/register/save")
    public String save(MemberDto memberDto, RedirectAttributes r) {
        try {
            memberService.check(memberDto);
            memberService.insert(memberDto);
            return "redirect:/";

        } catch (Exception e) {
            e.printStackTrace();
            r.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/register/add";
        }
    }

    @GetMapping("/register-success")
    public String registerSuccess(){
        return "auth/registerSuccess";
    }

}
