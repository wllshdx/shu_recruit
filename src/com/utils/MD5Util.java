package com.utils;

import org.springframework.util.DigestUtils;

/**
 * MD5加密
 *
 * @author wll
 */
public class MD5Util {

    public static String encode2hex(String source) {
        return DigestUtils.md5DigestAsHex(source.getBytes());

    }

    public static boolean validate(String unknown, String okHex) {
        return okHex.equals(encode2hex(unknown));
    }

    public static void main(String[] args) {
        String password = "123";
        System.out.println(encode2hex(password));
    }

}
