package com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

public class Device implements Serializable {
    @TableId(type = IdType.AUTO)
    private int device_id;
    private String device_name;
    private String state;

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getDevice_id() {
        return device_id;
    }

    public void setDevice_id(int device_id) {
        this.device_id = device_id;
    }

    public String getDevice_name() {
        return device_name;
    }

    public void setDevice_name(String device_name) {
        this.device_name = device_name;
    }

    @Override
    public String toString() {
        return "Device{" +
                "device_id=" + device_id +
                ", device_name='" + device_name + '\'' +
                ", state='" + state + '\'' +
                '}';
    }
}
