package com.hong.dao;

import com.hong.entity.HeadLine;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HeadLineDao {

    List<HeadLine> queryHeadLine(
            @Param("headLineCondition") HeadLine headLineCondition);
}
