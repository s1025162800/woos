package com.pc.service.meettingRoom;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.dao.RoomDAO;
import com.dao.Room_detailDAO;
import com.dao.TypeDAO;
import com.pojo.Room;
import com.pojo.Room_detail;
import com.pojo.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AddRoomService {

    @Autowired
    RoomDAO dao;
    public int addRoom(Room room){
    int i=dao.insert(room);
    return i;
    }
    @Autowired
    TypeDAO dao1;
    public List<Type> showtypes(){
        QueryWrapper qr=new QueryWrapper();
       List<Type> list=dao1.selectList(qr);
    return list;
    }
    @Transactional
    public void addtwo(){
        Type t=new Type();
        t.setType_name("短的名字");
        Type t1=new Type();
        t1.setType_name("长的名字不能添加！");
        dao1.insert(t);
        dao1.insert(t1);
    }
    @Autowired
    RoomDAO roomDAO;
    public Object findlast(){
    return  roomDAO.findlast();
    }
    @Autowired
    TypeDAO typeDAO;
    public int findroom_id(String type_name){
        return  typeDAO.findroom_id(type_name);
    }
    @Autowired
    Room_detailDAO  room_detailDAO;
    public void addroom_detail(Room_detail room_detail){
              room_detailDAO.insert(room_detail);
    }
}
