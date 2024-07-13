package com.shopping.toy.service.member;

import com.shopping.toy.dao.cart.CartDao;
import com.shopping.toy.dao.member.MemberDao;
import com.shopping.toy.domain.member.MemberDto;
import com.shopping.toy.util.PasswordGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Autowired
    MemberDao memberDao;

    @Autowired
    CartDao cartDao;

    @Override
    public MemberDto select(int member_id) throws Exception {
        return memberDao.select(member_id);
    }

    @Override
    public int insert(MemberDto memberDto) throws Exception {
        // 비밀번호 암호화
        memberDto.setPassword(passwordEncoder.encode(memberDto.getPassword()));
        // member 생성
        memberDao.insert(memberDto);
        // member 생성과 동시에, cart 생성 (1:1 매핑)
        return cartDao.insert(memberDto.getMember_id());
    }

    @Override
    public int selectMemberId(String id) throws Exception {
        return memberDao.selectMemberId(id);
    }

    @Override
    public MemberDto selectById(String id) throws Exception {
        return memberDao.selectById(id);
    }

    @Override
    public int updateMember(MemberDto memberDto) throws Exception{
        return memberDao.updateMember(memberDto);
    }

    @Override
    public String getUserName(String id) throws Exception{
        return memberDao.getUserName(id);
    }

    @Override
    public String getUserId(String name, String email) throws Exception{
        return memberDao.getUserId(name, email);
    }

    @Override
    public String findPassword(MemberDto memberDto) throws Exception{
        if(memberDao.findUserPwd(memberDto) == 1){
            String newPassword = PasswordGenerator.generateRandomPassword();
            memberDto.setPassword(passwordEncoder.encode(newPassword));
            memberDao.updatePassword(memberDto);
            return newPassword;
        }
        else {
            throw new Exception("사용자가 존재하지 않거나, 패스워드 초기화에 실패하였습니다.");
        }
    }

    @Override
    public void check(MemberDto memberDto) throws Exception {

        if(!memberDao.checkId(memberDto.getId())) {
            throw new Exception("이미 존재하는 아이디입니다. 다른 아이디를 입력해주세요.");
        }
        if(!memberDao.checkEmail(memberDto.getEmail())) {
            throw new Exception("이미 등록된 이메일입니다. 다른 이메일을 입력해주세요.");
        }
    }

    @Override
    public void delete(int member_id, String rawPassword) throws Exception {
        MemberDto member = memberDao.select(member_id);
        if(!passwordEncoder.matches(rawPassword, member.getPassword())){
            throw new Exception("비밀번호가 일치하지 않습니다!");
        }
        memberDao.delete(member_id);
    }
}
