package com.example.laptopshop.domain;

import jakarta.persistence.*;

@Entity
@Table(name = "order_product")
public class OrderProduct {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    // Quan hệ N-1: Nhiều OrderProduct thuộc 1 Order
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "orderId")
    private Order order;
    
    // Quan hệ N-1: Nhiều OrderProduct thuộc 1 Product
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "productId")
    private Product product;
    
    @Column(nullable = false)
    private Long quantity; // Số lượng mua
    
    @Column(nullable = false)
    private Double price; // Giá tại thời điểm mua
    
    // Constructors
    public OrderProduct() {}
    
    // Getters & Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public Order getOrder() {
        return order;
    }
    
    public void setOrder(Order order) {
        this.order = order;
    }
    
    public Product getProduct() {
        return product;
    }
    
    public void setProduct(Product product) {
        this.product = product;
    }
    
    public Long getQuantity() {
        return quantity;
    }
    
    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }
    
    public Double getPrice() {
        return price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
}