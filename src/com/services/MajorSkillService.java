package com.services;

import com.mapper.MajorSkillMapper;
import com.po.MajorSkill;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("majorSkillSerivce")
public class MajorSkillService {

    @Autowired
    private MajorSkillMapper majorSkillMapper;


    public List<MajorSkill> findAllMajorSkill(int uid) {
        return this.majorSkillMapper.findAllMajorSkill(uid);
    }


    public void deleteMajorSkill(int mid) {
        this.majorSkillMapper.deleteMajorSkill(mid);
    }


    public void updateMajorSkill(MajorSkill majorSkill) {
        this.majorSkillMapper.updateMajorSkill(majorSkill);
    }


    public void insertMajorSkill(MajorSkill majorSkill) {
        this.majorSkillMapper.insertMajorSkill(majorSkill);
    }

}
