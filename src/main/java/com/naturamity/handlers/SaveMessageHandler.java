package com.naturamity.handlers;

import com.naturamity.database.dao.MessageDAO;
import com.naturamity.models.Message;
import com.naturamity.models.User;
import io.javalin.http.Context;
import io.javalin.http.Handler;

import java.util.HashMap;

public class SaveMessageHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {

        User user = new User();
        if(context.sessionAttribute("user") != null){
            user = (User)context.sessionAttribute("user");
        } else {
            context.redirect("/login");
        }
        int user_id = user.getUser_id();
        String title = context.formParam("title");
        String message_text = context.formParam("message_text");

        HashMap<String, Object> message_data = new HashMap<>();
        message_data.put("sender_id", user_id);
        message_data.put("title", title);
        message_data.put("message_text", message_text);

        Message message = new Message(message_data);
        MessageDAO.save(message);
        context.redirect("/");

    }
}
