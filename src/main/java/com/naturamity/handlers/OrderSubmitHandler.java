package com.naturamity.handlers;

import com.naturamity.database.dao.OrderDAO;
import com.naturamity.database.dao.ProductDAO;
import com.naturamity.models.Order;
import com.naturamity.models.OrderProduct;
import com.naturamity.models.Product;
import com.naturamity.models.User;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;


public class OrderSubmitHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        User user = new User();

            user = (User)context.sessionAttribute("user");

        System.out.println(user);
        Order order = new Order(user);

        ArrayList<OrderProduct> order_products = new ArrayList<>();
        List<String> product_id_list_string = context.formParams("product_id");
        List<String> quantity_list_string = context.formParams("quantity");


        for(int i=0; i < product_id_list_string.size(); i++){
            int product_id  = Integer.valueOf(product_id_list_string.get(i));
            int quantity = Integer.valueOf(quantity_list_string.get(i));

            Product product = ProductDAO.get(product_id);
            HashMap<String, Object> order_product_data = new HashMap<>();
            order_product_data.put("product_id", product_id);
            order_product_data.put("product_name", product.getName());
            order_product_data.put("product_price", product.getPrice());
            order_product_data.put("quantity", quantity);
            OrderProduct order_product = new OrderProduct(order_product_data);

            System.out.println(order_product);
            System.out.println("-----------");
            order_products.add(order_product);

        }


        OrderDAO.save(user, order_products);
        context.redirect("/");
    }
}
