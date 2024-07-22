package com.shopping.toy.controller.auth;

import com.shopping.toy.domain.member.MemberDto;
import com.shopping.toy.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
public class RegisterController {

    @Autowired
    MemberService memberService;

    @GetMapping("/register/add")
    public String register(MemberDto memberDto) {
        return "auth/registerForm";
    }

    @PostMapping("/register/save")
    public String save(@Valid MemberDto memberDto, BindingResult result) {
        try {
            if(result.hasErrors()) {
                return "auth/registerForm";
            }
            memberService.check(memberDto);
            memberService.insert(memberDto);
            return "redirect:/";

        } catch (Exception e) {
            e.printStackTrace();
            return "redirect:/register/add";
        }
    }

    @GetMapping("/register-success")
    public String registerSuccess(){
        return "auth/registerSuccess";
    }

}
