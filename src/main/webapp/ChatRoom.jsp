<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.chatappfrontend.chatappfrontend.model.User" %>

<html>
<head>
    <title>Chat Room</title>
    <link rel="stylesheet" type="text/css" href="chatStyle.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="chatScript.js"></script>
</head>
<body>

<div class="chat-container">
    <div class="chat-header">
        <h2>Chat App</h2>
    </div>
    <div class="message-container" id="messageContainer">
        <!-- Message display -->
    </div>
    <div class="user-input">
        <input type="text" id="messageInput" placeholder="Type your message...">
        <button onclick="sendMessage()">Send</button>
    </div>
</div>

<script>
    function sendMessage() {
        var messageInput = document.getElementById("messageInput");
        var messageText = messageInput.value;

        // Fetch the username from the session
        var username = '<%= session.getAttribute("username") %>';

        // Append the message to the message container
        appendMessage(username, messageText, 'sent');

        // Clear the input field
        messageInput.value = '';
    }

    // Function to append a message to the message container
    function appendMessage(username, message, messageType) {
        var messageContainer = document.getElementById("messageContainer");

        var messageDiv = document.createElement("div");
        messageDiv.className = "message " + messageType;

        var usernameSpan = document.createElement("span");
        usernameSpan.className = "username";
        usernameSpan.innerHTML = username + ": ";

        var messageText = document.createTextNode(message);

        messageDiv.appendChild(usernameSpan);
        messageDiv.appendChild(messageText);

        messageContainer.appendChild(messageDiv);
    }
</script>

</body>
</html>
