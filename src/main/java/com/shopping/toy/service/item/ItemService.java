package com.shopping.toy.service.item;

import com.shopping.toy.domain.item.CategoryItemDto;
import com.shopping.toy.domain.item.ItemDto;
import com.shopping.toy.domain.search.SearchCondition;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ItemService {

    long saveItem(ItemDto itemDto, List<MultipartFile> itemImgFileList) throws Exception;
    // 상품의 총 개수
    int getCount() throws Exception;

    // 상품 작성
    int write(ItemDto itemDto) throws Exception;

    List<CategoryItemDto> getCategoryItems(SearchCondition sc) throws Exception;

    List<CategoryItemDto> getSearchItems(SearchCondition sc) throws Exception;

    // 상품 조회
    ItemDto read(Integer item_id) throws Exception;

    // 상품 수정
    int modify(ItemDto itemDto, List<MultipartFile> itemImgFileList) throws Exception;

    // 상품 삭제
    int remove(Integer item_id) throws Exception;

    List<ItemDto> searchSelectPage(SearchCondition sc) throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;

    int itemResultCnt(SearchCondition sc) throws Exception;

}
