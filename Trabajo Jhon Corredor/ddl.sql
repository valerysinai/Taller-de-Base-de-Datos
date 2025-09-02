-- Trabajo para el trabajo de la Feria Internacional de Tecnología
USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'Fit')
DROP DATABASE Fit;
GO
-- DDL


CREATE DATABASE Fit;

GO
USE Fit;
GO

DROP TABLE IF EXISTS Feria;
DROP TABLE IF EXISTS Persona;
DROP TABLE IF EXISTS TipoVisitante;
DROP TABLE IF EXISTS Tematica;
DROP TABLE IF EXISTS Empresa;
DROP TABLE IF EXISTS Demostracion;
DROP TABLE IF EXISTS Charla;
DROP TABLE IF EXISTS Responsable;
DROP TABLE IF EXISTS Ponente;
DROP TABLE IF EXISTS Visitante;
DROP TABLE IF EXISTS Pabellon;
DROP TABLE IF EXISTS Stand;
DROP TABLE IF EXISTS Producto;
DROP TABLE IF EXISTS Registro;

-- Tabla para la feria
CREATE TABLE Feria(
    id_feria INT PRIMARY KEY,
    nombre VARCHAR(100),
    fecha_inicio DATE,
    fecha_fin DATE
);

-- Tabla para persona
CREATE TABLE Persona(
    id_persona INT PRIMARY KEY,
    nombre VARCHAR(100),
    apellido VARCHAR(100),
    dni VARCHAR(100),
    email VARCHAR(50),
    telefono VARCHAR(50)
);

-- Tabla para el tipo de visitante
CREATE TABLE TipoVisitante(
    id_tipo_visitante INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla tematica
CREATE TABLE Tematica(
    id_tematica INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla empresas
CREATE TABLE Empresa(
    id_empresa INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla para las demostraciones
CREATE TABLE Demostracion(
    id_demostracion INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla para las charlas
CREATE TABLE Charla(
    id_charla INT PRIMARY KEY,
    nombre VARCHAR(100)
);

-- Tabla para los responsables 
CREATE TABLE Responsable(
    id_responsable INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

-- Tabla para los ponentes 
CREATE TABLE Ponente(
    id_ponente INT PRIMARY KEY,
    id_persona INT,
    FOREIGN KEY (id_persona) REFERENCES Persona (id_persona)
);

-- Tabla para los visitantes (depende de Persona y TipoVisitante)
CREATE TABLE Visitante(
    id_visitante INT PRIMARY KEY,
    id_persona INT,
    id_tipo_visitante INT,
    FOREIGN KEY(id_persona) REFERENCES Persona(id_persona),
    FOREIGN KEY(id_tipo_visitante) REFERENCES TipoVisitante (id_tipo_visitante)
);

-- Tabla para los pabellones 
CREATE TABLE Pabellon(
    id_pabellon INT PRIMARY KEY,
    id_tematica INT,
    id_feria INT,
    FOREIGN KEY(id_tematica) REFERENCES Tematica (id_tematica),
    FOREIGN KEY (id_feria) REFERENCES Feria (id_feria)
);


-- Tabla para los stands 
CREATE TABLE Stand(
    id_stand INT PRIMARY KEY,
    id_empresa INT,
    id_pabellon INT,
    FOREIGN KEY(id_empresa) REFERENCES Empresa(id_empresa),
    FOREIGN KEY (id_pabellon) REFERENCES Pabellon (id_pabellon)
);

-- Tabla para los productos 
CREATE TABLE Producto(
    id_producto INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    id_stand INT,
    id_responsable INT,
    FOREIGN KEY(id_stand) REFERENCES Stand (id_stand),
    FOREIGN KEY(id_responsable) REFERENCES Responsable (id_responsable)
);


-- Tabla resgitro
CREATE TABLE Registro(
    id_registro INT PRIMARY KEY,
    id_feria INT,
    id_charla INT,
    id_visitante INT,
    id_ponente INT,
    id_empresa INT,
    FOREIGN KEY(id_feria) REFERENCES Feria (id_feria),
    FOREIGN KEY (id_charla) REFERENCES Charla (id_charla),
    FOREIGN KEY (id_visitante) REFERENCES Visitante (id_visitante),
    FOREIGN KEY(id_ponente) REFERENCES Ponente (id_ponente),
    FOREIGN KEY (id_empresa) REFERENCES Empresa (id_empresa)
);

 
