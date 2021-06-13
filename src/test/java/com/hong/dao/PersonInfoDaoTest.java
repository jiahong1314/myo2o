package com.hong.dao;

import com.hong.BaseTest;
import com.hong.entity.PersonInfo;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

public class PersonInfoDaoTest extends BaseTest {


    @Autowired
    private PersonInfoDao personInfoDao;

    @Test
    public void testGetPersonInfo(){
        PersonInfo info = personInfoDao.getPersonInfo("李翔");
        System.out.println(info.getUserName()+'-'+info.getPassword()+'-'+info.getUserId());
    }
}
