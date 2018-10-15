package com.mrxia.foodhub.domain;

import javax.persistence.Column;
import javax.persistence.Entity;

import org.springframework.data.jpa.domain.AbstractPersistable;

import lombok.Getter;
import lombok.Setter;

/**
 * 食材实体
 * @author xiazijian
 */
@Entity
@Setter
@Getter
public class Ingredient extends AbstractPersistable<Integer> {

    /**
     * 食品名称
     */
    @Column(unique = true)
    private String name;
}
