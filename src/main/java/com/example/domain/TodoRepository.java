package com.example.domain;

import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by Abderrazak BOUADMA
 *
 * @since 4/19/17.
 */
public interface TodoRepository extends JpaRepository<Todo, Long> {
}
