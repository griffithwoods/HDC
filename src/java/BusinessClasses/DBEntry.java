/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package BusinessClasses;

import Entities.Cake;
import Entities.Delivery;
import Entities.User;
import Entities.Orders;
import businesslogic.OrderService;
import dataaccess.DeliveryJpaController;
import dataaccess.OrdersJpaController;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 775224
 */
public class DBEntry {
    /**
     * Takes in cakes assigned to an order and creates entries into Delivery, Order
     * This method should only be referred to by OrderDetails after order is finalized
     * @param cakes The cakes being added into the order
     * @param user The user who the order belongs to
     * @param delivery Delivery variable created in OrderDetails
     * @return 
     */
    public boolean inserOrderDB(Cake[] cakes, User user, Delivery delivery) {
        OrdersJpaController ojc = new OrdersJpaController();
        //Create Delivery then order
        Orders order = new Orders();
        order.setDeliveryNo(delivery);
        System.out.println("Delivery number assoc: " + order.getDeliveryNo().getDeliveryNo());
        double price = 0;
        String items = "";
        for (Cake cake : cakes) {
            price = price + cake.getPrice();
            items = items + cake.getName() + ", ";
        }
        items = items.substring(0, items.length()-2);
        order.setTotalPrice(price);
        Date currDate = new Date();
        order.setOrderDatetime(currDate);
        order.setDueDatetime(calculateDueDate(currDate));
        order.setUserId(user);
        System.out.println("User added: " + user);
        System.out.println("User is: " + user.getUserId());
        order.setCakeCollection(toList(cakes));
        order.setOrderItems(items);
        order.setOrderNo(getOrderNo());
        System.out.println(order.getOrderNo());
        try {
            System.out.println("Order to put in: " + order);
            ojc.create(order);
            System.out.println("Order successful: " + order.getOrderNo());
            return true;
        } catch (Exception ex) {
            System.out.println("Exception: " + ex.getMessage());
            return false;
        }
        /*
        `order_no` int(4) NOT NULL,
    `user_id` int(4) NOT NULL, -- user_id instead of customer_id
    `order_datetime-` datetime NOT NULL,
    `due_datetime-` datetime NOT NULL,
    `order_items-` VARCHAR(99) NOT NULL, --Do we need this?
    `total_price-` double(9,2) NOT NULL,
    `delivery_no` int(4) NOT NULL,
        */
    }
    
    
    public Date calculateDueDate(Date orderDate) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(orderDate);
        cal.add(Calendar.DATE, 2); //minus number would decrement the days
        orderDate = cal.getTime();
        return orderDate;
    }
    
    public static List<Cake> toList(Cake[] array) {
    if (array==null) {
       return new ArrayList(0);
    } else {
       int size = array.length;
       List<Cake> list = new ArrayList(size);
       for(int i = 0; i < size; i++) {
          list.add(array[i]);
       }
       return list;
    }
}
    
    public int getOrderNo() {
        OrderService os = new OrderService();
        int orderNo = 1;
        System.out.println("--*-- Finding good ID");
        boolean notFound = true;
        while (notFound) {
            if (os.get(orderNo) != null) orderNo++;
            else notFound = false;
        }
        return orderNo;
    }
    
}
