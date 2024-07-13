package com.shopping.toy.service.auth;

import com.shopping.toy.dao.member.MemberDao;
import com.shopping.toy.domain.member.MemberDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    MemberDao memberDao;

    @Autowired
    PasswordEncoder passwordEncoder;

    public boolean loginCheck(String id, String rawPassword) {
        MemberDto memberDto = new MemberDto();

        try {
            memberDto = memberDao.selectById(id);
            if (memberDto != null) {
                return passwordEncoder.matches(rawPassword, memberDto.getPassword());
            }
            return false;

        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
