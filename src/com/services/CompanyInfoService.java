package com.services;

import com.mapper.CompanyInfoMapper;
import com.po.CompanyInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * */
@Service("CompanyInfoService")
public class CompanyInfoService {
    @Autowired
    CompanyInfoMapper companyInfoMapper;

    public CompanyInfo findCompanyInfo(int ciid) throws Exception {
        return companyInfoMapper.findCompanyInfo(ciid);
    }

    public void addCompanyInfo(CompanyInfo companyInfo) throws Exception {
        companyInfoMapper.addCompanyInfo(companyInfo);
    }

    public void updateCompanyInfo(CompanyInfo companyInfo) throws Exception {
        companyInfoMapper.updateCompanyInfo(companyInfo);
    }

    public CompanyInfo findCompanyInfoByName(String companyName)
            throws Exception {
        return companyInfoMapper.findCompanyInfoByName(companyName);
    }
}
