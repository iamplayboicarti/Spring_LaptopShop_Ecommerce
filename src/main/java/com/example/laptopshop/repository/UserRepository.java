package com.example.laptopshop.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.example.laptopshop.domain.User;
import org.springframework.stereotype.Repository;
import java.util.List;


@Repository
public interface UserRepository extends CrudRepository<User, Long> {
    User save(User tuan); 
    List<User> findByEmailAndAddress(String email, String address);
}  