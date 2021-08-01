package com.monkey.springbootvue.controller;

import com.monkey.springbootvue.entity.Book;
import com.monkey.springbootvue.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/book")
// @CrossOrigin
public class BookHandler {

    @Autowired
    private BookRepository bookRepository;

    @GetMapping("/findAll/{page}/{size}")
    public Page<Book> findAll(@PathVariable("page") Integer page,@PathVariable("size") Integer size){
        PageRequest request = PageRequest.of(page,size);
        return bookRepository.findAll(request);
    }

    @PostMapping("/save")
    public String save(@RequestBody Book book){
        Book result = bookRepository.save(book);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @GetMapping("/findById/{id}")
    public Book findById(@PathVariable("id") Integer id){
        return bookRepository.findById(id).get();
    }

    @PutMapping("/updateshu")
    public String updateshu(@RequestBody Book book){
        Book result = bookRepository.save(book);
        if(result != null){
            return "success";
        }else{
            return "error";
        }
    }

    @DeleteMapping("/deleteById/{id}")
    void deleteshu(@PathVariable("id") Integer id){
        bookRepository.deleteById(id);
    }

}
