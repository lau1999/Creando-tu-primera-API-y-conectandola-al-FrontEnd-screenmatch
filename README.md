# Creando-tu-primera-API-y-conectandola-al-FrontEnd-screenmatch

Este proyecto es una aplicación web que consiste en una API y un FrontEnd que se conecta a ella. La API proporciona datos sobre dispositivos electrónicos y sus especificaciones, y el FrontEnd muestra estos datos de forma interactiva en una interfaz de usuario.

## Descarga

Para descargar el proyecto, puedes clonar el repositorio utilizando Git:

```bash
git clone < https://github.com/lau1999/Creando-tu-primera-API-y-conectandola-al-FrontEnd-screenmatch.git>
```

## Instalación de Dependencias

Asegúrate de tener Node.js y npm instalados en tu sistema. Luego, puedes instalar las dependencias del proyecto ejecutando:

```bash
npm install
```

## Configuración de Variables de Entorno


## Exportación de la Base de Datos a PostgreSQL

Si el proyecto incluye una base de datos y deseas exportarla a PostgreSQL, puedes seguir estos pasos:

1. Exporta la base de datos existente en el formato adecuado (por ejemplo, SQL dump).

2. Inicia sesión en tu instancia de PostgreSQL.

3. Crea una nueva base de datos en PostgreSQL si aún no existe:

```sql
CREATE DATABASE nombre_de_la_base_de_datos;
```

4. Importa el archivo de exportación a la base de datos recién creada:

```bash
psql -U usuario -d nombre_de_la_base_de_datos -f archivo_exportado.sql
```

## Uso

Proporciona instrucciones sobre cómo ejecutar y utilizar el proyecto una vez que esté configurado.

