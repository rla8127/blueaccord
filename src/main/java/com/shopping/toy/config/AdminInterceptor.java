package com.shopping.toy.config;

import com.shopping.toy.constant.Role;
import com.shopping.toy.domain.member.MemberDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Slf4j
@Component
public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 예시로 세션에서 사용자 정보를 가져옴
        Role role = (Role) request.getSession().getAttribute("role");

        if (role == Role.ADMIN) {
            return true; // 접근 허용
        }

        response.sendError(HttpServletResponse.SC_FORBIDDEN, "Access Denied");
        return false; // 접근 거부
    }
}
