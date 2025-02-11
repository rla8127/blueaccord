package com.shopping.toy.service.wish;

import com.shopping.toy.domain.wish.WishListDto;

import java.util.List;

public interface WishService {
    int insert(int item_id, String id) throws Exception;

    int count(int member_id) throws Exception;

    List<WishListDto> selectList(String id) throws Exception;

    int delete(int wish_id) throws Exception;
}
