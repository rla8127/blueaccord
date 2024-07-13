package com.shopping.toy.controller.auth;

import com.shopping.toy.domain.member.MemberDto;
import com.shopping.toy.service.auth.AuthService;
import com.shopping.toy.service.member.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.net.URLEncoder;

@Controller
public class LoginController {

    @Autowired
    MemberService memberService;

    @Autowired
    AuthService authService;

    @GetMapping("/login")
    public String loginForm() {
        return "auth/loginForm";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/find/id")
    public String findUserIdPage(){
        return "/auth/forgotId";
    }

    @PostMapping("/find/id")
    public String findUserId(String name, String email, Model m){
        try {
            String id = memberService.getUserId(name, email);
            m.addAttribute("id", id);
            m.addAttribute("name", name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/auth/foundId";
    }

    @GetMapping("/find/password")
    public String findPasswordPage(){
        return "/auth/forgotPassword";
    }

    @PostMapping("/find/password")
    public String findUserPassword(MemberDto memberDto, Model m){
        try {
            String tempPwd = memberService.findPassword(memberDto);
            m.addAttribute("tempPwd", tempPwd);
            m.addAttribute("name", memberDto.getName());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "/auth/foundPassword";
    }


    @PostMapping("/login")
    public String login(String id, String password, String toURL, boolean rememberId,
                        HttpServletRequest request, HttpServletResponse response) throws Exception {

        if(!authService.loginCheck(id, password)) {
            String msg = URLEncoder.encode("id 또는 pwd가 일치하지 않습니다.", "utf-8");
            return "redirect:/login?msg="+msg;
        }

        MemberDto member = memberService.selectById(id);

        // id와 pwd가 일치하면, 세션 객체를 얻어오기
        HttpSession session = request.getSession();
        // 세션 객체에 저장
        session.setAttribute("id", id);
        session.setAttribute("memberId", member.getMember_id());
        session.setAttribute("role", member.getRole());

        if(rememberId) {
            Cookie cookie = new Cookie("id", id);
            response.addCookie(cookie);
        } else {
            Cookie cookie = new Cookie("id", id);
            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        // 3. 홈으로 이동
        toURL = toURL==null || toURL.equals("") ? "/" : toURL;
        return "redirect:"+toURL;
    }
}
