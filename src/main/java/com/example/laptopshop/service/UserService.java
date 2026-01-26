package com.example.laptopshop.service;

import java.util.List;

import org.springframework.stereotype.Service;
import com.example.laptopshop.repository.UserRepository;
import com.example.laptopshop.domain.User;
@Service
public class UserService {
    private final UserRepository userRepository;
    
    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public String handHello() {
        return "Hello from UserService";
    }
    
    public List<User> getALLUsers(){
        return (List<User>) this.userRepository.findAll();
    }

    public List<User> getAllUsersByEmail(String email, String address) {
        return (List<User>) this.userRepository.findByEmailAndAddress(email, address);
    }

    public User handleSaveUser(User user) {
        User tuan = this.userRepository.save(user);
        System.out.println(tuan);
        return tuan;
    }
}
