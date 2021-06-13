package com.hong.service;

import com.hong.BaseTest;
import com.hong.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class AreaServiceTest extends BaseTest {
    @Autowired
    private AreaService areaService;

    @Test
    public void getAreaList(){
        List<Area> areaList = areaService.getAreaList();
        for (Area area: areaList
        ) {
            System.out.println(area);
        };

    }
}
