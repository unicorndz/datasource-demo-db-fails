package com.example.domain;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 * Created by Abderrazak BOUADMA
 *
 * @since 4/19/17.
 */
@Entity
@Data
@NoArgsConstructor
public class Todo {

    @Id @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String title;
}
