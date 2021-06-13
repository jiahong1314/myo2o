package com.hong.dao;

import com.hong.entity.Area;

import java.util.List;

public interface AreaDao {

    //列出区域列表
    List<Area> queryArea();
}
