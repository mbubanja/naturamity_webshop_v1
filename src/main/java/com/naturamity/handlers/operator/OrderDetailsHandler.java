package com.naturamity.handlers.operator;

import com.naturamity.database.dao.OrderDAO;
import com.naturamity.database.dao.OrderProductDAO;
import com.naturamity.database.dao.UserDAO;
import com.naturamity.models.Order;
import com.naturamity.models.OrderProduct;
import com.naturamity.models.User;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.ArrayList;
import java.util.HashMap;


public class OrderDetailsHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {
        int order_id = Integer.parseInt(context.pathParam("order_id"));
        System.out.println(order_id);
        int customer_id = OrderDAO.get_customer_id(order_id);

        Order order = OrderDAO.get_for_id(order_id);
        User customer = UserDAO.get(customer_id);

        ArrayList<OrderProduct> order_products = OrderProductDAO.all_for_order(order_id);

        HashMap<String, Object> data_model = new HashMap<>();
        data_model.put("order", order);
        data_model.put("customer", customer);
        data_model.put("order_products", order_products);

        context.html(Renderer.render("order_details.ftl", data_model));
    }
}
