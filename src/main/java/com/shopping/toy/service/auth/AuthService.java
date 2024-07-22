package com.shopping.toy.service.auth;

public interface AuthService {
    boolean loginCheck(String id, String rawPassword) throws Exception;
}
