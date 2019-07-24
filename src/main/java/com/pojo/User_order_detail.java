package com.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class User_order_detail implements Serializable {
    private int order_id;
    private int room_id;
    @DateTimeFormat(pattern = "yyyy-mm-dd HH")
    private Date start_time;
    @DateTimeFormat(pattern = "yyyy-mm-dd HH")
    private Date end_time;
    @DateTimeFormat(pattern = "yyyy-mm-dd HH:MM")
    private Date order_time;
    private String state;
    private float room_cost;
    private float other_cost;
    private String other_cost_detail;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public Date getStart_time() {
        return start_time;
    }

    public void setStart_time(Date start_time) {
        this.start_time = start_time;
    }

    public Date getEnd_time() {
        return end_time;
    }

    public void setEnd_time(Date end_time) {
        this.end_time = end_time;
    }

    public Date getOrder_time() {
        return order_time;
    }

    public void setOrder_time(Date order_time) {
        this.order_time = order_time;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public float getRoom_cost() {
        return room_cost;
    }

    public void setRoom_cost(float room_cost) {
        this.room_cost = room_cost;
    }

    public float getOther_cost() {
        return other_cost;
    }

    public void setOther_cost(float other_cost) {
        this.other_cost = other_cost;
    }

    public String getOther_cost_detail() {
        return other_cost_detail;
    }

    public void setOther_cost_detail(String other_cost_detail) {
        this.other_cost_detail = other_cost_detail;
    }
}
