package com.hong.service;

import com.hong.dto.ImageHolder;
import com.hong.dto.ProductExecution;
import com.hong.entity.Product;
import com.hong.exceptions.ProductOperationException;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.InputStream;
import java.util.List;

public interface ProductService {

    //添加商品信息以及图片处理
    ProductExecution addProduct(Product product, ImageHolder thumbnail,
                                List<ImageHolder>productImgHolderList)throws ProductOperationException;

    //通过商品id查询
    Product getProductById(long productId);

    ProductExecution modifyProduct(Product product,
                                   ImageHolder thumbnail,
                                   List<ImageHolder>ProductImgHolderList) throws ProductOperationException;

    ProductExecution getProductList(Product productCondition, int pageIndex, int pageSize);
}
