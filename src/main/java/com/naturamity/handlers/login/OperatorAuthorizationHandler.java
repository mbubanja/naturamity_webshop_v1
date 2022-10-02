package com.naturamity.handlers.login;

import com.naturamity.models.User;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class OperatorAuthorizationHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        if(context.sessionAttribute("user") == null) context.redirect("/login");
        User user = (User) context.sessionAttribute("user");
        if(!(user.getUser_type().toString().equals("operator")) && !(user.getUser_type().toString().equals("manager"))) context.redirect("/login");

    }
}
