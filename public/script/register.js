function validateUsername(username) {
    if (username.length < 3) {
        return 'El nombre de usuario debe tener al menos 3 caracteres.';
    }
    if (!/^[a-zA-Z0-9]+$/.test(username)) {
        return 'El nombre de usuario solo puede contener letras y números.';
    }
    return '';
}

function validatePassword(password) {
    if (password.length < 8) {
        return 'La contraseña debe tener al menos 8 caracteres.';
    }
    if (!/[A-Z]/.test(password) || !/[a-z]/.test(password) || !/[0-9]/.test(password)) {
        return 'La contraseña debe contener al menos una letra mayúscula, una minúscula y un número.';
    }
    return '';
}
document.getElementById('registerForm').addEventListener('submit', async (e) => {
    e.preventDefault();
    const username = document.getElementById('username').value;
    const password = document.getElementById('password').value;
    const confirm_password = document.getElementById('confirm_password').value;
    const usernameError = document.getElementById('usernameError');
    const passwordError = document.getElementById('passwordError');
    const confirmPasswordError = document.getElementById('confirmPasswordError');
    
    usernameError.textContent = validateUsername(username);
    passwordError.textContent = validatePassword(password);

    if (password !== confirm_password) {
        confirmPasswordError.textContent = 'Las contraseñas no coinciden.';
    } else {
        confirmPasswordError.textContent = '';
    }

    if (!usernameError.textContent && !passwordError.textContent && !confirmPasswordError.textContent) {
        try {
            const response = await fetch('/register', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ username, password }),
            });

            const data = await response.json();

            if (response.ok) {
                alert(data.message);
                window.location.href = '/login';
            } else {
                usernameError.textContent = data.message;
            }
        } catch (error) {
            console.error('Error:', error);
            // alert('An error occurred. Please try again.');
        }
    }
});