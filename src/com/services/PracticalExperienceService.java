package com.services;

import com.mapper.PracticalExperienceMapper;
import com.po.PracticalExperience;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PracticalExperienceService")
public class PracticalExperienceService {

    @Autowired
    private PracticalExperienceMapper practicalExperienceMapper;

    public List<PracticalExperience> findAllPracticalExperience(int uid) {
        return practicalExperienceMapper.findAllPracticalExperience(uid);
    }

    public void deletePracticalExperience(int peid) {
        practicalExperienceMapper.deletePracticalExperience(peid);
    }

    public void updatePracticalExperience(PracticalExperience praticalExperience) {
        practicalExperienceMapper.updatePracticalExperience(praticalExperience);
    }

    public void insertPracticalExperience(PracticalExperience praticalExperience) {
        practicalExperienceMapper.insertPracticalExperience(praticalExperience);
    }

}
