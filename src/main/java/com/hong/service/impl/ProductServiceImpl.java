package com.hong.service.impl;

import com.hong.dao.ProductDao;
import com.hong.dao.ProductImgDao;
import com.hong.dto.ImageHolder;
import com.hong.dto.ProductExecution;
import com.hong.entity.Product;
import com.hong.entity.ProductImg;
import com.hong.enums.ProductStateEnum;
import com.hong.exceptions.ProductOperationException;
import com.hong.service.ProductService;
import com.hong.util.ImageUtil;
import com.hong.util.PageCalculator;
import com.hong.util.PathUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
@Service
public class ProductServiceImpl implements ProductService {


    @Autowired
    private ProductDao productDao;
    @Autowired
    private ProductImgDao productImgDao;

    @Override
    @Transactional
    //1.处理缩略图，获取缩略图相对路径并赋值给product
    //2往tb_product写入商品信息，获取productld
    //3.结合productld批量处理商品详情图
    //4.将商品详情图列表批量插入tb_product_img中
    public ProductExecution addProduct(Product product, ImageHolder thumbnail, List<ImageHolder> productImgHolderList) throws ProductOperationException {
        //空值判断
        if(product!=null&&product.getShop()!=null&&product.getShop().getShopId()!=null){
            //给默认商品设置默认属性
            product.setCreateTime(new Date());
            product.setLastEditTime(new Date());
            //默认为上架状态
            product.setEnableStatus(1);
            //若商品缩略图不为空则添加
            if(thumbnail!=null){
                addThumbnail(product,thumbnail);
            }
            try {
                //创建商品信息
                int effectNum = productDao.insertProduct(product);
                if(effectNum<=0){
                    throw new ProductOperationException("创建商品失败");
                }
            }catch (Exception e){
                throw new ProductOperationException("创建商品失败"+e.toString());
            }
            //若商品详情图不为空则添加
            if(productImgHolderList !=null&& productImgHolderList.size()>0){
                addProductImgList(product, productImgHolderList);
            }
            return new ProductExecution(ProductStateEnum.SUCCESS,product);
        }else {
            //传参为空则返回空值错误信息
            return new ProductExecution(ProductStateEnum.EMPTY);
        }
        
    }

    @Override
    public Product getProductById(long productId) {
        return productDao.queryProductById(productId);
    }

    @Override
    @Transactional
    //1.若缩略图参数有值，则处理缩略图，
    //若原先存在缩略图则先删除再添加新图，之后获取缩略图相对路径并赋值给product
    //2.若商品详情图列表参数有值，对商品详情图片列表进行同样的操作
    //3.将tbIproduct_img下面的该商品原先的商品详情图记录全部清除
    //4.更新tb_product的信息
    public ProductExecution modifyProduct(Product product, ImageHolder thumbnail, List<ImageHolder> ProductImgHolderList) throws ProductOperationException {
        if(product!=null&&product.getShop()!=null&&product.getShop().getShopId()!=null){
            //给默认商品设置默认属性
            product.setLastEditTime(new Date());
            //若商品缩略图不为空则添加
            if(thumbnail!=null){
                Product tempProduct = productDao.queryProductById(product.getProductId());
                if(tempProduct.getImgAddr()!=null){
                    ImageUtil.deleteFileOrPath(tempProduct.getImgAddr());
                }
                addThumbnail(product,thumbnail);
            }
            if(ProductImgHolderList!=null&&ProductImgHolderList.size()>0){
                deleteProductImageList(product.getProductId());
                addProductImgList(product,ProductImgHolderList);
            }
            try {
                int effectNum = productDao.updateProduct(product);
                if(effectNum<=0){
                    throw new ProductOperationException("更新商品信息失败");
                }
                return new ProductExecution(ProductStateEnum.SUCCESS,product);
            }catch (Exception e){
                throw new ProductOperationException("更新商品信息失败"+e.toString());
            }


        }else {
            return new ProductExecution(ProductStateEnum.EMPTY);
        }

    }

    @Override
    public ProductExecution getProductList(Product productCondition, int pageIndex, int pageSize) {
        int rowIndex = PageCalculator.calculateRowIndex(pageIndex, pageSize);
        List<Product> productList = productDao.queryProductList(productCondition, rowIndex, pageSize);
        int count = productDao.queryProductCount(productCondition);
        ProductExecution pe = new ProductExecution();
        pe.setProductList(productList);
        pe.setCount(count);
        return pe;
    }

    //删除某个商品下的所有详情图
    private void deleteProductImageList(Long productId) {
        List<ProductImg> productImgList = productImgDao.queryProductImgList(productId);
        for (ProductImg img:productImgList
             ) {
            ImageUtil.deleteFileOrPath(img.getImgAddr());

        }
        productImgDao.deleteProductImgByProductId(productId);
    }

    private void addProductImgList(Product product, List<ImageHolder> productImageHolderList) {
        //获取图片存储路径，直接存储在相应店铺的文件夹
        String dest = PathUtil.getShopImagePath(product.getShop().getShopId());
        List<ProductImg> productImgList = new ArrayList<>();
        //遍历图片一次去处理，并添加进productImg实体类
        for(ImageHolder productImgHolder:productImageHolderList){
            String imagAddr = ImageUtil.generateNormalImg(productImgHolder,dest);
            ProductImg productImg = new ProductImg();
            productImg.setImgAddr(imagAddr);
            productImg.setProductId(product.getProductId());
            productImg.setCreateTime(new Date());
            productImgList.add(productImg);
        }
        //如果有图片需要添加，执行批量添加操作
        if(productImgList.size()>0){
            try {
                int effectNum = productImgDao.batchInsertProductImg(productImgList);
                if(effectNum<=0){
                    throw new ProductOperationException("创建商品详情图片失败");
                }
            }catch (Exception e){
                throw new ProductOperationException("创建商品详情图片失败"+e.toString());
            }
        }

    }

    private void addThumbnail(Product product, ImageHolder thumbnail) {
        String dest = PathUtil.getShopImagePath(product.getShop().getShopId());
        String thumbnailAddr = ImageUtil.generateThumbnail(thumbnail,dest);
        product.setImgAddr(thumbnailAddr);
    }
}
