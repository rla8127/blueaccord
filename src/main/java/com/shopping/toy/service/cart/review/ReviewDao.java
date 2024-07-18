package com.shopping.toy.service.cart.review;

import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;

import java.util.List;
import java.util.Map;

public interface ReviewDao {
    int insert(ReviewDto reviewDto) throws Exception;

    int hasReviewed(int item_id, String id) throws Exception;

    List<ReviewDto> getItemReview(int item_id) throws Exception;

    int increaseHelpful(int review_id) throws Exception;

    int decreaseHelpful(int review_id) throws Exception;

    List<RatingCountDto> getRatingCounts(int item_id);

    int count(String id);

    int delete(int reviewId) throws Exception;
}
