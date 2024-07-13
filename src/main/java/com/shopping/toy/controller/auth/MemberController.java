package com.shopping.toy.controller.auth;

import com.shopping.toy.domain.member.MemberDto;
import com.shopping.toy.service.auth.AuthService;
import com.shopping.toy.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member")
public class MemberController {

    @Autowired
    MemberService memberService;

    @Autowired
    PasswordEncoder passwordEncoder;

    @PostMapping("/modify")
    public String modifyMember(HttpSession session, MemberDto memberDto, Model m){
        String id = (String) session.getAttribute("id");

        try {
            int memberId = memberService.selectMemberId(id);
            memberDto.setMember_id(memberId);
            memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));

            memberService.updateMember(memberDto);
            System.out.println("memberDto = " + memberDto);

        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/mypage";
    }

    @GetMapping("/delete")
    public String deleteMemberPage(HttpSession session, Model m){
        try {
            int memberId = (Integer) session.getAttribute("memberId");
            MemberDto member = memberService.select(memberId);
            m.addAttribute("member", member);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "mypage/deleteMember";
    }

    @PostMapping("/delete")
    public String deleteMember(HttpSession session, int member_id, String rawPassword, RedirectAttributes r){
        try {
            System.out.println("member_id = " + member_id);
            System.out.println("rawPassword = " + rawPassword);
            memberService.delete(member_id, rawPassword);
            session.invalidate();
        } catch (Exception e) {
            e.printStackTrace();
            r.addFlashAttribute("errorMessage", e.getMessage());
            return "redirect:/member/delete";
        }
        return "redirect:/member/delete-success";
    }

    @GetMapping("/delete-success")
    public String deleteSuccess(){
        return "mypage/deleteSuccess";
    }

}
