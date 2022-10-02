package com.naturamity.handlers.login;

import io.javalin.http.Context;
import io.javalin.http.Handler;

public class AuthenticationHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        if(context.sessionAttribute("user") == null) {
            context.redirect("/login");
        }

    }
}
