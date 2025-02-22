package com.controller;

import com.common.Page;
import com.po.Admin;
import com.po.ResumeCondition;
import com.po.StudentInfo;
import com.services.AdminService;
import com.services.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class AdminController {

    @Autowired
    ResumeService resumeService;
    @Autowired
    AdminService adminService;

    /**
     * 用户信息列表
     */
    @RequestMapping("/findResume11")
    public String findResume(Model model, String keys, ResumeCondition resumeCondition, @RequestParam(value = "page", defaultValue = "1") Integer page) throws Exception {
        String[] arra;
        List<StudentInfo> resuemList = new ArrayList<StudentInfo>();
        arra = keys.split(" ");
        resumeCondition.setKey(arra);
        int totalRows = resumeService.findResumeCount(resumeCondition);
        System.out.println("totalRows:" + totalRows);
        if (totalRows > 0) {
            resumeCondition.setTotalRows(totalRows);

            resumeCondition.setCurrentPage(page);
            resuemList = resumeService.findStudentInfo(resumeCondition);
        }
        model.addAttribute("list", resuemList);
        model.addAttribute("page", resumeCondition);
        model.addAttribute("keys", keys);
        return "/search_resume_result_codition";
    }

    /**
     * 用户信息列表
     */
    @RequestMapping("/findAdmin")
    public String findResume(Model model, @RequestParam(value = "page", defaultValue = "1") Integer page) throws Exception {
        Page page1 = new Page();
        int totalRows = adminService.findCount();
        List<Admin> admins = new ArrayList<>();
        System.out.println("totalRows:" + totalRows);
        if (totalRows > 0) {
            page1.setTotalRows(totalRows);

            page1.setCurrentPage(page);
            admins = adminService.findAdmin(page1);
        }
        model.addAttribute("list", admins);
        model.addAttribute("currentPage", page1.getCurrentPage());
        model.addAttribute("totalPage", page1.getTotalPage());
        return "/admin/adminManage";
    }

    @RequestMapping("/deleteAdmin")
    @Transactional
    public String deleteAdmin(HttpServletResponse response, Model model, String ids) throws Exception {
        if (ids != null && !ids.equals("")) {
            String[] idArr = ids.split(",");
            for (String id : idArr) {
                adminService.delete(Integer.valueOf(id));
            }
        }
        response.sendRedirect("findAdmin.action");
        return null;
    }


    @RequestMapping("/insertAdmin")
    public String insertAdmin(HttpServletResponse response, Model model, Admin admin) throws Exception {
        admin.setCreateDate(new Date());
        adminService.insert(admin);
        response.sendRedirect("findAdmin.action");
        return null;
    }

    /**
     * 学生信息导入下载模板
     *
     * @return
     * @throws IOException
     */
    @RequestMapping("/template")
    public void exportTemplateExcel(HttpServletResponse response) throws IOException {

        File file = resumeService.exportExcelTemplate();
        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            response.setHeader("Content-disposition", "attachment;filename=" + file.getName());
            response.setContentType("application/vnd.ms-excel");
            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = fis.read(bytes)) > 0) {
                os.write(bytes, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 学生信息导入
     *
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/importUser")
    public String batchCreate(@RequestParam(value = "file") MultipartFile request) throws Exception {
        resumeService.importCreate(request);
        return "/admin/usermanage";
    }

    /**
     * 学生就业信息导出
     *
     * @return
     * @throws IOException
     */
    @RequestMapping("/exportEmployment")
    public void exportExcel(HttpServletResponse response) throws Exception {

        File file = resumeService.exportEmployment();
        try (FileInputStream fis = new FileInputStream(file);
             OutputStream os = response.getOutputStream()) {
            response.setHeader("Content-disposition", "attachment;filename=" + file.getName());
            response.setContentType("application/vnd.ms-excel");
            int len = 0;
            byte[] bytes = new byte[1024];
            while ((len = fis.read(bytes)) > 0) {
                os.write(bytes, 0, len);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 用户管理页面
     */
    @RequestMapping("/userManage")
    public String userManage(Model model, String keys, ResumeCondition resumeCondition, @RequestParam(value = "page", defaultValue = "1") Integer page) throws Exception {
        String[] arra = {""};
        List<StudentInfo> resuemList = new ArrayList<StudentInfo>();
        if (keys != null && !"".equals(keys)) {
            arra = keys.split(" ");
        }
        resumeCondition.setKey(arra);
        int totalRows = resumeService.findResumeCount(resumeCondition);
        System.out.println("totalRows:" + totalRows);
        if (totalRows > 0) {
            resumeCondition.setTotalRows(totalRows);

            resumeCondition.setCurrentPage(page);
            resuemList = resumeService.findStudentInfo(resumeCondition);
        }
        model.addAttribute("list", resuemList);
        model.addAttribute("currentPage", resumeCondition.getCurrentPage());
        model.addAttribute("totalPage", resumeCondition.getTotalPage());
        model.addAttribute("keys", keys);
        return "/admin/usermanage";
    }


}
