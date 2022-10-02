package com.naturamity.handlers.manager;

import com.naturamity.database.dao.UserDAO;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class UserDeleteHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        int user_id = Integer.valueOf(context.formParam("user_id"));

        UserDAO.delete(user_id);
        context.redirect("/manager");
    }
}
