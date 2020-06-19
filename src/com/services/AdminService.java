package com.services;

import com.common.Page;
import com.mapper.AdminMapper;
import com.po.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * */
@Service
public class AdminService {

    @Autowired
    private AdminMapper adminMapper;

    public List<Admin> getAll() {
        return adminMapper.getAll();
    }

    public Admin findByUserName(String username) {
        return adminMapper.findByUserName(username);
    }

    public void update(Admin admin) {
        adminMapper.update(admin);
    }

    public void insert(Admin admin) {
        adminMapper.insert(admin);
    }

    public void delete(int id) {
        adminMapper.delete(id);
    }

    public int findCount() {
        return adminMapper.findCount();
    }

    public List<Admin> findAdmin(Page page) {
        return adminMapper.findAdmin(page);
    }
}
