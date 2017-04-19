package com.example;

import com.example.domain.Todo;
import com.example.domain.TodoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.transaction.Transactional;
import java.util.List;

@SpringBootApplication
@EnableJpaRepositories(basePackages = {"com.example.domain"})
@Transactional
@RestController
public class DatasourceDemoApplication {

    @Autowired
    TodoRepository todoRepository;

    public static void main(String[] args) {
        SpringApplication.run(DatasourceDemoApplication.class, args);
    }

/*    @Bean
    CommandLineRunner commandLineRunner() {
        return strings -> {
            Todo todo = new Todo();
            todo.setTitle("Hello there");
            todoRepository.save(todo);

            todo = new Todo();
            todo.setTitle("Hello there 2");
            todoRepository.save(todo);

            todo = new Todo();
            todo.setTitle("Hello there 3");
            todoRepository.save(todo);
        };
    }*/

    @GetMapping("/hello")
    ResponseEntity<List<Todo>> sayHello() {
        return ResponseEntity.ok().body(todoRepository.findAll());
    }
}
