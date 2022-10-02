package com.naturamity.models;

import java.util.HashMap;

public class Product {

    private int product_id;
    private String name;
    private String description;
    private String image;
    private String net_weight;
    private double price;
    private ProductCategory category;


    public Product(){}

    /*public Product(int product_id, String name, String description, String image, String net_weight, double price, ProductCategory category) {
        this.product_id = product_id;
        this.name = name;
        this.description = description;
        this.image = image;
        this.net_weight = net_weight;
        this.price = price;
        this.category = category;
    }

     */

    public Product (HashMap<String, Object> product_data) {
        if (product_data.containsKey("product_id")) this.product_id = Integer.parseInt(product_data.get("product_id").toString());
        this.name = (String) product_data.get("name");
        this.description = (String) product_data.get("description");
        if (product_data.containsKey("image")) this.image = (String) product_data.get("image");
            else this.image = "noimage.webp";
        this.net_weight = (String) product_data.get("net_weight");
        this.price = (double) product_data.get("price");
        this.category = ProductCategory.valueOf((String)product_data.get("category")) ;
    }

    public int getProduct_id() {
        return product_id;
    }

    public void setProduct_id(int product_id) {
        this.product_id = product_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getNet_weight() {
        return net_weight;
    }

    public void setNet_weight(String net_weight) {
        this.net_weight = net_weight;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public ProductCategory getCategory() {
        return category;
    }

    public void setCategory(ProductCategory category) {
        this.category = category;
    }

}
