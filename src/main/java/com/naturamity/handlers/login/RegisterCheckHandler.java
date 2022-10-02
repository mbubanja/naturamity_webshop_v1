package com.naturamity.handlers.login;

import com.naturamity.database.dao.UserDAO;
import com.naturamity.models.User;
import io.javalin.http.Context;
import io.javalin.http.Handler;


import java.util.ArrayList;

public class RegisterCheckHandler implements Handler {

    @Override
    public void handle(Context context) throws Exception {

        ArrayList<User> all_users = UserDAO.all_users();

        String username = context.formParam("username");
        String email = context.formParam("email");

        for(User user : all_users){
            if(user.getUsername().equals(username)) context.html("This username is already taken");
            if(user.getEmail().equals(email)) context.html("This email is already taken");
        }
    }
}
