package org.pdp.service;


import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;

import java.util.Date;
import java.text.SimpleDateFormat;

@RequiredArgsConstructor
public class ProductService {
    private final ProductDao productDao;
        public void addProduct(String productName,
                               Double productPrice,
                               String productImageJson,
                               String productParamJson,
                               String productColorJson,
                               String productDescription,
                               String productDiscount,
                               String productFromDelivery,
                               String productToDelivery,
                               String productCreatedBy){
            Integer discount = getDiscount(productDiscount);
            String formattedFromDelivery = reformatDate(productFromDelivery);
            String formattedToDelivery = reformatDate(productToDelivery);
            Product product = new Product(productName,productPrice,productImageJson,productParamJson,productColorJson,productDescription,discount,formattedFromDelivery,formattedToDelivery,productCreatedBy);
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
                              String productFromDelivery,
                              String productToDelivery,
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
    @SneakyThrows
    public static String reformatDate(String dateStr) {
        SimpleDateFormat inputFormat = new SimpleDateFormat("MM-dd-yyyy");
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date date = inputFormat.parse(dateStr);
        return outputFormat.format(date);
    }
}
