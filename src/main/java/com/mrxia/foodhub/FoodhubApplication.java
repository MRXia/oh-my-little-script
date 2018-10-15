package com.mrxia.foodhub;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;

@SpringBootApplication
@EnableJpaAuditing
public class FoodhubApplication {

	public static void main(String[] args) {
		SpringApplication.run(FoodhubApplication.class, args);
	}
}
