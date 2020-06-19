package com.services;

import com.mapper.ProjectMapper;
import com.po.Project;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("ProjectService")
public class ProjectService {

    @Autowired
    private ProjectMapper projectMapper;

    public List<Project> findAllProject(int uid) {
        return projectMapper.findAllProject(uid);
    }

    public void deleteProject(int pid) {
        projectMapper.deleteProject(pid);
    }

    public void updateProject(Project project) {
        projectMapper.updateProject(project);
    }

    public void insertProject(Project project) {
        projectMapper.insertProject(project);
    }

}
