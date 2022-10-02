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
            <h1>Register form</h1>
            <div>
                <form action="/register" method="post">
                    <div>
                        <label>Ime:</label>
                        <input type="text" name="first_name">
                    </div>
                    <div>
                        <label>Prezime:</label>
                        <input type="text" name="last_name">
                    </div>
                    <div>
                        <label>Username:</label>
                        <input type="text" name="username">
                    </div>
                    <div>
                        <label>Password:</label>
                        <input type="password" name="password">
                    </div>
                    <div>
                        <label>Email:</label>
                        <input type="text" name="email">
                    </div>
                    <div>
                        <label>Phone:</label>
                        <input type="text" name="phone">
                    </div>
                    <div>
                        <label>Adresa:</label>
                        <input type="text" name="address">
                    </div>
                    <div>
                        <button type="submit">Registruj se</button>
                    </div>
                </form>
                <div>
                    <p>Već ste registrovani ?</p>
                    <span class="button"><button id="login_button"><a href="/login">Uloguj se</a></button></span>
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
        const xhr = new XMLHttpRequest(); 

        xhr.open("POST", "/register_check")
        xhr.send()

        xhr.addEventListener("load", () => {
            if(xhr.status == 200 && xhr.readyState == 4)
            console.log(xhr.responseText)
        });
    </script>
</body>
</html>