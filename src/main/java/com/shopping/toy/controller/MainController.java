package com.shopping.toy.controller;

import com.shopping.toy.service.wish.WishService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    WishService wishService;

    @GetMapping
    public String getMainPage(){
        return "index";
    }

}
