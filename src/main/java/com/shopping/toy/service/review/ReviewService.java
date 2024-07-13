package com.shopping.toy.service.review;

import com.shopping.toy.domain.helpful.HelpfulDto;
import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;

import java.util.List;

public interface ReviewService {

    int insert(ReviewDto reviewDto) throws Exception;

    List<ReviewDto> getItemReview(int ino) throws Exception;

    String toggleHelpful(HelpfulDto helpfulDto) throws Exception;

    double getRatingAverage(int ino) throws Exception;

    List<RatingCountDto> getRatingCounts(int ino) throws Exception;

    int count(String id) throws Exception;
}
