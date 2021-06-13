package com.hong.dao;

import com.hong.BaseTest;
import com.hong.entity.ProductCategory;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import static org.junit.Assert.assertEquals;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProductCategoryDaoTest extends BaseTest {
    @Autowired
    private ProductCategoryDao productCategoryDao;

    @Test
    public void testQueryByShopId(){
        Long shopId = 35L;
        List<ProductCategory> productCategoryList = productCategoryDao.queryProductCategoryList(shopId);
        System.out.println("该店铺自定义类别数为："+productCategoryList.size());
    }
    @Test
    public void testBatchInsertProductCategory(){
            ProductCategory productCategory = new ProductCategory();
            productCategory.setProductCategoryName("商品类别1");
            productCategory.setPriority(1);
            productCategory.setCreateTime(new Date());
            productCategory.setShopId(29L);
            ProductCategory productCategory2=new ProductCategory();
            productCategory2.setProductCategoryName("商品类别2");
            productCategory2.setPriority(2);
            productCategory2.setCreateTime(new Date());
            productCategory2.setShopId(29L);
            List<ProductCategory> productCategoryList = new ArrayList<>();
            productCategoryList.add(productCategory);
            productCategoryList.add(productCategory2);
            int effectNum = productCategoryDao.batchInsertProductCategory(productCategoryList);
            assertEquals(2,effectNum);
}
    @Test
    public void testCDeleteProductCategory() throws Exception {
        long shopId = 29L;
        List<ProductCategory> productCategoryList = productCategoryDao
                .queryProductCategoryList(shopId);
        for (ProductCategory pc:productCategoryList
             ) {
            if("商品类别1".equals(pc.getProductCategoryName())||"商品类别2".equals(pc.getProductCategoryName())){
                int effectNum = productCategoryDao.deleteProductCategory(pc.getProductCategoryId(),shopId);
                assertEquals(1,effectNum);
            }

        }
    }
}
