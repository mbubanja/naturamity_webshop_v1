package com.naturamity.models;

import java.io.Serializable;
import java.util.HashMap;

public class OrderProduct implements Serializable {
    int order_id;
    int product_id;
    String product_name;
    double product_price;
    int quantity;

    public OrderProduct(){}

    public OrderProduct(HashMap<String, Object> order_product_data){

        if(order_product_data.containsKey("order_id")) this.order_id = Integer.parseInt(order_product_data.get("order_id").toString());

        this.product_id = Integer.parseInt(order_product_data.get("product_id").toString());
        this.product_name = order_product_data.get("product_name").toString();
        this.product_price = Double.parseDouble(order_product_data.get("product_price").toString());
        this.quantity = Integer.parseInt(order_product_data.get("quantity").toString());
    }

    /*
    public int getOrder_id() {

        return order_id;}

    public void setOrder_id(int order_id) {
        this.order_id = order_id;
    }
    */
    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getProduct_name() {
        return product_name;
    }

    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public double getProduct_price() {
        return product_price;
    }

    public void setProduct_price(double product_price) {
        this.product_price = product_price;
    }

    public String toString(){
        return "Product ID " + product_id + " ,quantity: " + quantity + "Name" + product_name + "price" + product_price;
    }


}
