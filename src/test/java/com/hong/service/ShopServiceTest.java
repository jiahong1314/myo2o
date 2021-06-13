package com.hong.service;

import com.hong.BaseTest;
import com.hong.dto.ImageHolder;
import com.hong.dto.ShopExecution;
import com.hong.entity.Area;
import com.hong.entity.PersonInfo;
import com.hong.entity.Shop;
import com.hong.entity.ShopCategory;
import com.hong.enums.ShopStateEnum;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Date;

import static org.junit.Assert.assertEquals;

public class ShopServiceTest extends BaseTest {
    @Autowired
    private ShopService shopService;

    @Test
    public void testGetShopList(){
        Shop shopCondition = new Shop();
        ShopCategory shopCategory = new ShopCategory();
        shopCategory.setShopCategoryId(33L);
        shopCondition.setShopCategory(shopCategory);
        ShopExecution se = shopService.getShopList(shopCondition,2,5);
        System.out.println("店铺列表数"+se.getShopList().size());
        System.out.println("店铺总数"+se.getCount());
    }
    @Test
    public void testAddShop() throws FileNotFoundException {
        Shop shop = new Shop();
        Area area = new Area();
        area.setAreaId(7L);
        ShopCategory sc = new ShopCategory();
        PersonInfo owner = new PersonInfo();
        owner.setUserId(2L);
        sc.setShopCategoryId(33L);
        shop.setOwner(owner);
        shop.setArea(area);
        shop.setShopCategory(sc);
        shop.setShopName("test4");
        shop.setShopDesc("test4");
        shop.setShopAddr("testaddr4");
        shop.setPhone("test");
        shop.setCreateTime(new Date());
        shop.setLastEditTime(new Date());
        shop.setEnableStatus(ShopStateEnum.CHECK.getState());
        shop.setAdvice("审核中");
        File shopImg = new File("E:/桌面/2017060523302118864.jpg");
        InputStream is = new FileInputStream(shopImg);
        ImageHolder imageHolder = new ImageHolder(shopImg.getName(),is);
        ShopExecution effectedNum = shopService.addShop(shop,imageHolder);
        assertEquals(ShopStateEnum.CHECK.getState(),effectedNum.getState());
    }
    @Test
    public void testModifyShop() throws FileNotFoundException {
        Shop shop = new Shop();
        shop.setShopId(35L);
        shop.setShopName("哈模式");
        File shopImg = new File("E:/桌面/2017060523302118864.jpg");
        InputStream inputStream= new FileInputStream(shopImg);
        ImageHolder imageHolder = new ImageHolder(shopImg.getName(),inputStream);
        ShopExecution shopExecution = shopService.modifyShop(shop,imageHolder);
        System.out.println(shopExecution.getShop().getShopImg());
    }
}
