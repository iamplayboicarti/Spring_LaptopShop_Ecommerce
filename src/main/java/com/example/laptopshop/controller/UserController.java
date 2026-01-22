package com.example.laptopshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.service.UserService;

@Controller
public class UserController {
    
    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        String test = this.userService.handHello();
        model.addAttribute("eric", test);
        model.addAttribute("daoanhtuan", "tuan");
        return "hello";
    }

    // GET - Hiển thị form
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // POST - Xử lý submit
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(@ModelAttribute("newUser") User user, Model model) {
        System.out.println("============ USER CREATED ============");
        System.out.println(user.toString());
        System.out.println("======================================");
        
        // Thông báo thành công
        model.addAttribute("successMessage", "User created successfully!");
        
        // Reset form
        model.addAttribute("newUser", new User());
        
        return "admin/user/create";
    }
}