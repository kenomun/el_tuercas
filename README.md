# El Tuercas - Sistema de Gestión de Talleres Automotrices

## Descripción

El Tuercas es un sistema de gestión de talleres automotrices diseñado para ayudarte a administrar eficientemente tu taller, controlar los servicios y mantener un registro de tus clientes y vehículos. Facilita la programación de servicios, la gestión de vehículos y más.

## Características

- **Gestión de Servicios:** Registra y programa servicios como afinaciones, cambios de aceite, alineaciones, cambios de neumáticos y más.
- **Gestión de Clientes:** Mantén un registro detallado de tus clientes, incluyendo su información de contacto y vehículos asociados.
- **Gestión de Vehículos:** Registra vehículos con detalles como marca, modelo, año, patente y su dueño correspondiente.
- **Roles de Usuario:** Administra los roles de usuario, incluyendo administradores y usuarios regulares.

## Requisitos

- Ruby (versión 3.1.2)
- Ruby on Rails (versión 7.0.8)
- PostgreSQL (u otro sistema de gestión de bases de datos)

## Instalación

1. Clona este repositorio a tu máquina local.
2. Ejecuta `bundle install` para instalar las gemas necesarias.
4. Configura tu base de datos en `config/database.yml` por defecto esta trabajando en el puerto 5433.
5. Ejecuta `rails db:create` para crear la base de datos.
6. Ejecuta `rails db:migrate` para aplicar las migraciones.
7. Ejecuta `rails db:seed` para poblar la base de datos con datos de ejemplo.
8. Ejecuta `rails server` para iniciar el servidor de desarrollo.

## Uso

- Accede al sistema a través de tu navegador web en `http://localhost:3000`.
- Inicia sesión con las credenciales de administrador proporcionadas en los datos de ejemplo (correo electrónico y contraseña).

1. para ingresar con los usuarios con rol administrador creados al ejecutar el seed puedes ocupar las siguientes credenciales.
- email: admin1@example.com , password: 123456
- email: admin2@example.com , password: 123456

2. para ingresar con los usuarios con rol usuario creados al ejecutar el seed puedes ocupar las siguientes credenciales.

- email: user1@example.com , password: 123123
- email: user2@example.com , password: 123123
- email: user3@example.com , password: 123123

- Explora las diversas características del sistema para administrar servicios, clientes y vehículos.

## Contacto

Si tienes alguna pregunta o comentario, no dudes en ponerte en contacto con nosotros en [eugenio.mun.f@gmail.com](eugenio.mun.f@gmail.com).

