package com.pc.action.meettingRoom;

import com.pc.service.meettingRoom.AddRoomService;
import com.pojo.Room;
import com.pojo.Room_detail;
import com.pojo.Type;
import com.pojo.test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class AddRoomAction {
    boolean sum=true;
    int room_id=0;
    @Autowired
    AddRoomService service;
    @ResponseBody
    @RequestMapping("/add")
    public String addroom( Room room, MultipartFile file) {
        System.out.println(room);
        int i = service.addRoom(room);
        System.out.println(i);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("nba.html");
        return "index.jsp";
    }

    @RequestMapping("/upload1")
    public String showtypes(HttpServletRequest req) {
        List<Type> list = service.showtypes();
        req.setAttribute("list", list);
        System.out.println(list);
        return "upload1.jsp";
    }
    @RequestMapping("/qwer")
    public String qwer(){
        sum=true;
        return "upload.jsp";
    }
    @ResponseBody
    @RequestMapping("/test")
    public String test(@RequestBody test test) {
        System.out.println(test.getId()+test.getName());
        return "1";
    }
    @ResponseBody
    @RequestMapping("/upload")
    public Map<String,Object> upload(@RequestParam MultipartFile file, HttpServletRequest req) throws IOException{
        System.out.println(file.getOriginalFilename());
        String newfilename=file.getOriginalFilename();
        String realpath=req.getServletContext().getRealPath("/image");
        File target=new File(realpath,newfilename);
        file.transferTo(target);
        Map<String,Object> maps=new HashMap();
        Map<String,Object> map=new HashMap();
        map.put("src","www.baidu.com");
        maps.put("code","0");
        maps.put("msg","房间新增成功");
        maps.put("data",map);
        return  maps;
    }
   @ResponseBody
    @RequestMapping("/ttst")
    public Map<String,Object>  show(@RequestParam MultipartFile file, Room room,Room_detail room_detail,HttpServletRequest req) throws IOException {
        int room_id=0;
        String newfilename=System.currentTimeMillis()+".jpg";
        if(service.findlast()==null){
            room_id=1;
        }else {room_id= (int) service.findlast()+1;}
        room_detail.setRoom_id(room_id);
        room.setType_id(service.findroom_id(room.getType_name()));
        room.setImg(newfilename);
        service.addroom_detail(room_detail);
        service.addRoom(room);
       System.out.println(newfilename);
        String realpath=req.getServletContext().getRealPath("/image");
        File target=new File(realpath,newfilename);
        file.transferTo(target);
        Map<String,Object> maps=new HashMap();
        Map<String,Object> map=new HashMap();
        map.put("src","www.baidu.com");
        maps.put("code","0");
        maps.put("msg","房间新增成功");
        maps.put("data",map);
        return  maps;
//        System.out.println(room);
//        System.out.println(room_detail);
//        System.out.println(file.getOriginalFilename());
    }
}