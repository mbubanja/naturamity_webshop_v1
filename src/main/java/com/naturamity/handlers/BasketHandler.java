package com.naturamity.handlers;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.naturamity.database.dao.ProductDAO;
import com.naturamity.models.OrderProduct;
import com.naturamity.models.Product;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;


public class BasketHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        ArrayList<OrderProduct> order_products;
        Gson gson = new Gson();
        Type order_product_type = new TypeToken<ArrayList<OrderProduct>>() {
        }.getType();

        if (context.cookie("order_product_list") != null) {
            String order_product_list_string = context.cookie("order_product_list");
            byte[] decodedBytes = Base64.getDecoder().decode(order_product_list_string);
            String order_product_list_json = new String(decodedBytes);
            order_products = gson.fromJson(order_product_list_json, order_product_type);

            HashMap<String, Object> data_model = new HashMap<>();
            data_model.put("order_products", order_products);

            context.html(Renderer.render("basket.ftl", data_model));

        }else{
            context.redirect("/products");
        }
    }
}

