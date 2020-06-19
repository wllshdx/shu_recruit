package com.controller.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 日期转换器
 *
 * @author wll
 */
public class DateConverter implements Converter<String, Date> {

    @Override
    public Date convert(String source) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            System.out.println("123");
            return sdf.parse(source);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;

    }

}
