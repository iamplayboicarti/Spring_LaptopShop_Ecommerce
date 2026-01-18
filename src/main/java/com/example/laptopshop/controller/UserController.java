package com.example.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.laptopshop.service.UserService;


@RestController
public class UserController {
    private UserService userService;
    
    // DI: Dependency Injection:
    public UserController(UserService userService) {
        this.userService = userService;
    }


    @GetMapping("/")
    public String getHomePage() {
        return userService.handHello();
    }
}
