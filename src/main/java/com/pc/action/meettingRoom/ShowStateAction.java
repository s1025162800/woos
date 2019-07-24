package com.pc.action.meettingRoom;

import com.pc.service.meettingRoom.ShowStateService;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.pojo.Type;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.List;

@Controller
public class ShowStateAction {
    @Autowired
    ShowStateService showStateService;
    @Autowired
    HttpServletRequest request;
    @RequestMapping("/showit")
    public String showit(@RequestParam(defaultValue = "0") String types,
                         @RequestParam(defaultValue = "1") Integer page,
                         @RequestParam(defaultValue = "6")  int size,
                         @RequestParam(defaultValue = "1") String state , @RequestParam(defaultValue = "0") String state1,
                         String room,Integer room_id) throws UnsupportedEncodingException {
//        System.out.println(state);
//        System.out.println(room_id);
//        System.out.println(room);
        System.out.println(room);
        System.out.println(types);
        System.out.println(state1);
        if (state!=null&&room_id!=null){
        showStateService.changestate(state,room_id);
        }

        IPage ipage=showStateService.showstate(page,size,types,room,state1);
        System.out.println(ipage.getRecords());
        long  sum = ipage.getTotal(); //总条数
        int   count = (int)Math.ceil(1.0*sum/size); //总页数
        List<Type> list=showStateService.showtypes();
        request.setAttribute("room",room);
        request.setAttribute("state1",state1);
        request.setAttribute("types",types);
        request.setAttribute("type",list);
        request.setAttribute("ipage",ipage);
        request.setAttribute("count",count);//总页数
        request.setAttribute("page",page);
        return "/showstate.jsp";
    }

}
