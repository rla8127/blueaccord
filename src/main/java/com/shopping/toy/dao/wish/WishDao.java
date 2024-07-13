package com.shopping.toy.dao.wish;

import com.shopping.toy.domain.wish.WishDto;
import com.shopping.toy.domain.wish.WishListDto;

import java.util.List;

public interface WishDao {
    int insert(int ino, int member_id) throws Exception;

    WishDto select(int ino, int member_id) throws Exception;

//    List<WishDto> selectList(int member_id) throws Exception;

    int count(int member_id) throws Exception;

    List<WishListDto> selectWishList(int member_id) throws Exception;

    int delete(int wish_id) throws Exception;
}
