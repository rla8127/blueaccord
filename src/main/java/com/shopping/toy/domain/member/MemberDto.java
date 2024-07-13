package com.shopping.toy.domain.member;

import com.shopping.toy.constant.Role;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MemberDto {

    private int member_id;
    private String id;
    private String password;
    private String name;
    private String email;
    private String address;
    private Role role;
    private String phone;
    private Timestamp reg_date;

    public MemberDto(){}

    public MemberDto(String id, String password, String name, String email, String address, Role role, String phone) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.email = email;
        this.address = address;
        this.role = role;
        this.phone = phone;
    }
}

