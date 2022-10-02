<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/modern-normalize/1.1.0/modern-normalize.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <title>NaturAmity Webshop</title>
    <#include "css/style.css">
</head>
<body>
    <header>
        <div>
            <#include "components/header.html">
        </div>
    </header>
    <main>
        <section>
            <div class="main_nav">
                <#include "components/navigation.html">
            </div>
            <h2>Operator dashbord</h2>

            <div class="dashboard_section">
            <h3>Order handling</h3>
            <div id="container_order">
                <table class="table_border">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Date</th>
                            <th>Customer</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                    
                    <#list orders as order>
                        <tr>
                            <td>${order.order_id}</td>
                            <td>${order.date}</td>
                            <td>${order.customer_id}</td>
                            <td>${order.status}</td>
                            <td><button><a href="/order_details/${order.order_id}">Details</a></button></td>
                        </tr>
                    </#list>

                    </tbody>
                </table>
            </div>
        </div>

            <div class="dashboard_section">
            <h3>Message handling</h3>
            <button id="btn_show_messages">Show messages</button>
            <button id="btn_hide_messages" style="display: none">Hide messages</button>
            <div id="container_messages" style="display: none">
                <table class="table_border">
                    <thead>
                        <tr>
                            <th>Message ID</th>
                            <th>Sender ID</th>
                            <th>Title</th>
                            <th>Message text</th>
                            <th>Status</th>
                        </tr>
                    </thead>
            
                    <tbody>
                    <#list messages as message>
                        <tr>
                            <td>${message.message_id}</td>
                            <td>${message.sender_id}</td>
                            <td>${message.title}</td>
                            <td class="ellipsis">${message.message_text}</td>
                            <td>${message.status}</td>
                            <!--<td><button><a href="#">Edit / Update</a></button></td>
                            <td><button> <a href="#">Delete product</a></button></td>-->
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        </section>

        <aside>
            <div id="login_area">
                <#include "components/login.html">
            </div>
            <div>
                <h2>Aside</h2>
                <h3>jos asidea</h3>
                <ol>
                    <li>prvi item</li>
                    <li>drugi item</li>
                </ol>
            </div>
        </aside>
    </main>
    <footer>
    
    </footer>
    <script>
        const btn_show_messages = document.querySelector("#btn_show_messages")
        const container_messages = document.querySelector("#container_messages")
        const btn_hide_messages = document.querySelector("#btn_hide_messages")

        btn_show_messages.addEventListener("click", () => {
            container_messages.style = "display: block"
            btn_show_messages.style = "display: none"
            btn_hide_messages.style = "display: block"
        })

        btn_hide_messages.addEventListener("click", () => {
            container_messages.style = "display: none"
            btn_show_messages.style = "display: block"
            btn_hide_messages.style = "display: none"
        })
    </script>
</body>
</html>