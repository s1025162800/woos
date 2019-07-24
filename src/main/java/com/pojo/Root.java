package com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

public class Root implements Serializable {
    @TableId(type = IdType.AUTO)
    private int root_id;
    private String root_name;
    private String password;

    public int getRoot_id() {
        return root_id;
    }

    public void setRoot_id(int root_id) {
        this.root_id = root_id;
    }

    public String getRoot_name() {
        return root_name;
    }

    public void setRoot_name(String root_name) {
        this.root_name = root_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
