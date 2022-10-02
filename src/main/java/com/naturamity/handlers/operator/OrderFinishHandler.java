package com.naturamity.handlers.operator;

import com.naturamity.database.dao.OrderDAO;
import com.naturamity.models.Order;
import io.javalin.http.Context;
import io.javalin.http.Handler;


public class OrderFinishHandler implements Handler {
    @Override
    public void handle(Context context) throws Exception {
        int order_id = Integer.valueOf(context.formParam("order_id").toString());

        OrderDAO.finish_order(order_id);

        context.redirect("/operator");
    }
}
