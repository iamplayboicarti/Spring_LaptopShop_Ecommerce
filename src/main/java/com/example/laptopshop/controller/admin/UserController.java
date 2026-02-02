package com.example.laptopshop.controller.admin;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.example.laptopshop.domain.User;
import com.example.laptopshop.service.UploadService;
import com.example.laptopshop.service.UserService;
import com.example.laptopshop.domain.Role;
import jakarta.servlet.ServletContext;

@Controller
public class UserController {

    private final UserService userService;
    private final ServletContext servletContext;
    private final UploadService uploadService;
    private final PasswordEncoder passwordEncoder; 

    
    public UserController(UserService userService, ServletContext servletContext, UploadService uploadService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.servletContext = servletContext;
        this.uploadService = uploadService;
        this.passwordEncoder = passwordEncoder;
    }

    @RequestMapping("/")
    public String getHomePage(Model model) {
        List<User> arrUsers = this.userService.getALLUsers();
        System.out.println(arrUsers);
        model.addAttribute("eric", "test");
        model.addAttribute("daoanhtuan", "tuan");
        return "hello";
    }

    // ========== - Hiển thị danh sách Users ==========
    @GetMapping("/admin/user")
    public String getUserPage(Model model) {
        List<User> users = this.userService.getALLUsers();
        model.addAttribute("users", users);
        return "admin/user/show";
    }

    // ========== CREATE - Hiển thị form tạo User ==========
    @RequestMapping(value = "/admin/user/create", method = RequestMethod.GET)
    public String getCreateUserPage(Model model) {
        model.addAttribute("newUser", new User());
        return "admin/user/create";
    }

    // ========== CREATE - Xử lý submit tạo User ==========
    @PostMapping("/admin/user/create")
    public String createUserPage(
            @ModelAttribute("newUser") User tuan,
            @RequestParam("avatarFile") MultipartFile file) {
        
        // Bước 4 & 5: Gọi service để xử lý upload
        // "avatar" là tên thư mục con trong /resources/images/
        String avatar = this.uploadService.handleSaveUploadFile(file, "avatar");
        
        // Gán tên file vào domain
        tuan.setAvatar(avatar);
        
        // Lưu xuống Database
        // Lưu ý: Đảm bảo logic trong UserService xử lý được việc map Role
    Role r = this.userService.getRoleByName(tuan.getRole().getName());
    tuan.setRole(r); // Thay thế Role tạm bằng Role thật có ID từ DB
    
    // 3. Bây giờ mới lưu User (Sẽ không còn lỗi Transient nữa)
    this.userService.handleSaveUser(tuan);        
        return "redirect:/admin/user";
    }

    // ==========  VIEW - Xem chi tiết User ==========
    @RequestMapping(value = "/admin/user/view/{id}", method = RequestMethod.GET)
    public String getViewUserPage(Model model, @PathVariable long id) {
        User user = this.userService.getUserById(id);
        model.addAttribute("user", user);
        model.addAttribute("id", id);
        return "admin/user/detail";
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