package com.pc.action.meettingRoom;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.pc.service.meettingRoom.CdevicesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

import static com.alibaba.fastjson.JSON.parseObject;

@Controller
public class DeviceAction {
    @Autowired
    CdevicesService service;
    @RequestMapping("/cdevices")
    public String cdevices(@RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "5") int size,
                           @RequestParam(defaultValue = "0") String state1,
                           String device,
                           String state,
                           Integer device_id,
                           HttpServletRequest req)throws UnsupportedEncodingException {
        System.out.println(state1+device);
        if(state!=null&&device_id!=null){
        int i=service.updatastate(state,device_id);
        System.out.println(i);
    }
        IPage ipage=service.CdevicesService(page,size,state1,device);//创建mybatisplus的ipage对象，page代表当前页数,siz表示每页条数
        long  sum = ipage.getTotal(); //总条数
        int   count = (int)Math.ceil(1.0*sum/size); //总页数
        //将需要用到的属性放到attribute域中去,
        req.setAttribute("ipage",ipage);
        req.setAttribute("count",count);
        req.setAttribute("page",page);
        req.setAttribute("state1",state1);
        req.setAttribute("device",device);
        return "cDevices.jsp";
    }
}


