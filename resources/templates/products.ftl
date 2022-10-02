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
            <h1>Products</h1>
            <div class="containerAllProducts">
                <#list products as product>
                    <div class="containerProduct">
                    <table>
                        <thead>
                            <tr>
                                <th>Proizvod:</th>
                                <th colspan="3">${product.name}</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td rowspan="4" class="containerImage"><img class ="image" src="/images/${product.image}" alt="${product.image}" width="60px" height="110px"></td>
                                <td>Količina: </td>
                                <td colspan="2">${product.net_weight}</td>
                            </tr>
                            <tr>
                                <td>Cena: </td>
                                <td>${product.price}</td>
                                <td> dinara</td>
                            </tr>
                        <tr>
                            <td colspan="3"><button><a href="/products/${product.product_id}">Detaljnije</a></button></td>
                        </tr>
                        <tr>
                            <td colspan="3"><button><a href="/order_product/${product.product_id}">Poruči</a></button></td>
                        </tr>
                        </tbody>
                    </table>
                    </div>
                </#list>
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
    
</body>
</html>