<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=500px, height = 500px">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/modern-normalize/1.1.0/modern-normalize.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <title>Porucivanje</title>
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
            <h1>Porucivanje proizvoda</h1>
            <div id="order_container">
                <form action="/order_product/${product.product_id}" method="post" enctype="multipart/form-data">
                    <div style="display:none">
                        <label>Product ID: </label>
                        <input type="number" name="product_id" value="${product.product_id}" readonly>
                    </div>
                    <div>
                        <label>Proizvod: </label>
                        <span>${product.name}</span>
                    </div>
                    <div>
                        <label>Cena: </label>
                        <span>${product.price} din/kom</span>
                    </div>
                    <div>
                        <label>Količina: </label>
                        <input type="number" name = "quantity" value=1>
                    </div>
                    <button type="submit">U korpu</button>
                </form>
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
</body>
</html>