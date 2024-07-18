package com.shopping.toy.dao.item;

import com.shopping.toy.constant.Category;
import com.shopping.toy.domain.item.CategoryItemDto;
import com.shopping.toy.domain.item.ItemDto;
import com.shopping.toy.domain.search.SearchCondition;

import java.util.List;

public interface ItemDao {
    int insert(ItemDto itemDto) throws Exception;

    List<ItemDto> selectFromCategory(Category category) throws Exception;

    List<CategoryItemDto> getCategoryItems(SearchCondition sc) throws Exception;

    ItemDto select(int item_id) throws Exception;

    int update(ItemDto itemDto) throws Exception;

    int delete(int item_id) throws Exception;

    int count() throws Exception;

    int getStock(int item_id) throws Exception;

    int stockUpdate(int item_id, int count) throws Exception;

    List<ItemDto> searchSelectPage(SearchCondition sc) throws Exception;

    List<CategoryItemDto> getSearchItems(SearchCondition sc) throws Exception;

    int itemResultCnt(SearchCondition sc) throws Exception;

    int searchResultCnt(SearchCondition sc) throws Exception;
}
