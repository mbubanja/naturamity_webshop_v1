package com.naturamity.handlers.manager;

import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class ProductAddFormHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {
        context.html(Renderer.render("add_product_form.ftl"));
    }
}
