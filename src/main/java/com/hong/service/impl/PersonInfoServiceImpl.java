package com.hong.service.impl;

import com.hong.dao.PersonInfoDao;
import com.hong.entity.PersonInfo;
import com.hong.service.PersonInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonInfoServiceImpl implements PersonInfoService {
    @Autowired
    private PersonInfoDao personInfoDao;


    @Override
    public PersonInfo getPersonInfo(String userName) {
        return personInfoDao.getPersonInfo(userName);
    }
}
