package com.mapper;

import com.po.Position;

import java.util.List;

public interface PositionMapper {
	/**
	 * 查找全部符合的职位
	 * @return 职位List
	 */
	public List<Position> findPosition(Position position);
	
	/**
	 * 查找满足查找条件的职位数目
	 * @param position
	 * @return
	 */
	public int findPositionCount(Position position);
	
	/**
	 * 查找全部职位
	 * @return
	 */
	public List<Position> findAllPosition();
	/**
	 * 根据关键词，地点，工作经验，学历要求，薪水查找简历 
	 * @param position
	 * @return List
	 */
	public List<Position> findPositionByCondition(Position position);

	public List<Position> findPositionByAdmin(Position position);
	/**
	 * 根据关键词，地点，工作经验，学历要求，薪水查找简历 返回总行数
	 * @param position
	 * @return int
	 */
	public int findPositionByConditionCount(Position position);

	public void deleteByPid(int pid);
	
}
