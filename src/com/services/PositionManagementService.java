package com.services;

import com.mapper.PositionManagementMapper;
import com.po.Position;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("PositionManagementService")
public class PositionManagementService {
    @Autowired
    PositionManagementMapper positionManagementMapper;

    public void addPosition(Position position) throws Exception {
        positionManagementMapper.addPosition(position);
    }

    public List<Position> findPosition(Position position) throws Exception {
        return positionManagementMapper.findPosition(position);
    }

    public Position showPosition(int pid) throws Exception {
        return positionManagementMapper.showPosition(pid);
    }

    public void deletePosition(Integer[] positionPid) throws Exception {
        positionManagementMapper.deletePosition(positionPid);
    }

    public List<Position> findOnPosition(Position position) throws Exception {
        return positionManagementMapper.findOnPosition(position);
    }

    public List<Position> findOverPosition(Position position) throws Exception {
        return positionManagementMapper.findOverPosition(position);
    }

    public int countByCid(int cid) throws Exception {
        return positionManagementMapper.countByCid(cid);
    }

    public int countOnByCid(int cid) throws Exception {
        return positionManagementMapper.countOnByCid(cid);
    }

    public int countOverByCid(int cid) throws Exception {
        return positionManagementMapper.countOverByCid(cid);
    }

    public void endPosition(Integer[] positionPid) throws Exception {
        positionManagementMapper.endPosition(positionPid);
    }
}
