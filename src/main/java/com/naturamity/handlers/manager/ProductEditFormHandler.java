package com.naturamity.handlers.manager;

import com.naturamity.database.dao.ProductDAO;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;

public class ProductEditFormHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        int product_id = Integer.parseInt(context.pathParam("product_id"));

        HashMap<String, Object> data_model = new HashMap<>();
        data_model.put("product", ProductDAO.get(product_id));

        context.html(Renderer.render("edit_product_form.ftl", data_model));
    }

}

