package com.shopping.toy.dao.item;

import com.shopping.toy.constant.Category;
import com.shopping.toy.domain.item.ItemImgDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class ItemImgDaoImpl implements ItemImgDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.itemImgMapper.";

    @Override
    public int insert(ItemImgDto itemImgDto) throws Exception {
        return session.insert(namespace+"insert", itemImgDto);
    }

    @Override
    public int count() throws Exception {
        return session.selectOne(namespace+"count");
    }

    @Override
    public ItemImgDto select(int item_img_no) throws Exception {
        return session.selectOne(namespace+"select", item_img_no);
    }

    @Override
    public List<ItemImgDto> selectList() throws Exception {
        return session.selectList(namespace+"selectAll");
    }

    @Override
    public List<ItemImgDto> selectListByIno(int ino) throws Exception {
        return session.selectList(namespace+"selectListByIno", ino);
    }

    @Override
    public List<String> selectOriImgName(int ino) throws Exception {
        return session.selectList(namespace+"selectOriImgName", ino);
    }

    @Override
    public List<String> selectRepImg(Category category) throws Exception {
        return session.selectList(namespace+"selectRepImg", category);
    }

    @Override
    public Boolean selectRepImgYn(int ino) throws Exception {
        return session.selectOne(namespace+"selectRepImgYn", ino);
    }

    @Override
    public int update(ItemImgDto itemImgDto) throws Exception {
        return session.update(namespace+"update", itemImgDto);
    }

    @Override
    public int delete(int item_img_no) throws Exception {
        return session.delete(namespace+"delete", item_img_no);
    }

    @Override
    public int deleteAll() throws Exception {
        return session.delete(namespace+"deleteAll");
    }

    @Override
    public int deleteItem(int ino) throws Exception {
        return session.delete(namespace+"deleteItem", ino);
    }
}
