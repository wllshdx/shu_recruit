package com.services;

import com.mapper.PositionMapper;
import com.po.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PositionService")
public class PositionService {

    @Autowired
    PositionMapper positionMapper;

    public List<Position> findPosition(Position position) {
        return positionMapper.findPosition(position);
    }

    public int findPositionCount(Position position) {
        return positionMapper.findPositionCount(position);
    }

    public List<Position> findAllPosition() {
        return positionMapper.findAllPosition();
    }

    public List<Position> findPositionByCondition(Position position) {
        return positionMapper.findPositionByCondition(position);
    }

    public List<Position> findPositionByAdmin(Position position) {
        return positionMapper.findPositionByAdmin(position);
    }

    public int findPositionByConditionCount(Position position) {
        return positionMapper.findPositionByConditionCount(position);
    }

    public void deleteByPid(int pid) {
        positionMapper.deleteByPid(pid);
    }

}
