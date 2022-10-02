package com.naturamity.handlers.login;

import com.google.common.hash.Hashing;
import com.naturamity.database.dao.UserDAO;
import com.naturamity.exceptions.InvalidUsernamePasswordException;
import com.naturamity.models.User;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.nio.charset.StandardCharsets;


public class LoginSubmissionHandler implements Handler {

    @Override
    public void handle( Context context) throws Exception {
        String username = context.formParam("username");
        String password = context.formParam("password");

        try{


        User user = UserDAO.forUsername(username);
        if(user == null) throw new InvalidUsernamePasswordException();

        password = Hashing.sha256()
                    .hashString(password, StandardCharsets.UTF_8)
                    .toString();
        if(!password.equals(user.getPassword())) throw new InvalidUsernamePasswordException();

        context.sessionAttribute("user", user);
        if(user.getUser_type().toString().equals("manager")) context.redirect("/manager");
        else if (user.getUser_type().toString().equals("operator")) context.redirect("/operator");
        else if (user.getUser_type().toString().equals("customer")) context.redirect("/");

        } catch (InvalidUsernamePasswordException ex){
            context.html(ex.getMessage());
        }
    }
}
