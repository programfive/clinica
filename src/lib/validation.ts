export function validateUsername(username: string): string {
  if (username.length < 3) {
      return 'El nombre de usuario debe tener al menos 3 caracteres.';
  }
  if (!/^[a-zA-Z0-9]+$/.test(username)) {
      return 'El nombre de usuario solo puede contener letras y números.';
  }
  return '';
}

export function validatePassword(password: string): string {
  if (password.length < 8) {
      return 'La contraseña debe tener al menos 8 caracteres.';
  }
  if (!/[A-Z]/.test(password) || !/[a-z]/.test(password) || !/[0-9]/.test(password)) {
      return 'La contraseña debe contener al menos una letra mayúscula, una minúscula y un número.';
  }
  return '';
}