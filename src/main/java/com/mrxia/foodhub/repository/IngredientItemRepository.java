package com.mrxia.foodhub.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.mrxia.foodhub.domain.IngredientItem;

/**
 * 菜单项数据库持久类
 * @author xiazijian
 */
public interface IngredientItemRepository extends JpaRepository<IngredientItem, Integer> {
}
