package com.naturamity.handlers.login;

import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class LoginFormHandler implements Handler {
    @Override
    public void handle( Context context) throws Exception {
        context.html(Renderer.render("login.ftl"));
    }
}
