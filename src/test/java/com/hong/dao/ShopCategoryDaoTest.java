package com.hong.dao;

import com.hong.BaseTest;
import com.hong.entity.Area;
import com.hong.entity.ShopCategory;
import com.hong.service.AreaService;
import com.hong.service.ShopCategoryService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static org.junit.Assert.assertEquals;

public class ShopCategoryDaoTest extends BaseTest {

    @Autowired
    private ShopCategoryDao shopCategoryDao;
    @Autowired
    private ShopCategoryService shopCategoryService;
    @Autowired
    private AreaService areaService;

    @Test
    public void testQueryShopCategoryDao(){

        /*List<ShopCategory> shopCategoryList = new ArrayList<>();
        List<Area> areaList = new ArrayList<>();
        shopCategoryList = shopCategoryService.getShopCategory(new ShopCategory());
        areaList = areaService.getAreaList();
        for (ShopCategory shopCategory:shopCategoryList
             ) {
            System.out.println(shopCategory.getShopCategoryName());

        }
        for (Area a :
                areaList) {
            System.out.println(a.getAreaName());
        }*/
        /*Map<String,Object> modelMap = new HashMap<>();
        List<ShopCategory> shopCategoryList = new ArrayList<>();
        List<Area> areaList = new ArrayList<>();
        try {
            shopCategoryList = shopCategoryService.getShopCategory(new ShopCategory());
            areaList = areaService.getAreaList();
            modelMap.put("shopCategoryList",shopCategoryList);
            modelMap.put("areaList",areaList);
            modelMap.put("success",true);
        }catch (Exception e){
            modelMap.put("success",false);
            modelMap.put("errMsg",e.getMessage());
        }*/
        List<ShopCategory> shopCategoryList = shopCategoryDao.queryShopCategory(new ShopCategory());
        System.out.println(shopCategoryList.size());
    }
}
