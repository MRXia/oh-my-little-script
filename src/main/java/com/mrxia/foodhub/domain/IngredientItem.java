package com.mrxia.foodhub.domain;


import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.springframework.data.jpa.domain.AbstractPersistable;

import lombok.Getter;
import lombok.Setter;

/**
 * 食材条目
 */
@Entity
@Setter
@Getter
public class IngredientItem extends AbstractPersistable<Integer> {

    @ManyToOne(cascade = CascadeType.MERGE)
    private Food food;

    @OneToOne
    private Ingredient ingredient;

    /**
     * 数量
     */
    private Double quantity;

    /**
     * 单位
     */
    private String unit;
}
