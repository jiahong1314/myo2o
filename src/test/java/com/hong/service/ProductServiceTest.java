package com.hong.service;

import com.hong.BaseTest;
import com.hong.dto.ImageHolder;
import com.hong.dto.ProductExecution;
import com.hong.entity.Product;
import com.hong.entity.ProductCategory;
import com.hong.entity.ProductImg;
import com.hong.entity.Shop;
import com.hong.enums.ProductStateEnum;
import com.hong.exceptions.ShopOperationException;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static org.junit.Assert.assertEquals;
public class ProductServiceTest extends BaseTest {

    @Autowired
    private ProductService productService;
    @Test
    public void testAddProduct()throws ShopOperationException, FileNotFoundException{
        Product product = new Product();
        Shop shop = new Shop();
        shop.setShopId(35L);
        ProductCategory pc = new ProductCategory();
        pc.setProductCategoryId(11L);
        product.setShop(shop);
        product.setProductCategory(pc);
        product.setProductName("测试商品1");
        product.setProductDesc("测试");
        product.setPriority(20);
        product.setCreateTime(new Date());
        product.setEnableStatus(ProductStateEnum.SUCCESS.getState());

        File thumbnailFile = new File("E:/桌面/2017060523302118864.jpg");
        InputStream is = new FileInputStream(thumbnailFile);
        ImageHolder thumbnail = new ImageHolder(thumbnailFile.getName(),is);

        File productImg = new File("E:/桌面/n0211673800000006.jpg");
        InputStream is1 = new FileInputStream(productImg);
        File productImg2 = new File("E:/桌面/2017060523302118864.jpg");
        InputStream is2 = new FileInputStream(productImg2);
        List<ImageHolder> productImagList = new ArrayList<>();
        productImagList.add(new ImageHolder(productImg.getName(),is1));
        productImagList.add(new ImageHolder(productImg2.getName(),is2));

        ProductExecution pe = productService.addProduct(product,thumbnail,productImagList);
        assertEquals(ProductStateEnum.SUCCESS.getState(),pe.getState());
    }

    @Test
    public void testModifyProduct()throws ShopOperationException,FileNotFoundException{
        Product product = new Product();
        Shop shop = new Shop();
        shop.setShopId(1L);
        ProductCategory pc = new ProductCategory();
        pc.setProductCategoryId(1L);
        product.setProductId(1L);
        product.setShop(shop);
        product.setProductCategory(pc);
        product.setProductName("百事可乐");
        product.setProductDesc("万事百事");

        File thumbnailFile = new File("E:/桌面/1.jpg");
        InputStream is = new FileInputStream(thumbnailFile);
        ImageHolder thumbnail = new ImageHolder(thumbnailFile.getName(),is);

        File file1 = new File("E:/桌面/2.jpg");
        InputStream is1 = new FileInputStream(file1);
        File file2 = new File("E:/桌面/3.jpg");
        InputStream is2 = new FileInputStream(file2);
        List<ImageHolder> imageHolderList = new ArrayList<>();
        imageHolderList.add(new ImageHolder(file1.getName(),is1));
        imageHolderList.add(new ImageHolder(file2.getName(),is2));
        ProductExecution pe = productService.modifyProduct(product,thumbnail,imageHolderList);
        assertEquals(ProductStateEnum.SUCCESS.getState(),pe.getState());
    }
}
