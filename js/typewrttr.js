document.addEventListener("DOMContentLoaded", function() {
    const textElement = document.getElementById('typewriter-text');
    const text = textElement.textContent;
    textElement.textContent = '';

    let i = 0;
    function typeWriter() {
        if (i < text.length) {
            textElement.textContent += text.charAt(i);
            i++;
            setTimeout(typeWriter, 100);
        } else {
            setTimeout(() => {
                textElement.textContent = '';
                i = 0;
                setTimeout(typeWriter, 1500);  // Delay before starting again
            }, 2000);  // Delay before clearing the text
        }
    }
    typeWriter();
});
