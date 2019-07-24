package com.pojo;

import java.io.Serializable;

public class User implements Serializable {
    private int open_id;
    private String username;
    private String img;

    public int getOpen_id() {
        return open_id;
    }

    public void setOpen_id(int open_id) {
        this.open_id = open_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
