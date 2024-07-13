package com.shopping.toy.dao.member;

import com.shopping.toy.domain.member.MemberDto;

import java.util.List;

public interface MemberDao {
    int insert(MemberDto memberDto);

    List<MemberDto> selectAll();

    MemberDto select(int member_id);

    int delete(int member_id) throws Exception;

    int selectMemberId(String id);

    MemberDto selectById(String id);

    int updateMember(MemberDto memberDto) throws Exception;

    String userRole(String id);

    String getUserName(String id);

    String getUserId(String name, String email);

    int findUserPwd(MemberDto memberDto) throws Exception;

    int updatePassword(MemberDto memberDto) throws Exception;

    boolean checkId(String id) throws Exception;

    boolean checkEmail(String email) throws Exception;
}
