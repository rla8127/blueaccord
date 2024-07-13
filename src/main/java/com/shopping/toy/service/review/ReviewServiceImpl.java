package com.shopping.toy.service.review;

import com.shopping.toy.dao.helpful.HelpfulDao;
import com.shopping.toy.service.cart.review.ReviewDao;
import com.shopping.toy.domain.helpful.HelpfulDto;
import com.shopping.toy.domain.review.RatingCountDto;
import com.shopping.toy.domain.review.ReviewDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewServiceImpl implements ReviewService {

    @Autowired
    ReviewDao reviewDao;

    @Autowired
    HelpfulDao helpfulDao;

    @Override
    public int insert(ReviewDto reviewDto) throws Exception{
        int hasReviewed = reviewDao.hasReviewed(reviewDto.getIno(), reviewDto.getReviewer());

        if(hasReviewed == 1){
            throw new Exception("이미 해당 상품에 리뷰를 작성했습니다.");
        }

        else
            return reviewDao.insert(reviewDto);
    }

    @Override
    public List<ReviewDto> getItemReview(int ino) throws Exception{
        return reviewDao.getItemReview(ino);
    }

    @Override
    public double getRatingAverage(int ino) throws Exception{
        List<ReviewDto> reviews = reviewDao.getItemReview(ino);

        if (reviews == null || reviews.isEmpty()) {
            return 0.0;
        }

        double totalRating = 0;
        for(ReviewDto review : reviews){
            totalRating += review.getRating();
        }

        return totalRating / reviews.size();
    }

    @Override
    public String toggleHelpful(HelpfulDto helpfulDto) throws Exception{
        boolean hasMarkedHelpful = helpfulDao.hasMarkedHelpful(helpfulDto);
        System.out.println("hasMarkedHelpful = " + hasMarkedHelpful);

        // 사용자가 이미 도움이 돼요 버튼을 눌렀을 경우
        if(hasMarkedHelpful){
            reviewDao.decreaseHelpful(helpfulDto.getReview_id());
            helpfulDao.delete(helpfulDto);
            return "decrease";
        }
        else {
            reviewDao.increaseHelpful(helpfulDto.getReview_id());
            helpfulDao.insert(helpfulDto);
            return "increase";
        }
    }

    @Override
    public List<RatingCountDto> getRatingCounts(int ino) throws Exception{
        return reviewDao.getRatingCounts(ino);
    }

    @Override
    public int count(String id) throws Exception{
        return reviewDao.count(id);
    }
}
