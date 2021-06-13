package com.hong.service.impl;

import com.hong.dao.ProductCategoryDao;
import com.hong.dao.ProductDao;
import com.hong.dto.ProductCategoryExecution;
import com.hong.entity.ProductCategory;
import com.hong.enums.ProductCategoryStateEnum;
import com.hong.exceptions.ProductCategoryOperationException;
import com.hong.service.ProductCategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
public class ProductCategoryListImpl implements ProductCategoryService {
    @Autowired
    private ProductCategoryDao productCategoryDao;
    @Autowired
    private ProductDao productDao;

    @Override
    public List<ProductCategory> getProductCategoryList(Long shopId) {
        return productCategoryDao.queryProductCategoryList(shopId);
    }

    @Override
    @Transactional
    public ProductCategoryExecution batchAddProductCategory(List<ProductCategory> productCategoryList) throws ProductCategoryOperationException {
        if (productCategoryList != null && productCategoryList.size() > 0) {
            try {
                int effectedNum = productCategoryDao
                        .batchInsertProductCategory(productCategoryList);
                if (effectedNum <= 0) {
                    throw new ProductCategoryOperationException("店铺类别失败");
                } else {

                    return new ProductCategoryExecution(
                            ProductCategoryStateEnum.SUCCESS);
                }

            } catch (Exception e) {
                throw new ProductCategoryOperationException("batchAddProductCategory error: "
                        + e.getMessage());
            }
        } else {
            return new ProductCategoryExecution(
                    ProductCategoryStateEnum.EMPTY_LIST);
        }

    }

    @Override
    @Transactional
    public ProductCategoryExecution deleteProductCategory(long productCategoryId,
                                                          long shopId) throws ProductCategoryOperationException {
        //TODO将此商品类别下的商品的类别Id置为空
        try {
            int effectedNum = productDao
                    .updateProductCategoryToNull(productCategoryId);
            if (effectedNum < 0) {
                throw new ProductCategoryOperationException("商品类别更新失败");
            }
        } catch (Exception e) {
            throw new ProductCategoryOperationException("deleteProductCategory error: "
                    + e.getMessage());
        }
        try {
            int effectedNum = productCategoryDao.deleteProductCategory(
                    productCategoryId, shopId);
            if (effectedNum <= 0) {
                throw new ProductCategoryOperationException("店铺类别删除失败");
            } else {
                return new ProductCategoryExecution(
                        ProductCategoryStateEnum.SUCCESS);
            }

        } catch (Exception e) {
            throw new ProductCategoryOperationException("deleteProductCategory error: "
                    + e.getMessage());
        }
    }


}
