package com.example.laptopshop.domain;

import jakarta.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "orders")
public class Order {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // Quan hệ N-1: Nhiều Orders thuộc 1 User
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "userId")
    private User user;
    
    @Column(nullable = false)
    private Double totalPrice;
    
    @Column(length = 50)
    private String status; // PENDING, PAID, SHIPPING, COMPLETED, CANCELLED
    
    @Column(nullable = false, updatable = false)
    private LocalDateTime createdAt;
    
    // Quan hệ 1-N: 1 Order có nhiều OrderProduct
    @OneToMany(mappedBy = "order", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<OrderProduct> orderProducts;
    
    // Constructors
    public Order() {
        this.createdAt = LocalDateTime.now();
        this.status = "PENDING";
    }
    
    // Getters & Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public User getUser() {
        return user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }
    
    public Double getTotalPrice() {
        return totalPrice;
    }
    
    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }
    
    public String getStatus() {
        return status;
    }
    
    public void setStatus(String status) {
        this.status = status;
    }
    
    public LocalDateTime getCreatedAt() {
        return createdAt;
    }
    
    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
    
    public List<OrderProduct> getOrderProducts() {
        return orderProducts;
    }
    
    public void setOrderProducts(List<OrderProduct> orderProducts) {
        this.orderProducts = orderProducts;
    }
}