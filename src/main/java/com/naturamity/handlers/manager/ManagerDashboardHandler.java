package com.naturamity.handlers.manager;

import com.naturamity.database.dao.ProductDAO;
import com.naturamity.database.dao.UserDAO;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;


public class ManagerDashboardHandler implements Handler {
    @Override
    public void handle( Context context) throws Exception {

        HashMap<String, Object> data_model = new HashMap<>();
        data_model.put("products", ProductDAO.all_products());
        data_model.put("users", UserDAO.all_users());

        context.html(Renderer.render("manager_dashboard.ftl", data_model));
    }
}
