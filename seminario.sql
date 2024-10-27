CREATE DATABASE Ki_FengShui;
USE Ki_FengShui;
CREATE TABLE usuarios (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    correo_electronico VARCHAR(100) UNIQUE,
    contrasena VARCHAR(255),
    rol ENUM('estudiante', 'profesor', 'administrador')
);

CREATE TABLE cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_profesor INT,
    FOREIGN KEY (id_profesor) REFERENCES usuarios(id_usuario)
);

CREATE TABLE inscripciones (
    id_inscripcion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_curso INT,
    fecha_inscripcion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE pagos (
    id_pago INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_curso INT,
    monto DECIMAL(10,2),
    fecha_pago DATE,
    metodo_pago VARCHAR(50),
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE calificaciones (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT,
    id_curso INT,
    valor_calificacion DECIMAL(5,2),
    fecha_calificacion DATE,
    FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

CREATE TABLE horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT,
    id_aula INT,
    dia_semana ENUM('Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'),
    hora_inicio TIME,
    hora_fin TIME,
    id_profesor INT,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso),
    FOREIGN KEY (id_aula) REFERENCES aulas(id_aula),
    FOREIGN KEY (id_profesor) REFERENCES usuarios(id_usuario)
);

CREATE TABLE aulas (
    id_aula INT PRIMARY KEY,
    nombre_aula VARCHAR(50),
    capacidad INT
);
INSERT INTO usuarios (nombre, apellido, correo_electronico, contrasena, rol)
VALUES
    ('Francisco Alejandro', 'López Mercado', 'franlopez123mra@gmail.com', 'tu_contraseña', 'administrador'),
    ('María', 'Pérez', 'maria.perez@gmail.com', '456789ga', 'administrador');
INSERT INTO usuarios (nombre, apellido, correo_electronico, contrasena, rol)
VALUES
    ('Ana', 'García', 'ana.garcia@gmail.com', '231987ff', 'profesor'),
    ('Juan', 'Rodríguez', 'juan.rodriguez@gmail.com', 'sodjaa455', 'profesor'),
    ('Agustina', 'Mercado', 'agusmer@gmail.com', '516165ff', 'profesor')
;
INSERT INTO usuarios (nombre, apellido, correo_electronico, contrasena, rol)
VALUES
    ('Lucas', 'Fernández', 'lucas.fernandez123@gmail.com', 'Contraseña123', 'estudiante'),
    ('Camila', 'Pérez', 'camiperez987@gmail.com', 'AbCd123!', 'estudiante'),
    ('Mateo', 'González', 'mateogonzalez2005@gmail.com', 'MiContraseñaSegura', 'estudiante'),
    ('Sofía', 'Romero', 'sofiaromero456@gmail.com', 'Contraseña789', 'estudiante'),
    ('Diego', 'Martínez', 'diego.martinez99@gmail.com', 'Password1234', 'estudiante'),
    ('Valentina', 'López', 'valentina.lopez2010@gmail.com', 'MiClaveSecreta', 'estudiante'),
    ('Benjamín', 'Sánchez', 'benjamin.sanchez@gmail.com', 'ContraseñaFuerte', 'estudiante'),
    ('Victoria', 'Torres', 'victoria.torres2008@gmail.com', 'ClaveSegura987', 'estudiante'),
    ('Santiago', 'Vidal', 'santiagovidal789@gmail.com', 'MiPasswordSeguro', 'estudiante'),
    ('Florencia', 'Castro', 'florenciacastro2009@gmail.com', 'Contraseña12345', 'estudiante');
INSERT INTO aulas (id_aula, nombre_aula, capacidad)
VALUES
    (1, 'Aula 1', 10),
    (2, 'Aula 2', 15),
    (3, 'Aula 3', 8);
INSERT INTO cursos (nombre, descripcion, id_profesor)
VALUES
    ('Inglés Básico', 'Curso de inglés para principiantes', 1),
    ('Inglés Intermedio', 'Curso de inglés para nivel intermedio', 1),
    ('Inglés Avanzado', 'Curso de inglés para nivel avanzado', 2);
INSERT INTO cursos (nombre, descripcion, id_profesor)
VALUES
    ('Portugués Básico', 'Curso de portugués para principiantes', 3),
    ('Portugués Intermedio', 'Curso de portugués para nivel intermedio', 3),
    ('Portugués Avanzado', 'Curso de portugués para nivel avanzado', 3);
INSERT INTO horarios (id_curso, id_aula, dia_semana, hora_inicio, hora_fin, id_profesor)
VALUES
    (25, 1, 'Lunes', '16:30:00', '18:30:00', 1),  -- Inglés Básico
    (25, 2, 'Miércoles', '18:30:00', '20:30:00', 1), -- Inglés Básico
    (26, 1, 'Martes', '10:00:00', '12:00:00', 1),  -- Inglés Intermedio
    (29, 2, 'Jueves', '16:30:00', '18:30:00', 3), -- Portugués Intermedio
    (28, 3, 'Viernes', '10:00:00', '12:00:00', 3),  -- Portugués Básico
	(28, 2, 'Lunes', '16:30:00', '18:30:00', 3),  -- Portugués Básico
    (27, 3, 'Sábado', '10:00:00', '12:00:00', 2);  -- Inglés Avanzado 
INSERT INTO inscripciones (id_usuario, id_curso, fecha_inscripcion)
VALUES
    (6, 25, '2024-01-15'),
    (7, 26, '2024-02-05'),
    (8, 27, '2024-03-10'),
    (9, 28, '2024-01-20'),
    (10, 29, '2024-02-15'),
    (11, 25, '2024-03-01'),
    (12, 26, '2024-02-28'),
    (13, 27, '2024-01-10'),
    (14, 28, '2024-03-20'),
    (15, 29, '2024-02-18');
INSERT INTO pagos (id_usuario, id_curso, monto, fecha_pago, metodo_pago)
VALUES
    (6, 25, 13000, '2024-09-10', 'Efectivo'),
    (8, 27, 13000, '2024-09-20', 'Transferencia'),
    (9, 28, 13000, '2024-09-05', 'Efectivo'),
    (10, 29, 13000, '2024-09-15', 'Transferencia'),
    (12, 26, 13000, '2024-09-25', 'Efectivo'),
    (13, 27, 13000, '2024-09-12', 'Transferencia'),
    (14, 28, 13000, '2024-09-08', 'Efectivo'),
    (15, 29, 13000, '2024-09-22', 'Transferencia');

SELECT 
    i.id_usuario,
    u.nombre,
    u.apellido,
    i.id_curso,
    c.nombre AS nombre_curso
FROM
    inscripciones i
INNER JOIN usuarios u ON i.id_usuario = u.id_usuario
INNER JOIN cursos c ON i.id_curso = c.id_curso
LEFT JOIN pagos p ON i.id_usuario = p.id_usuario AND i.id_curso = p.id_curso
WHERE
    p.id_usuario IS NULL;
    
SELECT u.nombre,
u.apellido
FROM usuarios u
INNER JOIN
inscripciones i ON u.id_usuario = i.id_usuario
INNER JOIN
cursos c ON i.id_curso = c.id_curso
WHERE c.nombre =
'Inglés Básico';

SELECT cursos.nombre, horarios.hora_inicio, horarios.hora_fin
FROM horarios
INNER JOIN cursos ON horarios.id_curso = cursos.id_curso
WHERE dia_semana = 'lunes';

SELECT dia_semana
FROM horarios
INNER JOIN cursos ON horarios.id_curso = cursos.id_curso
WHERE nombre = 'Inglés básico';
