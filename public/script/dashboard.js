document.getElementById('logoutBtn').addEventListener('click', async () => {
  try {
      const response = await fetch('/logout', {
          method: 'POST',
      });

      const data = await response.json();

      if (response.ok) {
          alert(data.message);
          window.location.href = '/login';
      } else {
          alert('Error logging out');
      }
  } catch (error) {
      console.error('Error:', error);
      alert('An error occurred. Please try again.');
  }
});