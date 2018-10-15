package com.mrxia.foodhub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mrxia.foodhub.domain.Ingredient;

/**
 * 食材数据库持久化类
 * @author xiazijian
 */
public interface IngredientRepository extends JpaRepository<Ingredient, Integer> {
}
