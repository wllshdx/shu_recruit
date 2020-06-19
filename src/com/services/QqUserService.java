package com.services;

import com.mapper.QqUserMapper;
import com.po.QqUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qqUserService")
public class QqUserService {

    @Autowired
    QqUserMapper qqUserMapper;

    public QqUser findQqUser(QqUser qqUser) throws Exception {
        return qqUserMapper.findQqUser(qqUser);
    }

    public QqUser findUser(QqUser qqUser) throws Exception {
        return qqUserMapper.findUser(qqUser);
    }

    public int inserQqUser(QqUser qqUser) throws Exception {
        return qqUserMapper.inserQqUser(qqUser);
    }

    public QqUser findQqCompany(QqUser qqUser) throws Exception {
        return qqUserMapper.findQqCompany(qqUser);
    }

    public QqUser findCompany(QqUser qqUser) throws Exception {
        return qqUserMapper.findCompany(qqUser);
    }

    public QqUser findQq(QqUser qqUser) throws Exception {
        return qqUserMapper.findQq(qqUser);
    }

}
