package org.pdp.service;


import jakarta.servlet.http.Part;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.json.JSONArray;
import org.json.JSONObject;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@RequiredArgsConstructor
public class ProductService {
    private final ProductDao productDao;
    private static final String IMAGE_SAVE_DIRECTORY = "C:\\Users\\User\\Desktop\\Project\\Olcha.uz\\web\\images\\";

    public List<Product> getProductList(){
        return productDao.getProducts();
    }
    public void addProduct(String productName,
                           Double productPrice,
                           String productImageJson,
                           String productParamJson,
                           String productColorJson,
                           String productDescription,
                           String productDiscount,
                           String productFromDelivery,
                           String productToDelivery,
                           String productCreatedBy,
                           Integer categoryId){
        Integer discount = getDiscount(productDiscount);
        String formattedFromDelivery = reformatDate(productFromDelivery);
        String formattedToDelivery = reformatDate(productToDelivery);
        Product product = new Product(productName,productPrice,productImageJson,productParamJson,productColorJson,productDescription,discount,formattedFromDelivery,formattedToDelivery,productCreatedBy,categoryId);
        productDao.addProduct(product);
    }
    public void addImageToFolder(String jsonData){
        try {
            JSONArray imagesArray = new JSONArray(jsonData);

            for (int i = 0; i < imagesArray.length(); i++) {
                JSONObject imageObject = imagesArray.getJSONObject(i);
                String imageName = imageObject.getString("name");
                String imagePath = imageObject.getString("url");

                // Define paths for source and target
                Path sourcePath = Paths.get(imagePath);
                Path targetPath = Paths.get(IMAGE_SAVE_DIRECTORY + imageName);

                // Copy the image file to the target directory
                Files.copy(sourcePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
            }

            System.out.println("All images saved successfully!");
        } catch (IOException e) {
            System.err.println("File I/O Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("Error processing JSON data: " + e.getMessage());
            e.printStackTrace();
        }
    }
    public void updateProduct(
                              Integer productId,
                              Integer categoryId,
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
        Product product = new Product(productId,categoryId,productName,productPrice,productImages,productParams,productColor,productDescription,discount,productFromDelivery,productToDelivery,productCreatedBy);
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
