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
            <h2>Detalji proizvoda</h2>
                <div>
                    <img class ="image_details" src="/images/${product.image}" alt="${product.image}" width="300px" height="500px" />
                    <form action="/order_product/${product.product_id}" method="post" enctype="multipart/form-data">
                        <p style="display:none">
                            <label>Product ID: </label>
                            <input type="number" name="product_id" value="${product.product_id}" readonly>
                        </p>
                        <p>
                            <label for="">Naziv proizvoda:</label>
                            <span>${product.name}</span>
                        </p>            
                        <p>
                            <label>Kategorija proizvoda: </label>
                            <span>${product.category}</span>
                        </p>   
                        <p>
                            <label for="">Opis proizvoda: </label>
                            <span>${product.description}</span>
                        </p>
                        <p>
                            <label for="">Količina: </label>
                            <span>${product.net_weight}</span>
                        </p>
                        <p>
                            <label for="">Cena: </label>
                            <span id="price">${product.price}</span>
                            <span> dinara</span>
                        </p>
                        <p>
                            <label for="">Poruči: </label>
                            <input id="quantity" name="quantity" type="number" value="1">
                        </p>
                        <p>
                            <label for="">Ukupno: </label>
                            <span id="product_sum"></span>
                            <span> dinara</span>
                        </p>
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
    <footer>
    
    </footer>
    <script>
        const in_price = document.querySelector("#price")
        let in_quantity = document.querySelector("#quantity")
        const product_sum = document.querySelector("#product_sum")

        const price = Number(in_price.innerHTML)
        let quantity = Number(in_quantity.value)
        product_sum.innerHTML = price*quantity

        in_quantity.addEventListener("input", () => {
            quantity = Number(in_quantity.value)
            product_sum.innerHTML = price * quantity
        })
    </script>
</body>
</html>