package com.naturamity.handlers.operator;

import com.naturamity.database.dao.*;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;


public class OperatorDashboardHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        HashMap<String, Object> data_model = new HashMap<>();
        //data_model.put("products", ProductDAO.all_products());
        data_model.put("messages", MessageDAO.all_messages());
        data_model.put("orders", OrderDAO.get_all());
        //data_model.put("order_items", OrderItemDAO.get_all());

        context.html(Renderer.render("operator_dashboard.ftl", data_model));
    }
}
