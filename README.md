# Sistema de Administración de Clínica

Este proyecto es un sistema de administración para una clínica, desarrollado utilizando TypeScript, Express.js, HTML y Tailwind CSS, siguiendo el patrón de diseño **Modelo-Vista-Controlador (MVC)**. El sistema permite gestionar pacientes, citas, médicos y otros aspectos administrativos.

## Tabla de Contenidos

- [Instalación](#instalación)
- [Tecnologías Utilizadas](#tecnologías-utilizadas)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Patrón Modelo-Vista-Controlador](#patrón-modelo-vista-controlador)
- [Uso](#uso)
- [Contribuciones](#contribuciones)
- [Licencia](#licencia)

## Instalación

Sigue estos pasos para configurar y ejecutar el proyecto localmente.

1. Clona este repositorio:

    ```bash
    git clone https://github.com/programfive/clinica.git
    ```

2. Navega al directorio del proyecto:

    ```bash
    cd clinica
    ```

3. Instala las dependencias:

    ```bash
    npm install
    ```

4. Crea un archivo `.env` basado en el archivo `.env.example` y configura las variables necesarias para tu entorno.
    ```bash
    PORT=
    DB_HOST=
    DB_USER=
    DB_PASS=
    DB_NAME=
    JWT_SECRET=
    ```

6. Ejecuta la aplicación en modo desarrollo:

    ```bash
    npm run dev
    ```

7. Abre tu navegador y ve a `http://localhost:3000` para ver la aplicación.

## Tecnologías Utilizadas

- **TypeScript**: Para un desarrollo tipado y seguro.
- **Express.js**: Framework backend para construir APIs.
- **HTML**: Para la estructura de las páginas.
- **Tailwind CSS**: Para un diseño rápido y responsivo.
- **Node.js**: Entorno de ejecución del servidor.

## Estructura del Proyecto

El proyecto sigue una arquitectura **Modelo-Vista-Controlador (MVC)**, donde:

- **Modelos**: Representan la estructura de los datos y la lógica de negocio.
- **Vistas**: Gestionan lo que se muestra en el navegador.
- **Controladores**: Gestionan la lógica y el flujo entre las vistas y los modelos.

### Estructura de Carpetas

```bash
├── node_modules        # Módulos de Node.js
├── public              # Archivos estáticos (CSS, JS)
├── src
│   ├── config          # Configuraciones del proyecto
│   ├── controller      # Controladores del sistema
│   ├── lib             # Librerías comunes o utilidades
│   ├── middleware      # Middlewares de Express
│   ├── models          # Modelos de datos
│   ├── routes          # Definición de rutas
│   ├── schemas         # Definición de esquemas (validaciones)
│   ├── tools           # Herramientas auxiliares
│   ├── views           # Vistas (HTML, Plantillas)
│   ├── app.ts          # Configuración principal de la aplicación
│   ├── input.css       # Estilos de Tailwind CSS
│   └── server.ts       # Punto de entrada del servidor
├── package-lock.json   # Bloqueo de dependencias
├── package.json        # Dependencias y scripts del proyecto
├── tailwind.config.js  # Configuración de Tailwind CSS
└── tsconfig.json       # Configuración de TypeScript
