package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Room;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;
import java.util.Map;

public interface RoomDAO extends BaseMapper<Room> {
    @Select("SELECT room_id from room  ORDER BY room_id DESC limit 1 ;")
    public Object findlast();
    @Update(" update room set state=#{state} WHERE room_id=#{room_id};")
    void changestate(Map map);
}
