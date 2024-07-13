package com.shopping.toy.domain.cs;

import lombok.*;

import javax.validation.constraints.NotBlank;
import java.util.Date;

@Data
public class QuestionDto {
    private Integer question_id;
    private String title;
    private String content;
    private String name;
    private int member_id;
    private int view_cnt;
    private String answer_yn;
    private Date reg_date;
    private Date up_date;
}
