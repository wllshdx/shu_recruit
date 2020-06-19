package com.services;

import com.mapper.EducationExperienceMapper;
import com.po.EducationExperience;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("EducationExperienceService")
public class EducationExperienceService {
    @Autowired
    private EducationExperienceMapper educationExperienceMapper;

    public List<EducationExperience> findAllEducationExperience(int uid) {
        return this.educationExperienceMapper.findAllEducationExperience(uid);
    }

    public void deleteEducationExperience(int eid) {
        this.educationExperienceMapper.deleteEducationExperience(eid);
    }

    public void updateEducationExperience(
            EducationExperience educationExperience) {
        this.educationExperienceMapper.updateEducationExperience(educationExperience);
    }

    public void insertEducationExperience(
            EducationExperience educationExperience) {
        this.educationExperienceMapper.insertEducationExperience(educationExperience);
    }
}
