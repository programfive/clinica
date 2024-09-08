document.getElementById('loginForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;

    const credentialError = document.getElementById('credentialError');

    try {
        const response = await fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                username,
                password
            }),
        });

        const data = await response.json();

        if (response.ok) {
            window.location.href = '/dashboard';
        } else {
            credentialError.textContent = data.message;
        }
    } catch (error) {
        console.error('Error:', error);
        alert('An error occurred. Please try again.');
    }

});