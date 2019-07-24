package com.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

public class Room implements Serializable {
    @TableId(type = IdType.AUTO)
    private int room_id;
    private String room_name;
    private int type_id;
    private String type_name;
    //规模
    private int min_scale;
    private int max_scale;
    private String detail;
    private String img;
    private String location;
    private float price;
    //评分
    private float grade;
    //押金
    private float deposit;
    //状态（上架、下架）
    private String state;

    public int getRoom_id() {
        return room_id;
    }

    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }

    public String getRoom_name() {
        return room_name;
    }

    public void setRoom_name(String room_name) {
        this.room_name = room_name;
    }

    public int getType_id() {
        return type_id;
    }

    public void setType_id(int type_id) {
        this.type_id = type_id;
    }

    public String getType_name() {
        return type_name;
    }

    public void setType_name(String type_name) {
        this.type_name = type_name;
    }

    public int getMin_scale() {
        return min_scale;
    }

    public void setMin_scale(int min_scale) {
        this.min_scale = min_scale;
    }

    public int getMax_scale() {
        return max_scale;
    }

    public void setMax_scale(int max_scale) {
        this.max_scale = max_scale;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public float getGrade() {
        return grade;
    }

    public void setGrade(float grade) {
        this.grade = grade;
    }

    public float getDeposit() {
        return deposit;
    }

    public void setDeposit(float deposit) {
        this.deposit = deposit;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Room{" +
                "room_id=" + room_id +
                ", room_name='" + room_name + '\'' +
                ", type_id=" + type_id +
                ", type_name='" + type_name + '\'' +
                ", min_scale=" + min_scale +
                ", max_scale=" + max_scale +
                ", detail='" + detail + '\'' +
                ", img='" + img + '\'' +
                ", location='" + location + '\'' +
                ", price=" + price +
                ", grade=" + grade +
                ", deposit=" + deposit +
                ", state='" + state + '\'' +
                '}';
    }
}
