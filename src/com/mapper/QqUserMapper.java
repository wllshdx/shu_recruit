package com.mapper;

import com.po.QqUser;

public interface QqUserMapper {
    /**
     * 通过openId和用户类型查找 QqUserService
     */
    public QqUser findQqUser(QqUser qqUser) throws Exception;

    /**
     * 通过openId和用户类型查找 公司
     */
    public QqUser findQqCompany(QqUser qqUser) throws Exception;

    /**
     * 通过openId和用户类型查找QQ用户
     */
    public QqUser findQq(QqUser qqUser) throws Exception;

    /**
     * 通过用户输入的mail和password和type查找用户是否存在
     */

    public QqUser findUser(QqUser qqUser) throws Exception;

    /**
     * 通过用户输入的mail和password和type查找公司是否存在
     */
    public QqUser findCompany(QqUser qqUser) throws Exception;

    /**
     * 插入一条open,id,type到qqUser表中
     */
    public int inserQqUser(QqUser qqUser) throws Exception;
}
