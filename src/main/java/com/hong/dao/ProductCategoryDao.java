package com.hong.dao;

import com.hong.entity.ProductCategory;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ProductCategoryDao {

    //通过shopId查询店铺商品类别
    List<ProductCategory> queryProductCategoryList(Long shopId);

    //批量添加商品类别
    int batchInsertProductCategory(List<ProductCategory>productCategoryList);

    //删除指定的商品类别
    int deleteProductCategory(
            @Param("productCategoryId") long productCategoryId,
            @Param("shopId") long shopId);
}
