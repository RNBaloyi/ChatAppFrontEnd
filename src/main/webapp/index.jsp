<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Login Page</title>
</head>
<body>
<div class="login-container">
    <h2>Chatroom</h2>
    <p style="color: red">${error}</p>
    <form action="login" method="post">
        <input type="text" id="username" name="loginEmail" placeholder="Email" required>
        <input type="password" id="password" name="loginPassword" placeholder="Password" required>
        <button type="submit">Login</button>
    </form>
    <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
</div>
</body>
</html>
