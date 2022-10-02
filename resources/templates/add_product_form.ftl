<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/modern-normalize/1.1.0/modern-normalize.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css" />
    <title>Document</title>
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
            <div>
                <h3>Add Product Form</h3>
                <form action="/add_product" method="post" enctype="multipart/form-data">
                    <div>
                        <label >Product name</label>
                        <input type="text" name="name">
                    </div>
                    <div>
                        <label for="decsription">Description</label>
                        <textarea name="description" id="" cols="30" rows="10"></textarea>
                    </div>
                    <div>
                        <label for="image">Image</label>
                        <input type="text" name="image">
                    </div>
                    <div>
                        <label for="net_weight">Net weight</label>
                        <input type="text" name="net_weight">
                    </div>
                    <div>
                        <label for="price">Price</label>
                        <input type="number" name="price">
                    </div>
                    <div>
                        <label for="category">Category</label>
                        <select name="category" id="">
                            <option value="tinkture">Tinkture</option>
                            <option value="kreme">Kreme</option>
                        </select>
                    </div>
                    <button type="submit">Save</button>
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

