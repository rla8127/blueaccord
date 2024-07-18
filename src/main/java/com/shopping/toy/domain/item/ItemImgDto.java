package com.shopping.toy.domain.item;


import lombok.*;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
public class ItemImgDto {

    private int item_img_no;
    @NonNull private long item_id;
    @NonNull private String imgName;
    @NonNull private String oriImgName;
    @NonNull private String imgUrl;
    private String repImgYn;
    private LocalDateTime reg_date;
    private LocalDateTime up_date;

    public void updateItemImg(String oriImgName, String imgName, String imgUrl){
        this.oriImgName = oriImgName;
        this.imgName = imgName;
        this.imgUrl = imgUrl;
    }
}
