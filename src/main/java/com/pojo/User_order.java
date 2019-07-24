package com.pojo;

import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

public class User_order implements Serializable {
    private int order_id;
    private int open_id;
    //下单时间
    @DateTimeFormat(pattern = "yyyy-mm-dd HH:MM")
    private Date time;
    //公司
    private String company;
    //联系人
    private int tel;
    private float cost;

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public int getOpen_id() {
        return open_id;
    }

    public void setOpen_id(int open_id) {
        this.open_id = open_id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public int getTel() {
        return tel;
    }

    public void setTel(int tel) {
        this.tel = tel;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }
}
