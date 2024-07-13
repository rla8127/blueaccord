package com.shopping.toy.dao.member;

import com.shopping.toy.domain.member.MemberDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Repository
public class MemberDaoImpl implements MemberDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.memberMapper.";

    @Override
    public int insert(MemberDto memberDto){
        return session.insert(namespace+"insert", memberDto);
    }

    @Override
    public List<MemberDto> selectAll(){
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public MemberDto select(int member_id){
        return session.selectOne(namespace+"select", member_id);
    }

    @Override
    public int delete(int member_id) throws Exception{
        return session.delete(namespace+"delete", member_id);
    }

    @Override
    public int selectMemberId(String id){
        return session.selectOne(namespace+"selectMemberId", id);
    }

    @Override
    public int updateMember(MemberDto memberDto) throws Exception{
        return session.update(namespace+"updateMember", memberDto);
    }

    @Override
    public MemberDto selectById(String id){
        return session.selectOne(namespace+"selectById", id);
    }

    @Override
    public String userRole(String id){
        return session.selectOne(namespace+"userRole", id);
    }

    @Override
    public String getUserName(String id){
        return session.selectOne(namespace+"getUserName", id);
    }

    @Override
    public boolean checkId(String id) throws Exception{
        int count = session.selectOne(namespace+"checkId", id);
        if(count == 0)
            return true;
        else
            return false;
    }

    @Override
    public boolean checkEmail(String email) throws Exception{
        int count = session.selectOne(namespace+"checkEmail", email);
        if(count == 0)
            return true;
        else
            return false;
    }

    @Override
    public String getUserId(String name, String email){
        Map map = new HashMap();
        map.put("name", name);
        map.put("email", email);
        return session.selectOne(namespace+"findUserId", map);
    }

    @Override
    public int findUserPwd(MemberDto memberDto) throws Exception{
        return session.selectOne(namespace+"findUserPwd", memberDto);
    }

    @Override
    public int updatePassword(MemberDto memberDto) throws Exception{
        return session.update(namespace+"updatePassword", memberDto);
    }


}
