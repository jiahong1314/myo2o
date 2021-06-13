package com.hong.dao;

import com.hong.BaseTest;
import com.hong.entity.Area;
import com.hong.entity.PersonInfo;
import com.hong.entity.Shop;
import com.hong.entity.ShopCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import static org.junit.Assert.assertEquals;
import java.util.Date;
import java.util.List;

public class ShopDaoTest extends BaseTest {

    @Autowired
    private ShopDao shopDao;

    @Test
    public void testQueryShopList(){
        Shop shop = new Shop();
        ShopCategory childCategory = new ShopCategory();
        ShopCategory parentCategory = new ShopCategory();
        parentCategory.setShopCategoryId(12L);
        childCategory.setParent(parentCategory);
        shop.setShopCategory(childCategory);
        List<Shop> shopList = shopDao.queryShopList(shop,0,3);
        int shopCount = shopDao.queryShopCount(shop);
        System.out.println("店铺列表的大小："+shopList.size());
        shopCount=shopDao.queryShopCount(shop);
        System.out.println("店铺总数："+shopCount);
    }
    @Test
    public void testAInsertShop() throws Exception {
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
        shop.setShopName("mytest1");
        shop.setShopDesc("mytest1");
        shop.setShopAddr("testaddr1");
        shop.setPhone("test");
        shop.setShopImg("test1");
        shop.setCreateTime(new Date());
        shop.setLastEditTime(new Date());
        shop.setEnableStatus(1);
        shop.setAdvice("审核中");
        int effectedNum = shopDao.insertShop(shop);
        assertEquals(1,effectedNum);

    }
    @Test
    public void testUpdateShop(){
        Shop shop = new Shop();
        shop.setShopId(30L);
        shop.setShopDesc("测试描述");
        shop.setShopAddr("测试地址");
        int effectNum = shopDao.updateShop(shop);
        assertEquals(1,effectNum);
    }

    @Test
    public void testQueryShopById(){
        Shop shop = shopDao.queryByShopId(35L);
        System.out.println(shop.getArea().getAreaName());
        System.out.println(shop.getShopCategory().getShopCategoryName());
    }
}
