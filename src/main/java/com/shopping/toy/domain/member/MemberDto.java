package com.shopping.toy.domain.member;

import com.shopping.toy.constant.Role;
import lombok.Data;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import java.sql.Timestamp;

@Data
public class MemberDto {

    private int member_id;

    @NotEmpty(message = "아이디는 필수 입력 항목입니다.")
    @Size(min = 4, max = 12, message = "아이디는 4자 이상, 12자 이하이어야 합니다.")
    private String id;

    @NotEmpty(message = "비밀번호는 필수 입력 항목입니다.")
    @Size(min = 6, message = "비밀번호는 최소 6자리 이상이어야 합니다.")
    private String password;

    @NotEmpty(message = "이름은 필수 입력 항목입니다.")
    private String name;

    @NotEmpty(message = "이메일은 필수 입력 항목입니다.")
    @Email(message = "유효한 이메일 형식을 입력하세요.")
    private String email;

    @NotEmpty(message = "주소는 필수 입력 항목입니다.")
    private String address;

    private Role role;

    @NotEmpty(message = "전화번호는 필수 입력 항목입니다.")
    @Size(min = 11, max = 11, message = "전화번호는 11자리여야 합니다.")
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

