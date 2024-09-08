document.addEventListener('DOMContentLoaded', () => {
  const authForm = document.getElementById('authForm');
  const loginBtn = document.getElementById('loginBtn');
  const registerBtn = document.getElementById('registerBtn');

  const handleAuth = async (endpoint) => {
      const username = document.getElementById('username').value;
      const password = document.getElementById('password').value;

      try {
          const response = await fetch(`/auth/${endpoint}`, {
              method: 'POST',
              headers: {
                  'Content-Type': 'application/json',
              },
              body: JSON.stringify({ username, password }),
          });

          const data = await response.json();

          if (response.ok) {
              alert(data.message);
              // Redirect or update UI as needed
          } else {
              alert(data.message);
          }
      } catch (error) {
          console.error('Error:', error);
          alert('An error occurred. Please try again.');
      }
  };

  loginBtn.addEventListener('click', () => handleAuth('login'));
  registerBtn.addEventListener('click', () => handleAuth('register'));
});