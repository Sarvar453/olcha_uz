package org.pdp.service;


import lombok.RequiredArgsConstructor;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;

import java.sql.Date;
import java.sql.Timestamp;
@RequiredArgsConstructor
public class ProductService {
    private final ProductDao productDao;
    public void addProduct(String productName,
                           Double productPrice,
                           String productDescription,
                           String productDiscount,
                           Date productFromDelivery,
                           Date productToDelivery,
                           String productCreatedBy){
        Integer discount = getDiscount(productDiscount);
        Product product = new Product(productName,productPrice,productDescription,discount,productFromDelivery,productToDelivery,productCreatedBy);
        productDao.addProduct(product);
    }
    public void updateProduct(Integer productId,
                              String productName,
                              Double productPrice,
                              String productImages,
                              String productParams,
                              String productColor,
                              String productDescription,
                              String productDiscount,
                              Date productFromDelivery,
                              Date productToDelivery,
                              String productCreatedBy){
        Integer discount = getDiscount(productDiscount);
        Product product = new Product(productId,productName,productPrice,productImages,productParams,productColor,productDescription,discount,productFromDelivery,productToDelivery,productCreatedBy);
        productDao.updateProduct(product);
    }
    public void deleteProduct(Integer productId){
        productDao.deleteProduct(productId);
    }
    private Integer getDiscount(String productDiscount){
        Integer discount = null;
        if (productDiscount != null && !productDiscount.isEmpty()) {
            try {
                discount = Integer.parseInt(productDiscount);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        return discount;
    }
}
