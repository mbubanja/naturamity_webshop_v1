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
            
            <h2>Detalji porudžbine</h2>
            <form action="/order_details/${order.order_id}" method="post" enctype="multipart/form-data">
            <div class="containerProductDetails">
                <div>
                    <h4>Order data:</h4>           
                        <label for="">Order ID: </label><input type="number" name="order_id" value="${order.order_id}" readonly><br>
                        <label for="">Order date: </label> <span>${order.date}</span><br>
                        <label for="">Order status: </label> <span id="status">${order.status}</span>
                 
                </div>
                <div>
                    <h4>Customer data:</h4>
                    <label for="">Customer ID: </label> <span>${customer.user_id}</span><br>
                    <label for="">First name: </label> <span>${customer.first_name}</span><br>
                    <label for="">Last name: </label> <span>${customer.last_name}</span><br>
                    <label for="">Adress: </label> <span id="status">${customer.address}</span><br>
                    <label for="">Phone: </label> <span id="status">${customer.phone}</span><br>
                    <label for="">Email: </label> <span id="status">${customer.email}</span>
                </div>  
            </div>  
                <h4>Order product list:</h4>
                <table class="table_border">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product</th>
                            <th>Price [din/kom]</th>
                            <th>Quantity</th>
                            <th>Product sum [din]</th>
                        </tr>
                    </thead>
            
                    <tbody>
                    <#list order_products as order_product>
                        <tr>
                            <td>${order_product.product_id}</td>
                            <td>${order_product.product_name}</td>
                            <td class="price">${order_product.product_price}</td>
                            <td class="quantity">${order_product.quantity}</td>
                            <td class="product_sum"></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
                <label for="">Total sum:</label><span id="total_sum"></span><br>
                <label for="">Confirm Order sending: </label><button type="submit">Order sent</button>
            </form>
                    
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
        let in_price = document.querySelectorAll(".price")
        let in_quantity = document.querySelectorAll(".quantity")
        let product_sum = document.querySelectorAll(".product_sum")
        let total_sum = document.querySelector("#total_sum")
        let tot_sum = 0
                
        product_sum.forEach((sum, index) => {
            const price = in_price[index]
            const quantity = in_quantity[index]
            const sum_product = Number(price.innerHTML) * Number(quantity.innerHTML)            
            sum.innerHTML = sum_product
            tot_sum += sum_product
            total_sum.innerHTML = tot_sum
           
        });        
    </script>
</body>
</html>