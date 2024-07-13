package com.shopping.toy.domain.item;

import lombok.Data;

@Data
public class CategoryItemDto {
    private int ino;
    private String item_nm;
    private int price;
    private String item_detail;
    private String repImgUrl;
    private int review_count;
}
