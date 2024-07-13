package com.shopping.toy.domain.review;

import lombok.Data;

import java.sql.Date;

@Data
public class ReviewDto {
    private int review_id;
    private int ino;
    private String reviewer;
    private int rating;
    private String review_content;
    private Date review_date;
    private int helpful;
}
