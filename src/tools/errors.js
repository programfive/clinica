
export function showErrors(errors) {
  let errorMessage = "Por favor, corrige los siguientes errores:\n";
  errors.forEach(error => {
    errorMessage += `- ${error.path.join('.')}: ${error.message}\n`;
  });
  alert(errorMessage);
}