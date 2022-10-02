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
            <h3>Edit User Form</h3>
            <form action="/edit_user/${user.user_id}" method="post" enctype="multipart/form-data">
                <div>
                    <label >User ID</label>
                    <input type="number" name="user_id" value="${user.user_id}" readonly>
                </div>
                <div>
                    <label >First name</label>
                    <input type="text" name="first_name" value="${user.first_name}" readonly>
                </div>
                <div>
                    <label >Last name</label>
                    <input type="text" name="last_name" value="${user.last_name}">
                </div>
                <div>
                    <label >Username</label>
                    <input type="text" name="username" value="${user.username}">
                </div>
                <div style="display: none">
                    <label >Password</label>
                    <input type="text" name="password" value="${user.password}" readonly>
                </div>
                <div>
                    <label>Email</label>
                    <input type="email" name="email" value="${user.email}">
                </div>
                <div>
                    <label>Phone</label>
                    <input type="text" name="phone" value="${user.phone}">
                </div>
                <div>
                    <label>Address</label>
                    <input type="text" name="address" value="${user.address}">
                </div>
                <div>
                    <label>User type</label>
                    <input type="text" name="user_type" value="${user.user_type}" readonly>
                </div>
                <button type="submit">Update</button>
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
</body>
</html>