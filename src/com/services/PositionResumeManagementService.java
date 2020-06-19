package com.services;

import com.mapper.PositionResumeManagementMapper;
import com.po.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author wll
 */
@Service("positionResumeManagementService")
public class PositionResumeManagementService {
    @Autowired
    PositionResumeManagementMapper positionResumeManagementMapper;
    @Autowired
    CommonService commonService;

    public ShowPositionResume findPositionResume(ShowPositionResume showPositionResume)
            throws Exception {
        return this.positionResumeManagementMapper.findPositionResume(showPositionResume);
    }

    public List<com.po.PositionResumeManagement> findPositionByCid(com.po.PositionResumeManagement positionResumeManagement) throws Exception {
        return this.positionResumeManagementMapper.findPositionByCid(positionResumeManagement);
    }

    public int findPositionByCidCount(
            com.po.PositionResumeManagement positionResumeManagement) throws Exception {
        return this.positionResumeManagementMapper.findPositionByCidCount(positionResumeManagement);
    }

    public int findPositionResumeCount(ShowPositionResume showPositionResume)
            throws Exception {
        return this.positionResumeManagementMapper.findPositionResumeCount(showPositionResume);
    }

    public List<PersonalResume> findPersonalResume(List<Integer> uidSet)
            throws Exception {
        List<PersonalResume> personalResume;
        personalResume = this.positionResumeManagementMapper.findPersonalResume(uidSet);
        for (int i = 0; i < personalResume.size(); i++) {
            if (!personalResume.get(i).getEducationExperienceList().isEmpty()) {
                personalResume.get(i).setSchool(personalResume.get(i).getEducationExperienceList().get(0).getSchool());
                personalResume.get(i).setMajor(personalResume.get(i).getEducationExperienceList().get(0).getMajor());
                for (int j = 0; j < personalResume.get(i).getEducationExperienceList().size(); j++) {
                    String education = personalResume.get(i).getEducationExperienceList().get(j).getEducation();
                    if (education != null && education.equals("1")) {
                        education = "大专";
                    } else if (education != null && education.equals("2")) {
                        education = "本科";
                    } else if (education != null && education.equals("3")) {
                        education = "硕士";
                    } else if (education != null && education.equals("4")) {
                        education = "博士";
                    } else {
                        education = "其他";
                    }
                    personalResume.get(i).getEducationExperienceList().get(j).setEducation(education);
                }
                personalResume.get(i).setEducation(personalResume.get(i).getEducationExperienceList().get(0).getEducation());
            }
        }
        return personalResume;
    }

    public ShowCompanyResume findCompanyResume(ShowCompanyResume showCompanyResume) throws Exception {
        return this.positionResumeManagementMapper.findCompanyResume(showCompanyResume);
    }

    public int findCompanyResumeCount(ShowCompanyResume showCompanyResume) throws Exception {
        return this.positionResumeManagementMapper.findCompanyResumeCount(showCompanyResume);
    }

    public void updatePositionResume(Map<?, ?> map) throws Exception {
        this.positionResumeManagementMapper.updatePositionResume(map);
    }

    public void insertPositionResume(PositionResume positionResume) {
        this.positionResumeManagementMapper.insertPositionResume(positionResume);
    }

    public List<UserResume> findUserResume() {
        return this.positionResumeManagementMapper.findUserResume();
    }
}