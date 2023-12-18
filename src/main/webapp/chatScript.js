function sendMessage() {
    var messageInput = document.getElementById('messageInput');
    var messageContainer = document.getElementById('messageContainer');

    var messageText = messageInput.value.trim();
    if (messageText !== '') {
        var message = document.createElement('div');
        message.className = 'message sent';
        message.textContent = messageText;
        messageContainer.appendChild(message);

        // Scroll to the bottom after a new message is added
        messageContainer.scrollTop = messageContainer.scrollHeight;

        messageInput.value = '';
    }
}
