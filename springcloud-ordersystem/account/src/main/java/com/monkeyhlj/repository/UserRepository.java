package com.monkeyhlj.repository;

import com.monkeyhlj.entity.User;

public interface UserRepository {
    public User login(String username,String password);
}
