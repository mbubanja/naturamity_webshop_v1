package com.naturamity.handlers.manager;

import com.naturamity.database.dao.ProductDAO;
import com.naturamity.models.Product;
import com.naturamity.models.ProductCategory;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;

public class ProductAddSubmitHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        String name = context.formParam("name");
        String description = context.formParam("description");
        String image = context.formParam("image");
        String net_weight = context.formParam("net_weight");
        Double price = Double.valueOf(context.formParam("price"));
        String category = context.formParam("category");

        //todo: image slugify

        HashMap<String, Object> product_data = new HashMap<>();
        product_data.put("name", name);
        product_data.put("description", description);
        product_data.put("image", image);
        product_data.put("net_weight", net_weight);
        product_data.put("price", price);
        product_data.put("category", category);

        Product new_product = new Product(product_data);
        ProductDAO.save(new_product);
        context.redirect("/manager");
    }
}
