package com.pc.service.meettingRoom;

import com.baomidou.mybatisplus.core.metadata.IPage;

public interface CdevicesService {
    public IPage CdevicesService(int page, int size,String state1,String device);

    int updatastate(String state, int device_id);
}
