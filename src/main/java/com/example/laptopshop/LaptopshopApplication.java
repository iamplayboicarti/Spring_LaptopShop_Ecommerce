package com.example.laptopshop;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

// Anotation
@SpringBootApplication
(exclude = {
		org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class,
		org.springframework.boot.actuate.autoconfigure.security.servlet.ManagementWebSecurityAutoConfiguration.class
})

public class LaptopshopApplication {

	public static void main(String[] args) {
	ApplicationContext DaoAnhTuan = SpringApplication.run(LaptopshopApplication.class, args);
		for(String s: DaoAnhTuan.getBeanDefinitionNames())
		{
		System.out.println(s);	
		}
	}

}
