package com.shopping.toy.service.item;

import com.shopping.toy.domain.item.ItemImgDto;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemImgService {

    List<String> getImagePathByItem_id(int item_id) throws Exception;

    List<ItemImgDto> getList(int item_id) throws Exception;

    List<String> getOriImgName(int item_id) throws Exception;

    Boolean selectRepImgYn(int item_id) throws Exception;

    void saveItemImg(ItemImgDto itemImgDto, MultipartFile itemImgFile) throws Exception;

    int insert(ItemImgDto itemImgDto) throws Exception;

    int count() throws Exception;

    ItemImgDto select(int item_img_no) throws Exception;

    List<ItemImgDto> selectList() throws Exception;

    int update(ItemImgDto itemImgDto) throws Exception;

    int delete(int item_img_no) throws Exception;

    int deleteAll() throws Exception;

    int deleteItem(int item_id) throws Exception;
}
