package com.example.laptopshop.domain;

import jakarta.persistence.*;
import java.util.List;

@Entity
@Table(name = "products")
public class Product {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false, length = 200)
    private String name;
    
    @Column(nullable = false)
    private Double price;
    
    @Column(length = 255)
    private String image;
    
    @Column(columnDefinition = "TEXT")
    private String detailDesc;
    
    @Column(length = 500)
    private String shortDesc;
    
    private Long quantity; // Số lượng tồn kho
    
    private Long sold; // Số lượng đã bán
    
    @Column(length = 100)
    private String factory; // Dell, HP, Asus, Lenovo...
    
    @Column(length = 100)
    private String target; // gaming, văn phòng, sinh viên...
    
    // Quan hệ N-N: Product có nhiều OrderProduct
    @OneToMany(mappedBy = "product", fetch = FetchType.LAZY)
    private List<OrderProduct> orderProducts;
    
    // Constructors
    public Product() {}
    
    // Getters & Setters
    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public Double getPrice() {
        return price;
    }
    
    public void setPrice(Double price) {
        this.price = price;
    }
    
    public String getImage() {
        return image;
    }
    
    public void setImage(String image) {
        this.image = image;
    }
    
    public String getDetailDesc() {
        return detailDesc;
    }
    
    public void setDetailDesc(String detailDesc) {
        this.detailDesc = detailDesc;
    }
    
    public String getShortDesc() {
        return shortDesc;
    }
    
    public void setShortDesc(String shortDesc) {
        this.shortDesc = shortDesc;
    }
    
    public Long getQuantity() {
        return quantity;
    }
    
    public void setQuantity(Long quantity) {
        this.quantity = quantity;
    }
    
    public Long getSold() {
        return sold;
    }
    
    public void setSold(Long sold) {
        this.sold = sold;
    }
    
    public String getFactory() {
        return factory;
    }
    
    public void setFactory(String factory) {
        this.factory = factory;
    }
    
    public String getTarget() {
        return target;
    }
    
    public void setTarget(String target) {
        this.target = target;
    }
    
    public List<OrderProduct> getOrderProducts() {
        return orderProducts;
    }
    
    public void setOrderProducts(List<OrderProduct> orderProducts) {
        this.orderProducts = orderProducts;
    }
}