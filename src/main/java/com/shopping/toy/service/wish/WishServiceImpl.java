package com.shopping.toy.service.wish;

import com.shopping.toy.dao.member.MemberDao;
import com.shopping.toy.dao.wish.WishDao;
import com.shopping.toy.domain.wish.WishListDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.security.auth.login.LoginException;
import java.util.List;

@Service
public class WishServiceImpl implements WishService {

    @Autowired
    WishDao wishDao;

    @Autowired
    MemberDao memberDao;

    @Override
    public int insert(int ino, String id) throws Exception{

        int member_id = memberDao.selectMemberId(id);
        // 만약 이미 관심상품에 등록되었을 경우,
        if(wishDao.select(ino, member_id)!=null){
            return 0;
        }
        return wishDao.insert(ino, member_id);
    }

    @Override
    public int count(int member_id) throws Exception{
        return wishDao.count(member_id);
    }

    @Override
    public List<WishListDto> selectList(String id) throws Exception{
        int member_id = memberDao.selectMemberId(id);

        List<WishListDto> list = wishDao.selectWishList(member_id);
        return list;
    }

    @Override
    public int delete(int wish_id) throws Exception{
        return wishDao.delete(wish_id);
    }

}
