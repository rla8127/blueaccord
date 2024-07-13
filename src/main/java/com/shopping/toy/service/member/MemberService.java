package com.shopping.toy.service.member;

import com.shopping.toy.domain.member.MemberDto;

public interface MemberService {
    MemberDto select(int member_id) throws Exception;

    MemberDto selectById(String id) throws Exception;

    int selectMemberId(String id) throws Exception;

    int insert(MemberDto memberDto) throws Exception;

    int updateMember(MemberDto memberDto) throws Exception;

    String getUserName(String id) throws Exception;

    String getUserId(String name, String email) throws Exception;

    String findPassword(MemberDto memberDto) throws Exception;

    void check(MemberDto memberDto) throws Exception;

    void delete(int member_id, String password) throws Exception;
}
