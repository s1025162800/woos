package com.pc.service.meettingRoom;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dao.RoomDAO;
import com.dao.TypeDAO;
import com.pojo.Room;
import com.pojo.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ShowStateService {
    @Autowired
    RoomDAO dao;
    public IPage showstate(int page, int size,String types,String room,String state1){
        QueryWrapper<Room> qr = new QueryWrapper();//查什么表就什么表是泛型
        if(types.equals("0")==true&&state1.equals("0")==true){
        if(room!=null){
        qr.eq("room_id",room);
        qr.or();
        qr.like("room_name",room);
        }
        }
        if(types.equals("0")==false&&state1.equals("0")==false){
            if(state1.equals("1")){
            state1="可用";
            }else if(state1.equals("2")){
            state1="不可用";
            }
            if (room!=""){//用""是因为传过来的值是""
                qr.eq("state",state1);
                qr.eq("type_id",types);
                qr.eq("room_id",room);
                qr.or();
                qr.eq("state",state1);
                qr.eq("type_id",types);
                qr.like("room_name",room);
            }else{
                qr.eq("type_id",types);
                qr.eq("state",state1);
            }
        }
        if(types.equals("0")==true&&state1.equals("0")==false){
            if(state1.equals("1")){
                state1="可用";
            }else if(state1.equals("2")){
                state1="不可用";
            }
            if (room!=""){//用""是因为传过来的值是""
                qr.eq("state",state1);
                qr.eq("room_id",room);
                qr.or();
                qr.eq("state",state1);
                qr.like("room_name",room);
            }else{
                qr.eq("state",state1);
            }
        }
        if(types.equals("0")==false&&state1.equals("0")==true){
//            if(state1.equals("1")){
//                state1="可用";
//            }else if(state1.equals("2")){
//                state1="不可用";
//            }
            if (room!=""){//用""是因为传过来的值是""
                qr.eq("type_id",types);
                qr.eq("room_id",room);
                qr.or();
                qr.eq("type_id",types);
                qr.like("room_name",room);
            }else{
                qr.eq("type_id",types);
            }
        }
        Page p = new Page(page,size);
        // p.descs()
        IPage result = dao.selectPage(p,qr);
        return result;

    }

    public void changestate(String state,int room_id) {
        Map map=new HashMap();
        map.put("state",state);
        map.put("room_id",room_id);
        dao.changestate(map);
    }
    @Autowired
    TypeDAO typeDAO;
    public List<Type> showtypes() {
        QueryWrapper qr=new QueryWrapper();
        return  typeDAO.selectList(qr);
    }

}
