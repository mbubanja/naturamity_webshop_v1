package com.naturamity.handlers.manager;

import com.naturamity.database.dao.ProductDAO;
import com.naturamity.database.dao.UserDAO;
import com.naturamity.parsing.Renderer;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;

public class UserEditFormHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        int user_id = Integer.parseInt(context.pathParam("user_id"));

        HashMap<String, Object> data_model = new HashMap<>();
        data_model.put("user", UserDAO.get(user_id));

        context.html(Renderer.render("edit_user_form.ftl", data_model));
    }

}
