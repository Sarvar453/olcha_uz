package org.pdp.service;


import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.http.Part;
import lombok.Data;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import org.pdp.Dao.ProductDao;
import org.pdp.entity.Product;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

@RequiredArgsConstructor
public class ProductService {
    private final ProductDao productDao;
    private static final String IMAGE_SAVE_DIRECTORY = "C:\\Users\\User\\Desktop\\New folder\\olcha_uz\\web\\user\\images\\";

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
    public List<Product> getProductListByCategoryId(Integer categoryId){
        return productDao.getProductsByCategory(categoryId);
    }

    public void processImages(String productImagesJson, Part filePart) throws IOException {
        Gson gson = new Gson();
        Type imageListType = new TypeToken<List<ImageData>>(){}.getType();
        List<ImageData> imageList = gson.fromJson(productImagesJson, imageListType);

        for (ImageData imageData : imageList) {
            String fileNameFromJson = imageData.getName();
            String fileExtension = imageData.getExtension();

            if (fileExtension.isEmpty()) {
                throw new IOException("Couldn't extract extension from file");
            }

            String newFileName = fileNameFromJson + "." + fileExtension;

            String filePath = IMAGE_SAVE_DIRECTORY + newFileName;

            filePart.write(filePath);
        }
    }
    private String getExtensionFromUrl(String url) {
        int dotIndex = url.lastIndexOf(".");
        if (dotIndex == -1) {
            return null;
        }
        return url.substring(dotIndex + 1);
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
@Data
class ImageData {
    private String name;
    private String url;

    public String getExtension() {
        String fileName = new File(url).getName();
        int dotIndex = fileName.lastIndexOf(".");
        return (dotIndex == -1) ? "" : fileName.substring(dotIndex + 1);
    }
}