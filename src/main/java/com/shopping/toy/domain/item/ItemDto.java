package com.shopping.toy.domain.item;

import com.shopping.toy.constant.Category;
import com.shopping.toy.constant.SellStatus;
import lombok.*;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.sql.Timestamp;

@Data
@NoArgsConstructor
public class ItemDto {

    private int item_id;
    private String item_nm;
    private int price;
    private int stock;
    private String item_detail;
    private Category category;
    private SellStatus sell_status;
    private Timestamp reg_date;
    private Timestamp up_date;

    public ItemDto(String item_nm, int price, int stock, String item_detail ,Category category, SellStatus sell_status) {
        this.item_nm = item_nm;
        this.price = price;
        this.stock = stock;
        this.item_detail = item_detail;
        this.category = category;
        this.sell_status = sell_status;
    }
}
