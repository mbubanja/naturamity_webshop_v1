<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/modern-normalize/1.1.0/modern-normalize.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <title>NaturAmity Webshop</title>
    <#include "css/style.css"/>
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
            <div>
                <h1>Moja korpa</h1>
                <form action="/order" method="post" enctype="multipart/form-data">
                    <div class="container_basket">
                        <span>Proizvod:</span>
                        <span>Količina(kom):</span>
                        <span>Cena(din):</span>
                        <span>Ukupno(din):</span>    
                        <#list order_products as order_product>
                            <input type="number" name="product_id" value="${order_product.product_id}" style="display: none"readonly>
                            <span>${order_product.product_name}</span>
                            <input name="quantity" type="number" class="quantity" value ="${order_product.quantity}" min = "0"/>
                            <span class="price">${order_product.product_price}</span>
                            <input class="product_sum" readonly/>
                        </#list>
                        <span></span>
                        <span>Ukupno za plaćanje: </span>
                        <span id="total_sum"></span>
                        <span><button type="submit">Potvrdi porudžbinu</button></span> 
                    </div> 
                </form>          
                
            </div>
        </section>

        <aside>
            <div id="login_area">
                <#include "components/login.html">
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
            const sum_product = Number(price.innerHTML) * Number(quantity.value)            
            sum.value = sum_product
            tot_sum += sum_product
            total_sum.innerHTML = tot_sum
           
        });
        
        in_quantity.forEach((quantity_field, index) => {
            quantity_field.addEventListener("input", () => {
                tot_sum = 0
                product_sum.forEach((sum, index) => {
                const price = in_price[index]
                const quantity = in_quantity[index]
                const sum_product = Number(price.innerHTML) * Number(quantity.value)                           
                sum.value = sum_product
                tot_sum += sum_product
                total_sum.innerHTML = tot_sum
                });
            });
        })
        
    </script>
</body>
</html>