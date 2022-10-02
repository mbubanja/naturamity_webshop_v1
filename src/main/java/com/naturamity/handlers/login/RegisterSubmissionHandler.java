package com.naturamity.handlers.login;

import com.google.common.hash.Hashing;
import com.naturamity.database.dao.UserDAO;
import com.naturamity.models.User;
import com.naturamity.models.UserType;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;


public class RegisterSubmissionHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {
        String first_name = context.formParam("first_name");
        String last_name = context.formParam("last_name");
        String username = context.formParam("username");
        String password = context.formParam("password");
        String email = context.formParam("email");
        String phone = context.formParam("phone");
        String address = context.formParam("address");

        UserType user_type = UserType.valueOf("customer");


        password = Hashing.sha256()
                .hashString(password, StandardCharsets.UTF_8)
                .toString();





        /*HashMap<String, Object> user_data = new HashMap<>();
        if(first_name != null && !first_name.equals("")){user_data.put("first_name", first_name);}
        if(last_name != null && !last_name.equals("")){user_data.put("last_name", last_name);}
        if(username != null && !username.equals("")){user_data.put("username", username);}
        if(password != null && !password.equals("")){user_data.put("password", password);}
        if(email != null && !email.equals("")){user_data.put("email", email);}
        if(phone != null && !phone.equals("")){user_data.put("phone", phone);}
        if(address != null && !address.equals("")){user_data.put("address", address);}
        if(user_type != null && !user_type.equals("")){user_data.put("user_type", user_type);}

        User user = new User(user_data);
        UserDAO.save(user);

        context.html("You have been registered");

         */
    }
}
