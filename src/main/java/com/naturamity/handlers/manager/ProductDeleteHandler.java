package com.naturamity.handlers.manager;

import com.naturamity.database.dao.ProductDAO;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class ProductDeleteHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        int product_id = Integer.parseInt(context.pathParam("product_id"));

        ProductDAO.delete(product_id);
        context.redirect("/manager");
    }
}
