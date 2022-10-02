package com.naturamity;

import com.naturamity.handlers.*;
import com.naturamity.handlers.login.*;
import com.naturamity.handlers.manager.*;
import com.naturamity.handlers.operator.OperatorDashboardHandler;
import com.naturamity.handlers.operator.OrderDetailsHandler;
import com.naturamity.handlers.operator.OrderFinishHandler;
import io.javalin.Javalin;
import io.javalin.http.staticfiles.Location;

public class Application {

    public static void main(String[] args) {
        Javalin server = Javalin.create(config -> {
            config.addStaticFiles("./resources", Location.EXTERNAL);
        });


        server.get("/", new IndexHandler());

        server.get("/login", new LoginFormHandler());
        server.post("/login", new LoginSubmissionHandler());
        server.get("/register", new RegisterFormHandler());
        server.post("/register", new RegisterSubmissionHandler());
        //server.post("/register_check", new RegisterCheckHandler());


        server.before("/manager", new ManagerAuthorizationHandler());
        //server.before("/manager/*", new ManagerAuthorizationHandler());
        server.get("/manager", new ManagerDashboardHandler());

        server.before("/operator", new OperatorAuthorizationHandler());
        //server.before("/operator/*", new OperatorAuthorizationHandler());
        server.get("/operator", new OperatorDashboardHandler());
        server.get("/order_details/{order_id}", new OrderDetailsHandler());
        server.post("/order_details/{order_id}", new OrderFinishHandler());

        server.get("/products", new ProductsHandler());
        server.get("/products/{product_id}", new ProductDetailsHandler());
        server.get("/add_product", new ProductAddFormHandler());
        server.post("/add_product", new ProductAddSubmitHandler());
        server.get("/edit_product/{product_id}", new ProductEditFormHandler());
        server.post("/edit_product/{product_id}", new ProductUpdateHandler());
        server.get("/delete_product/{product_id}", new ProductDeleteHandler());
        server.get("/edit_user/{user_id}", new UserEditFormHandler());
        server.post("/edit_user/{user_id}", new UserUpdateHandler());
        server.get("/delete_user/{user_id}", new UserDeleteHandler());

        server.get("/order_product/{product_id}", new OrderProductFormHandler());
        server.post("/order_product/{product_id}", new OrderProductHandler());
        server.get("/basket", new BasketHandler());
        server.before("/order", new AuthenticationHandler());
        server.post("/order", new OrderSubmitHandler());

        server.before("/contact", new AuthenticationHandler());
        server.get("/contact", new ContactFormHandler());
        server.post("/contact", new SaveMessageHandler());


        server.start(9000);
    }
}
