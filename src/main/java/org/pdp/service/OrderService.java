package org.pdp.service;

import lombok.RequiredArgsConstructor;
import org.pdp.Dao.OrderDao;
import org.pdp.entity.Order;

@RequiredArgsConstructor
public class OrderService {
    private final OrderDao orderDao;

    public void addOrder(String quantityParam, String productIdParam) {
        int quantity = Integer.parseInt(quantityParam);
        Integer productId = productIdParam != null ? Integer.parseInt(productIdParam) : null;

        Order order = new Order(quantity, productId);
        orderDao.addOrder(order);
    }

    public void updateOrder(String orderIdParam, String productIdParam, String quantityParam) {
        int orderId = Integer.parseInt(orderIdParam);
        int productId = productIdParam != null? Integer.parseInt(productIdParam) : null;
        int quantity = Integer.parseInt(quantityParam);

        Order order = new Order(orderId, productId, quantity);
        orderDao.updateOrder(order);
    }

    public void deleteOrder(String orderIdParam) {
        if (orderIdParam!=null &&!orderIdParam.isEmpty()) {
            int orderId = Integer.parseInt(orderIdParam);
            orderDao.deleteOrder(orderId);
        }
    }
}
