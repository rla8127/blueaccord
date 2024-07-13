package com.shopping.toy.service.cart.review;

import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;

import java.util.List;
import java.util.Map;

public interface ReviewDao {
    int insert(ReviewDto reviewDto) throws Exception;

    int hasReviewed(int ino, String id) throws Exception;

    List<ReviewDto> getItemReview(int ino) throws Exception;

    int increaseHelpful(int review_id) throws Exception;

    int decreaseHelpful(int review_id) throws Exception;

    List<RatingCountDto> getRatingCounts(int ino);

    int count(String id);
}
