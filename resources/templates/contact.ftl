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
            <h1>Kontakt form</h1>
            <div>
                <form action="/contact" method="post">
                    <!--
                    <p>Morate biti ulogovani da biste poslali poruku</p>
                    <span class="button"><button id="login_button"><a href="/login">Uloguj se</a></button></span>
                    <span class="button"><button id="register_button"><a href="/register">Registruj se</a></button></span>
                    -->
                    <div>
                        <label>Naslov poruke:</label>
                        <input type="text" name="title">
                    </div>
                    <div>
                        <label>Poruka:</label>
                        <textarea name="message_text" id="" cols="30" rows="10"></textarea>
                    </div>
                    <div>
                        <button type="submit">Pošalji poruku</button>
                    </div>
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
    
    
</body>
</html>