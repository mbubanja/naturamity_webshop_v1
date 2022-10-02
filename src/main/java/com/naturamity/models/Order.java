package com.naturamity.models;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.HashMap;

public class Order implements Serializable {

    private int order_id;
    private LocalDate date;
    private int customer_id;
    private OrderStatus status;

    public Order(){}

    public Order(HashMap<String, Object> order_data){
        if (order_data.containsKey("order_id")) this.order_id = Integer.parseInt(order_data.get("order_id").toString());
        this.date = LocalDate.now();
        if(order_data.containsKey("order_status")){this.status = (OrderStatus) order_data.get("order_status");}
    }

    public Order (User user){

        this.date = LocalDate.now();
        this.status = OrderStatus.valueOf("active");
        this.customer_id = user.getUser_id();
    }

    public int getOrder_id() {
        return order_id;
    }

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public OrderStatus getStatus() {
        return status;
    }

    public void setStatus(OrderStatus status) {
        this.status = status;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }
}


