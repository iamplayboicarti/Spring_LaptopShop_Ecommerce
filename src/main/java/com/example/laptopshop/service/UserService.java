package com.example.laptopshop.service;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;
import com.example.laptopshop.repository.RoleRepository;
import com.example.laptopshop.repository.UserRepository;
import com.example.laptopshop.domain.User;
import com.example.laptopshop.domain.Role;

@Service
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    
    public UserService(UserRepository userRepository, RoleRepository roleRepository) {
        this.userRepository = userRepository;
        this.roleRepository = roleRepository;
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

    //  orElseThrow: nếu không tìm thấy, ném ra ngoại lệ, có sẵn như RuntimeException
    public User getUserById(Long id) {
        return userRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("User not found"));
    }


    public void deleteUserById(Long id) {
        this.userRepository.deleteById(id);
    }
        public Role getRoleByName(String name) {
        return this.roleRepository.findByName(name);
    }

}
