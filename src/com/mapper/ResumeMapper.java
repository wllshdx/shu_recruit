package com.mapper;

import com.po.Resume;
import com.po.ResumeCondition;
import com.po.StudentInfo;

import java.util.List;

/**
 * ResumeMapper
 * @author wll
 *
 */
public interface ResumeMapper {
	/**
	 * 查找全部简历
	 * @param uid
	 * @return
	 */
	public List<Resume> findAllResume(int uid);
	
	/**
	 * 通过id删除简历
	 * @param uid
	 */
	public void deleteResume(int uid);
	
	/**
	 * 更新简历
	 * @param resume
	 */
	public void updateResume(Resume resume);
	
	/**
	 * 新建简历
	 * @param resume
	 */
	public void insertResume(Resume resume);
	/**
	 * 条件查询简历
	 * @param resumeCondition
	 * @return Resume
	 */
	public List<Resume> findResume(ResumeCondition resumeCondition);
	/**
	 * 条件查询简历获取总数
	 */
	public int findResumeCount(ResumeCondition resumeCondition);

	public List<StudentInfo> findStudentInfo(ResumeCondition resumeCondition);

}
