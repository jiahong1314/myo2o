package com.hong.service;

import com.hong.dto.ImageHolder;
import com.hong.dto.ShopExecution;
import com.hong.entity.Shop;
import com.hong.exceptions.ShopOperationException;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.InputStream;

public interface ShopService {
    //模糊查询
    ShopExecution getShopList(Shop shopCondition,int pageIndex,int pageSize);
    //添加店铺
    ShopExecution addShop(Shop shop, ImageHolder thumbnail);
    //通过shopId 获取店铺信息
    Shop getByShopId(long shopId);
    //更新店铺信息
    ShopExecution modifyShop(Shop shop, ImageHolder thumbnail) throws ShopOperationException;
}
