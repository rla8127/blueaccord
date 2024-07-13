package com.shopping.toy.domain.cs;

import lombok.Data;

import java.sql.Date;

@Data
public class AnswerDto {
    private int answer_id;
    private int question_id;
    private String content;
    private int member_id;
    private Date reg_date;
    private Date up_date;
}
