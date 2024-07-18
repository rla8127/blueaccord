package com.shopping.toy.dao.item;

import com.shopping.toy.constant.Category;
import com.shopping.toy.domain.item.ItemImgDto;

import java.util.List;

public interface ItemImgDao {
    int count() throws Exception;

    ItemImgDto select(int item_img_no) throws Exception;

    List<ItemImgDto> selectList() throws Exception;

    List<String> selectOriImgName(int item_id) throws Exception;

    List<String> selectRepImg(Category category) throws Exception;

    Boolean selectRepImgYn(int item_id) throws Exception;

    int insert(ItemImgDto itemImgDto) throws Exception;

    int update(ItemImgDto itemImgDto) throws Exception;

    int delete(int item_img_no) throws Exception;

    int deleteAll() throws Exception;

    int deleteItem(int item_id) throws Exception;

    List<ItemImgDto> selectListByItem_id(int item_id) throws Exception;

}

