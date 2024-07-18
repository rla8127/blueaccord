package com.shopping.toy.service.cart.review;

import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewDaoImpl implements ReviewDao {

    @Autowired
    private SqlSession session;
    private static String namespace = "com.shopping.toy.dao.reviewMapper.";

    @Override
    public int insert(ReviewDto reviewDto) throws Exception{
        return session.insert(namespace+"insert", reviewDto);
    }

    @Override
    public int hasReviewed(int item_id, String id) throws Exception{
        Map map = new HashMap();
        map.put("item_id", item_id);
        map.put("reviewer", id);
        return session.selectOne(namespace+"hasReviewed", map);
    }

    @Override
    public List<ReviewDto> getItemReview(int item_id) throws Exception{
        return session.selectList(namespace+"getItemReview", item_id);
    }

    @Override
    public int delete(int review_id) throws Exception{
        return session.delete(namespace+"delete", review_id);
    }

    @Override
    public int increaseHelpful(int review_id) throws Exception{
        return session.update(namespace+"IncreaseHelpful", review_id);
    }

    @Override
    public int decreaseHelpful(int review_id) throws Exception{
        return session.update(namespace+"DecreaseHelpful", review_id);
    }

    @Override
    public List<RatingCountDto> getRatingCounts(int item_id){
        return session.selectList(namespace+"getRatingCounts", item_id);
    }

    @Override
    public int count(String id){
        return session.selectOne(namespace+"count", id);
    }
}
