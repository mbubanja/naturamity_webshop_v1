package com.naturamity.handlers;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.naturamity.database.dao.ProductDAO;
import com.naturamity.models.OrderProduct;
import com.naturamity.models.Product;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;


public class OrderProductHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {
        int product_id = Integer.valueOf(context.formParam("product_id"));
        int quantity = Integer.valueOf(context.formParam("quantity"));

        ArrayList<OrderProduct> order_product_list = new ArrayList<>();
        Gson gson = new Gson();
        Type order_product_list_type = new TypeToken<ArrayList<OrderProduct>>(){}.getType();
        if(context.cookie("order_product_list")!= null) {
            String order_product_list_string = context.cookie("order_product_list");
            byte[] decodedBytes = Base64.getDecoder().decode(order_product_list_string);
            String order_product_list_json = new String(decodedBytes);
            order_product_list = gson.fromJson(order_product_list_json, order_product_list_type);
            context.removeCookie("order_product_list");
            }

        Product product = ProductDAO.get(product_id);

        HashMap<String, Object> order_product_data = new HashMap<>();
        order_product_data.put("product_id", product_id);
        order_product_data.put("product_name", product.getName());
        order_product_data.put("product_price", product.getPrice());
        order_product_data.put("quantity", quantity);
        OrderProduct order_product = new OrderProduct(order_product_data);

        order_product_list.add(order_product);
        String order_product_list_json = gson.toJson(order_product_list);

        String order_product_list_base64 = Base64.getEncoder().encodeToString(order_product_list_json.getBytes());

        context.cookie("order_product_list", order_product_list_base64);


        context.redirect("/products");
    }
}
