package com.shopping.toy.domain.wish;

import lombok.Data;

@Data
public class WishListDto {

    private int wish_id;
    private int item_id;
    private String item_nm;
    private int price;
    private String rep_img_url;

}
