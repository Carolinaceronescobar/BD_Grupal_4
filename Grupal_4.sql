/* Parte 1: Crear entorno de trabajo
- Crear una base de datos*/
Create Database telovendo_2;
Use telovendo_2;

--  Crear un usuario con todos los privilegios para trabajar con la base de datos recién creada. --
CREATE USER 'admintelovendo_2'@'localhost' IDENTIFIED BY 'Clave_admintelovendo_2';
GRANT ALL PRIVILEGES ON telovendo_2.* TO 'admintelovendo_2'@'localhost';
FLUSH PRIVILEGES;

/* Parte 2:
Crear dostablas.
- La primera almacena a los usuarios de la aplicación (id_usuario, nombre, apellido, contraseña, zona
horaria (por defecto UTC-3), género y teléfono de contacto). */
Create Table usuarios (id_usuario int Primary Key Auto_increment, nombre varchar(50),
 apellido Varchar(50), contraseña Varchar(50), zona_horaria varchar(50) Default "UTC-3", genero Varchar(50), telefono Varchar(15));
 
  /* La segunda tabla almacena información relacionada a la fecha-hora de ingreso de los usuarios a la 
 plataforma (id_ingreso, id_usuario y la fecha-hora de ingreso (por defecto la fecha-hora actual)). */
Create Table ingreso_usuarios ( id_ingreso int Primary Key Auto_increment,id_usuario int, fecha_hora_ingreso DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario));
 
 /* Parte 3: Modificación de la tabla
- Modifique el UTC por defecto.Desde UTC-3 a UTC-2.  */
Alter Table usuarios Alter Column zona_horaria set default "UTC-2";

/* Parte 4:
Creación de registros.
- Para cada tabla crea 8 registros. */
-- Registro tabla Usuarios --
INSERT INTO Usuarios (nombre, apellido, contraseña, zona_horaria, genero, telefono)
VALUES
  ('Juan', 'Pérez', 'contraseña1', 'UTC-2', 'Masculino', '123456789'),
  ('María', 'Gómez', 'contraseña2', 'UTC-2', 'Femenino', '987654321'),
  ('Pedro', 'Sánchez', 'contraseña3', 'UTC-2', 'Masculino', '555555555'),
  ('Laura', 'López', 'contraseña4', 'UTC-2', 'Femenino', '111111111'),
  ('Carlos', 'Rodríguez', 'contraseña5', 'UTC-2', 'Masculino', '999999999'),
  ('Ana', 'Martínez', 'contraseña6', 'UTC-2', 'Femenino', '777777777'),
  ('Jorge', 'González', 'contraseña7', 'UTC-2', 'Masculino', '222222222'),
  ('Sofía', 'Hernández', 'contraseña8', 'UTC-2', 'Femenino', '444444444');
  
  -- Registro tabla Ingreso usuarios --
  INSERT INTO ingreso_usuarios (id_usuario, fecha_hora_ingreso)
VALUES
  (1, CURRENT_TIMESTAMP),
  (2, CURRENT_TIMESTAMP),                             
  (3, CURRENT_TIMESTAMP),                             
  (4, CURRENT_TIMESTAMP),                            
  (5, CURRENT_TIMESTAMP),
  (6, CURRENT_TIMESTAMP),
  (7, CURRENT_TIMESTAMP),
  (8, CURRENT_TIMESTAMP);
  
  /* Parte 5: Justifique cada tipo de dato utilizado. ¿Es el óptimo en cada caso? */
  
/*  Parte 6: Creen una nueva tabla llamada Contactos (id_contacto, id_usuario, numero de telefono, correo
electronico).  */
Create Table contactos (id_contacto int Primary Key Auto_increment, id_usuario int, telefono Varchar (15), correo_electronico Varchar(50),
 FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario));
  
  /* Parte 7: Modifique la columna teléfono de contacto, para crear un vínculo entre la tabla Usuarios y la tabla
Contactos. */
ALTER TABLE usuarios ADD COLUMN id_contacto INT, ADD FOREIGN KEY (id_contacto) REFERENCES contactos(id_contacto);
  


