package com.naturamity.handlers;

import com.naturamity.database.dao.ProductDAO;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;


public class ProductsHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        HashMap<String, Object> data_model = new HashMap<>();
        data_model.put("products", ProductDAO.all_products());

        context.html(Renderer.render("products.ftl", data_model));
    }

}
