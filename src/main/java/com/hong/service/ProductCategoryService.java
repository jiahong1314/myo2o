package com.hong.service;

import com.hong.dto.ProductCategoryExecution;
import com.hong.entity.ProductCategory;
import com.hong.exceptions.ProductCategoryOperationException;

import java.util.List;

public interface ProductCategoryService {

    //查询指定某个店铺下的所有商品类别
    List<ProductCategory> getProductCategoryList(Long shopId);
    //批量添加商品类别
    ProductCategoryExecution batchAddProductCategory(List<ProductCategory>productCategoryList)throws ProductCategoryOperationException;
    //删除指定类别
    ProductCategoryExecution deleteProductCategory(long productCategoryId,
                                                   long shopId) throws ProductCategoryOperationException;
}
