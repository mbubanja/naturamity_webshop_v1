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
        <h2>Manager dashboard</h2>
        
        <div class="dashboard_section">
            <h3>Product handling</h3>
            <button id="btn_show_products">Show products</button>
            <button id="btn_hide_products" style="display: none">Hide products</button>
            <div id="container_products" style="display: none">
                <table class="table_border">
                    <thead>
                        <tr>
                            <th>Product ID</th>
                            <th>Product name</th>
                            <th>Description</th>
                            <th>Image</th>
                            <th>Net weight</th>
                            <th>Price</th>
                            <th>Category</th>
                        </tr>
                    </thead>
            
                    <tbody>
                    <#list products as product>
                        <tr>
                            <td>${product.product_id}</td>
                            <td>${product.name}</td>
                            <td class="ellipsis">${product.description}</td>
                            <td>${product.image}</td>
                            <td>${product.net_weight}</td>
                            <td>${product.price}</td>
                            <td>${product.category}</td>
                            <td><button><a href="/edit_product/${product.product_id}">Edit / Update</a></button></td>
                            <td><button> <a href="/delete_product/${product.product_id}">Delete product</a></button></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
                <div>
                    <button id="button_add_product"><a href="/add_product" >Add product</a></button>
                </div>
            </div>
        </div>

        <div class="dashboard_section">
            <h3>Users handling</h3>
            <button id="btn_show_users">Show users</button>
            <button id="btn_hide_users" style="display: none">Hide users</button>
            <div id="container_users" style="display: none">
                <table class="table_border">
                    <thead>
                        <tr>
                            <th>User ID</th>
                            <th>First name</th>
                            <th>Last name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Address</th>
                            <th>User Type</th>
                        </tr>
                    </thead>
            
                    <tbody>
                    <#list users as user>
                        <tr>
                            <td>${user.user_id}</td>
                            <td>${user.first_name}</td>
                            <td>${user.last_name}</td> 
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.address}</td>
                            <td>${user.user_type}</td>
                            <td><button><a href="/edit_user/${user.user_id}">Edit / Update</a></button></td>
                            <td><button> <a href="/delete_user/${user.user_id}">Delete user</a></button></td>
                        </tr>
                    </#list>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="dashboard_section">
            <button><a href="/operator">Operator dashboard</a></button>
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
        const btn_show_products = document.querySelector("#btn_show_products")
        const container_products = document.querySelector("#container_products")
        const btn_hide_products = document.querySelector("#btn_hide_products")

        btn_show_products.addEventListener("click", () => {
            container_products.style = "display: block"
            btn_show_products.style = "display: none"
            btn_hide_products.style = "display: block"
        })

        btn_hide_products.addEventListener("click", () => {
            container_products.style = "display: none"
            btn_show_products.style = "display: block"
            btn_hide_products.style = "display: none"
        })

        const btn_show_users = document.querySelector("#btn_show_users")
        const container_users = document.querySelector("#container_users")
        const btn_hide_users = document.querySelector("#btn_hide_users")

        btn_show_users.addEventListener("click", () => {
            container_users.style = "display: block"
            btn_show_users.style = "display: none"
            btn_hide_users.style = "display: block"
        })

        btn_hide_users.addEventListener("click", () => {
            container_users.style = "display: none"
            btn_show_users.style = "display: block"
            btn_hide_users.style = "display: none"
        })
    </script>
</body>
</html>