package com.example.laptopshop.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
        List<User> arrUsers = this.userService.getALLUsers();
        System.out.println(arrUsers);
        model.addAttribute("eric", "test");
        model.addAttribute("daoanhtuan", "tuan");
        return "hello";
    }

    // ========== TABLE - Hiển thị danh sách Users ==========
    @RequestMapping(value = "/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getALLUsers();
        model.addAttribute("users", users);
        return "admin/user/table";
    }

    // ========== CREATE - Hiển thị form tạo User ==========
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // ========== CREATE - Xử lý submit tạo User ==========
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.POST)
    public String createUserPage(Model model, @ModelAttribute("newUser") User tuan) {
        System.out.println(" run here " + tuan);
        this.userService.handleSaveUser(tuan);
        return "redirect:/admin/user";
    }

    // ==========  VIEW - Xem chi tiết User ==========
    @RequestMapping(value = "/admin/user/view/{id}", method = RequestMethod.GET)
    public String getViewUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/view";
    }

    // ==========  UPDATE - Hiển thị form cập nhật User ==========
    @RequestMapping(value = "/admin/user/update/{id}", method = RequestMethod.GET)
    public String getUpdateUserPage(Model model, @PathVariable long id) {
        User currentUser = this.userService.getUserById(id);
        model.addAttribute("currentUser", currentUser);
        return "admin/user/update";
    }

    // ========== ⭐ UPDATE - Xử lý submit cập nhật User ==========
    @RequestMapping(value = "/admin/user/update", method = RequestMethod.POST)
    public String postUpdateUser(Model model, @ModelAttribute("currentUser") User user) {
        // Lấy user hiện tại từ database
        User currentUser = this.userService.getUserById(user.getId());
        
        if (currentUser != null) {
            // Cập nhật thông tin
            currentUser.setEmail(user.getEmail());
            currentUser.setFullName(user.getFullName());
            currentUser.setAddress(user.getAddress());
            currentUser.setPhone(user.getPhone());
            // Password có thể giữ nguyên hoặc cập nhật
            if (user.getPassword() != null && !user.getPassword().isEmpty()) {
                currentUser.setPassword(user.getPassword());
            }
            
            // Lưu vào database
            this.userService.handleSaveUser(currentUser);
        }
        
        return "redirect:/admin/user";
    }

    // ========== ⭐ DELETE - Xóa User ==========
    @RequestMapping(value = "/admin/user/delete/{id}", method = RequestMethod.POST)
    public String postDeleteUserPage(@PathVariable long id) {
        this.userService.deleteUserById(id);
        return "redirect:/admin/user";
    }
}