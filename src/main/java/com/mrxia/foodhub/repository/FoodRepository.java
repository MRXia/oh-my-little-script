package com.mrxia.foodhub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mrxia.foodhub.domain.Food;

/**
 * 菜品对象数据库持久类
 * @author xiazijian
 */
public interface FoodRepository extends JpaRepository<Food, Integer> {
}
