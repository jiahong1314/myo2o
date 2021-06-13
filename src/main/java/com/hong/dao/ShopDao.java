package com.hong.dao;

import com.hong.entity.Shop;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShopDao {

    //分页查询店铺，可输入的条件有：店铺名（模糊）,店铺状态，店铺类别，区域Id,owner
    List<Shop> queryShopList(@Param("shopCondition") Shop shopCondition,
                             @Param("rowIndex") int rowIndex, @Param("pageSize") int pageSize);
    int queryShopCount(@Param("shopCondition") Shop shopCondition);
    //查询店铺信息
    Shop queryByShopId(long shopId);
    //新增店铺
    int insertShop(Shop shop);
    //更新店铺
    int updateShop(Shop shop);
}
