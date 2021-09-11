package com.monkeyhlj.repository;

import com.monkeyhlj.entity.Admin;

public interface AdminRepository {
    public Admin login(String username,String password);
}
