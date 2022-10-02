package com.naturamity.handlers;

import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class IndexHandler implements Handler {
    @Override
    public void handle( Context context) throws Exception {

        context.html(Renderer.render("index.ftl"));
    }
}
