USE musical_model;

-- Creo la tabla GENEROS
CREATE TABLE GENEROS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    popularidad INT
);

-- Creo la tabla PISTAS
CREATE TABLE PISTAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    duracion TIME NOT NULL,
    titulo VARCHAR(255),
    letra TEXT,
    archivo VARCHAR(255) NOT NULL,
    reproducciones INT
);

-- una pista puede tener muchos generos y un genero puede es utilizado por muchas pistas, por eso la tabla GENEROSxPISTAS
CREATE TABLE GENEROSxPISTAS (
    id_genero INT,
    id_pista INT,
    PRIMARY KEY (id_genero, id_pista),
    FOREIGN KEY (id_genero) REFERENCES GENEROS(id),
    FOREIGN KEY (id_pista) REFERENCES PISTAS(id)
);


-- Creo la tabla USUARIOS
CREATE TABLE USUARIOS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    estado_membresia BOOLEAN
);

-- Un usuario puede escuchar muchas pistas y una pista puede ser escuchada por muchas personas 
CREATE TABLE USUARIOSXPISTAS (
    id_pista INT,
    id_usuario INT,
    PRIMARY KEY (id_pista, id_usuario),
    FOREIGN KEY (id_pista) REFERENCES PISTAS(id),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id)
);
/*

descarté esta tabla porque puedo conocer los gustos del usuario (generos) por viendo las pistas que escucha, porque ellas ya tienen el genero
CREATE TABLE USUARIOSXGENEROS (
    id_genero INT,
    id_usuario INT,
    PRIMARY KEY (id_genero, id_usuario),
    FOREIGN KEY (id_genero) REFERENCES GENEROS(id),
    FOREIGN KEY (id_usuario) REFERENCES USUARIOS(id)
);*/

CREATE TABLE ARTISTAS (
    id INT PRIMARY KEY AUTO_INCREMENT,
    edad INT,
    nombre VARCHAR(255) NOT NULL
);

CREATE TABLE ALBUMES (
    id_artista INT,
    id_pista INT,
    PRIMARY KEY (id_artista, id_pista),
    FOREIGN KEY (id_artista) REFERENCES ARTISTAS(id),
    FOREIGN KEY (id_pista) REFERENCES PISTAS(id)
);