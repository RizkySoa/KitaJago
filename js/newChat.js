const chatMessages = document.getElementById('chat-messages');
const userInput = document.getElementById('user-input');

function sendMessage() {
    const message = userInput.value;
    if (message.trim() !== "") {
        appendMessage('user', message);
        userInput.value = '';

        // Simulate bot response
        setTimeout(() => {
            const botResponse = "This is a simulated response.";
            appendMessage('bot', botResponse);
        }, 1000);
    }
}

function appendMessage(sender, message) {
    const messageElement = document.createElement('div');
    messageElement.classList.add('chat-message', sender);
    messageElement.textContent = message;
    chatMessages.appendChild(messageElement);
    chatMessages.scrollTop = chatMessages.scrollHeight;
}

userInput.addEventListener('keypress', function (e) {
    if (e.key === 'Enter') {
        sendMessage();
    }
});


// // Simulasi data pesan dari user dan bot
// const messages = [
//     { type: 'user', text: 'Ini pesan dari user' },
//     { type: 'bot', text: 'Ini pesan dari bot' },
//     // Tambahkan pesan lain di sini
// ];

// // Ambil elemen chat-messages
// const chatMessages = document.getElementById('chat-messages');

// // Loop melalui setiap pesan dan tambahkan ke elemen chat-messages
// messages.forEach(message => {
//     const messageDiv = document.createElement('div');
//     messageDiv.classList.add('chat-message', message.type);

//     const profileIcon = document.createElement('img');
//     profileIcon.src = message.type === 'user' ? 'img/logo/bot.jpg' : 'img/logo/bot.jpg';
//     profileIcon.alt = 'Profile Icon';
//     profileIcon.classList.add('profile-icon');
//     profileIcon.style.width = '30px'; // Atur lebar ikon profil
//     profileIcon.style.height = '30px'; // Atur tinggi ikon profil
//     messageDiv.appendChild(profileIcon);

//     const messageText = document.createElement('p');
//     messageText.textContent = message.text;
//     messageDiv.appendChild(messageText);

//     chatMessages.appendChild(messageDiv);
// });
