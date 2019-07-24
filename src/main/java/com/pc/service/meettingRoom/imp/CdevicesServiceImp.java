package com.pc.service.meettingRoom.imp;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.dao.DeviceDAO;
import com.pc.service.meettingRoom.CdevicesService;
import com.pojo.Device;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CdevicesServiceImp implements CdevicesService {
    @Autowired
    DeviceDAO dao;
    @Override
    public IPage CdevicesService(int page, int size,String state1,String device) {
        QueryWrapper qr=new QueryWrapper();//创建qr对象
        if(state1.equals("1")==true){
            state1="可用";
        }else if(state1.equals("2")==true){
            state1="不可用";
        }
        if(state1.equals("0")==true&&device!=null){
            qr.eq("device_id",device);
            qr.or();
            qr.like("device_name",device);
        }
        if(state1.equals("0")==false&&device!=null){
            qr.eq("state",state1);
            qr.eq("device_id",device);
            qr.or();
            qr.eq("state",state1);
            qr.like("device_name",device);
        }
        Page p=new Page(page,size);
        IPage ipage=dao.selectPage(p,qr);//将qr和带有page,size的page对象一起注入然后返回ipage对象
        return ipage;
    }

    @Override
    public int updatastate(String state, int device_id) {
        Device device=new Device();
        device.setDevice_id(device_id);
        device.setState(state);
        int i=dao.updateById(device);
        return i;
    }
}
