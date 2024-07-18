package com.shopping.toy.dao.item;

import com.shopping.toy.constant.Category;
import com.shopping.toy.domain.item.CategoryItemDto;
import com.shopping.toy.domain.item.ItemDto;
import com.shopping.toy.domain.search.SearchCondition;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ItemDaoImpl implements ItemDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.itemMapper.";

    @Override
    public int insert(ItemDto itemDto) throws Exception {
        return session.insert(namespace+"insert", itemDto);
    }

    @Override
    public ItemDto select(int item_id) throws Exception {
        return session.selectOne(namespace+"select", item_id);
    }

    @Override
    public List<ItemDto> selectFromCategory(Category category) throws Exception {
        return session.selectList(namespace+"selectFromCategory", category);
    }

    @Override
    public List<CategoryItemDto> getCategoryItems(SearchCondition sc) throws Exception{
        return session.selectList(namespace+"getCategoryItems", sc);
    }

    @Override
    public List<CategoryItemDto> getSearchItems(SearchCondition sc) throws Exception{
        return session.selectList(namespace+"getSearchItems", sc);
    }

    @Override
    public int update(ItemDto itemDto) throws Exception {
        return session.update(namespace+"update", itemDto);
    }

    @Override
    public int delete(int item_id) throws Exception {
        return session.delete(namespace+"delete", item_id);
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

    @Override
    public int getStock(int item_id) throws Exception {
        return session.selectOne(namespace+"getStock", item_id);
    }

    @Override
    public int stockUpdate(int item_id, int count) throws Exception {
        Map map = new HashMap();
        map.put("item_id", item_id);
        map.put("count", count);
        return session.update(namespace+"stockUpdate", map);
    }

    @Override
    public List<ItemDto> searchSelectPage(SearchCondition sc) throws Exception {
        return session.selectList(namespace+"searchSelectPage", sc);
    }

    @Override
    public int itemResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"itemResultCnt", sc);
    }

    @Override
    public int searchResultCnt(SearchCondition sc) throws Exception {
        return session.selectOne(namespace+"searchResultCnt", sc);
    }
}
