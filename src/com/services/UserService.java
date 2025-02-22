package com.services;

import com.mapper.UserMapper;
import com.po.User;
import com.utils.MD5Util;
import com.utils.SendMail;
import com.utils.ServiceException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

@Service("UserService")
public class UserService {

    @Autowired
    UserMapper userMapper;

    public User findUserByMail(String mail) {
        return userMapper.findUserByMail(mail);
    }

    public User findUserById(int uid) {
        return userMapper.findUserById(uid);
    }

    public List<User> findAllUser() {
        return userMapper.findAllUser();
    }

    public User findByEmailPwd(String mail, String pwd) {
        return userMapper.findByEmailPwd(mail, pwd);
    }

    public void deleteUser(int uid) {
        userMapper.deleteUser(uid);
    }

    public void updateUser(User user) {
        userMapper.updateUser(user);
    }

    public void insertUser(User user) {
        userMapper.insertUser(user);
    }

    public void validate(User user, String type) {
        String code = MD5Util.encode2hex(user.getMail());
        user.setState("1");
        user.setRegisterTime(new Date());
        user.setCode(code);//MD5加密

        StringBuilder sb = new StringBuilder("点击下面链接激活账号，24小时内生效，" +
                "否则重新注册账号，链接只能使用一次，请尽快激活！</br>");
        sb.append("<a href=\"http://localhost:8080/shu_recruit/register.action?action=activate&mail=");
        sb.append(user.getMail());
        sb.append("&validateCode=");
        sb.append(user.getCode());
        sb.append("&type=");
        sb.append(type);
        sb.append("\">http://localhost:8080/shu_recruit/register.action?action=activate&mail=");
        sb.append(user.getMail());
        sb.append("&validateCode=");
        sb.append(user.getCode());
        sb.append("&type=");
        sb.append(type);
        sb.append("</a>");
        //配置文件
        Properties prop = new Properties();
        String classPath = this.getClass().getClassLoader().getResource("/").getPath();
        FileInputStream fin;
        try {
            fin = new FileInputStream(classPath + "com/config/mail.properties");
            prop.load(fin);
        } catch (IOException e1) {
        }

        //邮箱配置信息
        String smtpHost = prop.getProperty("mail.host");
        String userName = prop.getProperty("mail.username");
        String password = prop.getProperty("mail.password");
        String messageType = prop.getProperty("mail.messageType");
        String messageText = sb.toString();
        SendMail sendMail = new SendMail();
        try {
            sendMail.sendMessage(smtpHost, userName, password, user.getMail(), messageText, messageType);
        } catch (MessagingException e) {
            e.printStackTrace();
            return;
        }
        userMapper.insertUser(user);
    }

    public void activate(String mail, String code) throws ServiceException {
        User user = userMapper.findUserByMail(mail);
        if (user != null) {
            if ("1".equals(user.getState())) {
                Date currentTime = new Date();
                Date registerTime = user.getRegisterTime();
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(registerTime);
                calendar.add(Calendar.DATE, 1);
                Date lastActiveTime = calendar.getTime();
                if (currentTime.before(lastActiveTime)) {
                    if (user.getCode().equals(code)) {
                        user.setState("2");
                        userMapper.updateUser(user);
                    } else {
                        throw new ServiceException("激活码不正确");
                    }
                } else {
                    throw new ServiceException("超过激活时间，请重新注册账号");
                }
            } else {
                throw new ServiceException("账号已激活，请重新登录");
            }
        } else {
            throw new ServiceException("用户不存在");
        }
    }
}
