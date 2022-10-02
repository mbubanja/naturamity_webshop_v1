package com.naturamity.handlers.manager;

import com.naturamity.database.dao.UserDAO;
import com.naturamity.models.User;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;


public class UserUpdateHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        int user_id = Integer.valueOf(context.formParam("user_id"));
        String first_name = context.formParam("first_name");
        String last_name = context.formParam("last_name");
        String username = context.formParam("username");
        String password = context.formParam("password");
        String email = context.formParam("email");
        String phone = context.formParam("phone");
        String address = context.formParam("address");
        String user_type = context.formParam("user_type");

        HashMap<String, Object> user_data = new HashMap<>();
        user_data.put("user_id", user_id);
        user_data.put("first_name", first_name);
        user_data.put("last_name", last_name);
        user_data.put("username", username);
        user_data.put("password", password);
        user_data.put("email", email);
        user_data.put("phone", phone);
        user_data.put("address", address);
        user_data.put("user_type", user_type);

        User user = new User(user_data);
        UserDAO.update(user);
        context.redirect("/manager");



    }
}
