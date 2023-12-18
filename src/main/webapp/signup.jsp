<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="signupStyle.css">
    <title>Signup Page</title>
    <script>
        function validateForm() {
            // Check if either male or female is selected
            var maleSelected = document.getElementById("male").checked;
            var femaleSelected = document.getElementById("female").checked;

            // Display an error message if neither male nor female is selected
            if (!maleSelected && !femaleSelected) {
                alert("Please select a gender");
                return false; // Prevent form submission
            }

            // Check if password and confirm password match
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (password !== confirmPassword) {
                alert("Password and Confirm Password must match");
                return false; // Prevent form submission
            }

            // Allow form submission if all checks pass
            return true;
        }
    </script>
</head>
<body>
<div class="signup-container">
    <h2>Signup</h2>
    <form action="signup" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <input type="text" id="username" name="signupUsername" placeholder="Username" required>
        </div>

        <div class="form-group">
            <input type="email" id="email" name="signupEmail" placeholder="Email" required>
        </div>

        <div class="form-group">
            <input type="password" id="password" name="signupPassword" placeholder="Password" required>
        </div>

        <div class="form-group">
            <input type="password" id="confirmPassword" name="signupConfirmPassword" placeholder="Confirm Password" required>
        </div>

        <div class="form-group">
            <input type="text" id="address" name="signupAddress" placeholder="Address" required>
        </div>

        <div class="form-group">
            <div class="input-group">
                <input type="radio" id="male" name="gender" value="male">
                <label for="male">Male</label>

                <input type="radio" id="female" name="gender" value="female">
                <label for="female">Female</label>
            </div>
        </div>

        <div class="form-group">
            <button type="submit">Signup</button>
        </div>
    </form>

    <p>Already have an account? <a href="index.jsp">Login</a></p>
</div>
</body>
</html>
