package com.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.pojo.Type;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface TypeDAO extends BaseMapper<Type> {
    @Select("select type_id from type where type_name=#{type_name}")
    public int findroom_id( String type_name);
}
