package com.pojo;

import java.io.Serializable;

public class Room_detail implements Serializable {
    private int room_id;
    private String room_name;
    //面积
    private String area;
    private String location;
    private String detail;
    //预订说明
    private String description;

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

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "Room_detail{" +
                "room_id=" + room_id +
                ", room_name='" + room_name + '\'' +
                ", area='" + area + '\'' +
                ", location='" + location + '\'' +
                ", detail='" + detail + '\'' +
                ", description='" + description + '\'' +
                '}';
    }
}
