package com.services;

import com.mapper.ResumeMapper;
import com.mapper.UserMapper;
import com.po.*;
import com.utils.ExcelUtil;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service("ResumeService")
public class ResumeService {
    @Autowired
    private ResumeMapper resumeMapper;
    @Autowired
    private UserMapper userMapper;
    @Autowired
    PositionResumeManagementService positionResumeManagementService;

    public List<Resume> findAllResume(int uid) {
        return resumeMapper.findAllResume(uid);
    }

    public void deleteResume(int rid) {
        resumeMapper.deleteResume(rid);
    }

    public void updateResume(Resume resume) {
        resumeMapper.updateResume(resume);
    }

    public void insertResume(Resume resume) {
        resumeMapper.insertResume(resume);
    }

    public List<Resume> findResume(ResumeCondition resumeCondition)
            throws Exception {
        return resumeMapper.findResume(resumeCondition);
    }

    public List<StudentInfo> findStudentInfo(ResumeCondition resumeCondition) {
        return resumeMapper.findStudentInfo(resumeCondition);
    }

    public int findResumeCount(ResumeCondition resumeCondition)
            throws Exception {
        return resumeMapper.findResumeCount(resumeCondition);
    }

    public File exportExcelTemplate() throws IOException {
        Map<String, String[]> templateHead = new LinkedHashMap<>();
        templateHead.put("学号", null);
        templateHead.put("邮件", null);
        templateHead.put("密码", null);
        return ExcelUtil.exportTemplateExcelEx(templateHead);
    }

    public void importCreate(MultipartFile file) throws IOException {
        String outFileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        List<User> userList;
        try {
            InputStream inputStream = file.getInputStream();
            IOUtils.copy(inputStream, new FileOutputStream(outFileName));
            Map<String, String> readMapHead = new LinkedHashMap<>();
            readMapHead.put("学号", "学号");
            readMapHead.put("邮箱", "邮箱");
            readMapHead.put("密码", "密码");
            userList = ExcelUtil.readExcel(outFileName, readMapHead, User.class);
            for (User user : userList) {
                user.setState("3");
                user.setRegisterTime(new Date());
                userMapper.insertUser(user);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public File exportEmployment() throws Exception {
        List<UserResume> userResume = positionResumeManagementService.findUserResume();
        LinkedHashMap<String, String> headMap = new LinkedHashMap<>();
        headMap.put("sno", "学号");
        headMap.put("name", "姓名");
        headMap.put("sex", "性别");
        headMap.put("companyname", "公司名");
        headMap.put("position", "职位");
        headMap.put("comment", "公司评价");
        File os = null;
        try {
            os = ExcelUtil.exportExcel(headMap, userResume);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return os;
    }
}
