package com.monkey.springbootvue.repository;

import com.monkey.springbootvue.entity.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book,Integer> {

}
