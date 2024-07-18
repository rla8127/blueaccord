package com.shopping.toy.service.review;

import com.shopping.toy.domain.helpful.HelpfulDto;
import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;

import java.util.List;

public interface ReviewService {

    int insert(ReviewDto reviewDto) throws Exception;

    List<ReviewDto> getItemReview(int item_id) throws Exception;

    String toggleHelpful(HelpfulDto helpfulDto) throws Exception;

    double getRatingAverage(int item_id) throws Exception;

    List<RatingCountDto> getRatingCounts(int item_id) throws Exception;

    int count(String id) throws Exception;

    int delete(int reviewId) throws Exception;
}
