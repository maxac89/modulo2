# 📚 Sistema Académico - API REST (Módulo 2)

Proyecto colaborativo en parejas desarrollado por Arnau y Max para aprender y aplicar tecnologías de desarrollo backend modernas, control de versiones, seguridad y persistencia de datos.

---

## 🛠️ Tecnologías y Herramientas Utilizadas
* **Lenguaje:** Java
* **Framework:** Spring Boot & Spring Security
* **Persistencia:** JPA / Hibernate
* **Base de Datos:** MySQL Workbench (SQL)
* **Control de Versiones:** Git y GitHub
* **Pruebas de API:** Postman y Navegador Web

---

## 🗄️ Modelo de Base de Datos
La base de datos se llama `sistema_academico` e incluye el esquema para entidades académicas y tablas para autenticación y autorización:
* **`teacher` (Profesor):** Datos de los profesores (`id`, `first_name`, `last_name`, `address`).
* **`subject` (Asignatura):** Datos de las materias (`id`, `name`, `credits`, `lecture_hours`, `teacher_id`).
* **`users` & `authorities`:** Gestión de usuarios y roles para el control de acceso mediante Spring Security.
* *Regla de negocio:* Un profesor puede impartir múltiples asignaturas, pero una asignatura solo puede pertenecer a un único profesor.

---

## 🔐 Seguridad y Usuarios

El proyecto utiliza **Spring Security** para asegurar la API mediante autenticación HTTP Basic. Los usuarios precargados en la base de datos son:

| Usuario | Contraseña | Rol | Permisos |
| :--- | :--- | :--- | :--- |
| `juan` | 123 | `PROFESOR` | Lectura exclusiva de `/api/subjects/**` |
| `pedro` | 123 | `DIRECTOR` | Acceso total (CRUD) a `/api/teachers/**` y lectura de `/api/subjects/**` |

---

## 🚀 Cómo Usar el Proyecto

### 1. Configurar la Base de Datos
En la carpeta `data` encontrarás el archivo **`dummy_script.sql`**. Al ejecutarlo en MySQL Workbench, se creará la estructura completa de la base de datos `sistema_academico`, incluyendo las tablas de datos académicos, las tablas de usuarios y roles (`users` y `authorities`), e insertará datos de prueba iniciales.

### 2. Ejecutar la Aplicación
1. Ejecuta la clase principal **`Modulo2Application.java`** desde tu IDE.
2. La API se levantará de forma local en el puerto `8080`.

### 3. Realizar Consultas y Probar Seguridad

Para realizar peticiones desde **Postman** o la consola, asegúrate de incluir **Basic Auth** seleccionando el usuario según el tipo de operación:

* **Peticiones `GET /api/subjects/**`:**
  * **Permitido para:** Roles `PROFESOR` y `DIRECTOR` (`juan` o `pedro`).
* **Peticiones `GET /api/teachers/**`:**
  * **Permitido para:** Rol `DIRECTOR` (`pedro`).
* **Peticiones `POST`, `PUT`, `DELETE` en `/api/teachers/**`:**
  * **Permitido para:** Rol `DIRECTOR` (`pedro`).

#### Endpoints destacados:
* **`GET /api/teachers/{id}/subjects`**: Muestra la información del profesor junto con la lista de sus asignaturas (Requiere rol `DIRECTOR`).
* **`GET /api/subjects/{id}/teacher`**: Muestra la asignatura y el profesor que la imparte (Requiere rol `PROFESOR` o `DIRECTOR`).