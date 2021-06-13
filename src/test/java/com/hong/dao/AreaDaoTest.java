package com.hong.dao;



import com.hong.BaseTest;
import com.hong.entity.Area;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;


public class AreaDaoTest extends BaseTest {

    @Autowired
    private AreaDao areaDao;

    @Test
    public void testQueryDao(){
      List<Area> areaList = areaDao.queryArea();
        for (Area area: areaList
             ) {
            System.out.println(area);
        };
    }
}
