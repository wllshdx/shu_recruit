package com.mapper;

import com.common.Page;
import com.po.Admin;

import java.util.List;

/**
 */
public interface AdminMapper {

    //查找所有
    public List<Admin> getAll();

    //根据用户名查找
    public Admin findByUserName(String username);

    public int update(Admin admin);

    public int insert(Admin admin);

    public int delete(int id);

    public int findCount();
    public List<Admin> findAdmin(Page page);

}
