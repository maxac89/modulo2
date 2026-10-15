# 📚 Sistema Académico - API REST (Módulo 2)

Proyecto colaborativo en parejas desarrollado por Arnau y Max para aprender y aplicar tecnologías de desarrollo backend modernas, control de versiones y persistencia de datos.

---

## 🛠️ Tecnologías y Herramientas Utilizadas
* **Lenguaje:** Java
* **Framework:** Spring Boot
* **Persistencia:** JPA / Hibernate
* **Base de Datos:** MySQL Workbench (SQL)
* **Control de Versiones:** Git y GitHub
* **Pruebas de API:** Postman y Navegador Web

---

## 🗄️ Modelo de Base de Datos
La base de datos se llama `sistema_academico` y consta de dos tablas principales con una relación de **Uno a Muchos (One-to-Many)**:
* **`teacher` (Profesor):** Contiene la información de los profesores (`id`, `first_name`, `last_name`, `address`).
* **`subject` (Asignatura):** Contiene la información de las materias (`id`, `name`, `credits`, `lecture_hours`, `teacher_id`). 
* *Regla de negocio:* Un profesor puede impartir múltiples asignaturas, pero una asignatura solo puede pertenecer a un único profesor.
---

## 🚀 Cómo Usar el Proyecto

### 1. Configurar la Base de Datos
En la carpeta `data` del repositorio encontrarás dos scripts SQL para inicializar tu base de datos en MySQL Workbench según prefieras:
* **`empty_script.sql`**: Crea la base de datos y las tablas completamente vacías para empezar a registrar datos desde cero.
* **`dummy_script.sql`**: Crea la estructura e incorpora **20 registros de prueba en español** para cada tabla de forma automática.

### 2. Configurar la Conexión
Abre el archivo de configuración en tu entorno de desarrollo (`src/main/resources/application.properties`) y asegúrate de que los accesos coincidan con tu servidor local de MySQL:
```properties
spring.datasource.url=jdbc:mysql://localhost:3306/sistema_academico?useSSL=false&serverTimezone=UTC
spring.datasource.username=tu_usuario
spring.datasource.password=tu_contraseña
```

### 3. Ejecutar la Aplicación
1. Ejecuta la clase principal **`Modulo2Application.java`** desde tu IDE (como NetBeans o IntelliJ).
2. La API se levantará de forma local en el puerto `8080`.

### 4. Realizar Consultas (Endpoints Disponibles)
Puedes probar las rutas directamente desde tu navegador web habitual o utilizando herramientas de pruebas de API como **Postman**:

* **Consultar un profesor y las materias que imparte:**
  * **URL:** `http://localhost:8080/api/teacher/{id}/subjects`
  * **Descripción:** Devuelve la información completa del profesor junto con un listado con los nombres de las asignaturas que enseña.

* **Consultar una materia y su profesor asignado:**
  * **URL:** `http://localhost:8080/api/subject/{id}/teacher`
  * **Descripción:** Devuelve los detalles de la asignatura en concreto junto con la información del docente responsable de impartirla.

  ---