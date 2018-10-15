package com.mrxia.foodhub.domain;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

import com.mrxia.common.domain.AbstractJsr310Auditable;

import lombok.Getter;
import lombok.Setter;

/**
 * 菜品实体
 */
@Entity
@Setter
@Getter
public class Food extends AbstractJsr310Auditable<Integer> {

    /**
     * 菜品名称
     */
    private String name;

    @OneToMany(cascade = CascadeType.ALL, mappedBy = "food")
    private List<IngredientItem> ingredientItems;

}
