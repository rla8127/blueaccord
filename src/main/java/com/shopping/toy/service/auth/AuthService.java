package com.shopping.toy.service.auth;

import com.shopping.toy.domain.member.MemberDto;

public interface AuthService {
    boolean loginCheck(String id, String rawPassword) throws Exception;
}
