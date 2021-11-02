-- MySQL Script generated by MySQL Workbench
-- Tue Nov  2 19:56:12 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering


-- -----------------------------------------------------
-- Table VIVERO
-- -----------------------------------------------------
DROP TABLE IF EXISTS VIVERO ;

CREATE TABLE IF NOT EXISTS VIVERO (
  NOMBRE VARCHAR(30) NOT NULL,
  LOCALIDAD VARCHAR(30) NULL,
  LATITUD FLOAT NULL,
  LONGITUD FLOAT NULL,
  PRIMARY KEY (NOMBRE));


-- -----------------------------------------------------
-- Table ZONA
-- -----------------------------------------------------
DROP TABLE IF EXISTS ZONA ;

CREATE TABLE IF NOT EXISTS ZONA (
  NOMBRE VARCHAR(30) NOT NULL,
  VIVERO_NOMBRE VARCHAR(30) NOT NULL,
  PRIMARY KEY (NOMBRE),
  INDEX fk_ZONA_VIVERO_idx (VIVERO_NOMBRE ASC) VISIBLE,
  CONSTRAINT fk_ZONA_VIVERO
    FOREIGN KEY (VIVERO_NOMBRE)
    REFERENCES VIVERO (NOMBRE)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table PRODUCTO
-- -----------------------------------------------------
DROP TABLE IF EXISTS PRODUCTO ;

CREATE TABLE IF NOT EXISTS PRODUCTO (
  COD_PROD VARCHAR(20) NOT NULL,
  NOMBRE VARCHAR(30) NULL,
  STOCK INT NULL,
  PRECIO FLOAT NULL,
  PRIMARY KEY (COD_PROD));


-- -----------------------------------------------------
-- Table CLIENTE
-- -----------------------------------------------------
DROP TABLE IF EXISTS CLIENTE ;

CREATE TABLE IF NOT EXISTS CLIENTE (
  DNI VARCHAR(9) NOT NULL,
  BONIFICACION FLOAT NULL,
  TOTAL_MENSUAL INT NULL,
  PRIMARY KEY (DNI));


-- -----------------------------------------------------
-- Table EMPLEADO
-- -----------------------------------------------------
DROP TABLE IF EXISTS EMPLEADO ;

CREATE TABLE IF NOT EXISTS EMPLEADO (
  DNI VARCHAR(9) NOT NULL,
  CSS VARCHAR(12) NULL,
  SUELDO FLOAT NULL,
  ANTIGUEDAD INT NULL,
  FECHA_INI TIMESTAMP NULL,
  FECHA_FIN TIMESTAMP NULL,
  VENTAS INT NULL,
  ZONA_NOMBRE VARCHAR(30) NOT NULL,
  PRIMARY KEY (DNI),
  INDEX fk_EMPLEADO_ZONA1_idx (ZONA_NOMBRE ASC) VISIBLE,
  UNIQUE INDEX CSS_UNIQUE (CSS ASC) VISIBLE,
  CONSTRAINT fk_EMPLEADO_ZONA1
    FOREIGN KEY (ZONA_NOMBRE)
    REFERENCES ZONA (NOMBRE)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table PRODUCTO_ZONA
-- -----------------------------------------------------
DROP TABLE IF EXISTS PRODUCTO_ZONA ;

CREATE TABLE IF NOT EXISTS PRODUCTO_ZONA (
  PRODUCTO_COD_PROD VARCHAR(20) NOT NULL,
  ZONA_NOMBRE VARCHAR(30) NOT NULL,
  PRIMARY KEY (PRODUCTO_COD_PROD, ZONA_NOMBRE),
  INDEX fk_PRODUCTO_ZONA_ZONA1_idx (ZONA_NOMBRE ASC) VISIBLE,
  CONSTRAINT fk_PRODUCTO_ZONA_PRODUCTO1
    FOREIGN KEY (PRODUCTO_COD_PROD)
    REFERENCES PRODUCTO (COD_PROD)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_PRODUCTO_ZONA_ZONA1
    FOREIGN KEY (ZONA_NOMBRE)
    REFERENCES ZONA (NOMBRE)
    ON DELETE CASCADE
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table PRODUCTO_CLIENTE_EMPLEADO
-- -----------------------------------------------------
DROP TABLE IF EXISTS PRODUCTO_CLIENTE_EMPLEADO ;

CREATE TABLE IF NOT EXISTS PRODUCTO_CLIENTE_EMPLEADO (
  PRODUCTO_COD_PROD VARCHAR(20) NOT NULL,
  CLIENTE_DNI VARCHAR(9) NOT NULL,
  FECHA TIMESTAMP NOT NULL,
  CANTIDAD INT NULL,
  EMPLEADO_DNI VARCHAR(9) NOT NULL,
  PRIMARY KEY (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA),
  INDEX fk_COMPRA_CLIENTE1_idx (CLIENTE_DNI ASC) VISIBLE,
  INDEX fk_PRODUCTO_CLIENTE_EMPLEADO_EMPLEADO1_idx (EMPLEADO_DNI ASC) VISIBLE,
  CONSTRAINT fk_COMPRA_PRODUCTO1
    FOREIGN KEY (PRODUCTO_COD_PROD)
    REFERENCES PRODUCTO (COD_PROD)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_COMPRA_CLIENTE1
    FOREIGN KEY (CLIENTE_DNI)
    REFERENCES CLIENTE (DNI)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_PRODUCTO_CLIENTE_EMPLEADO_EMPLEADO1
    FOREIGN KEY (EMPLEADO_DNI)
    REFERENCES EMPLEADO (DNI)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

-- -----------------------------------------------------
-- Data for table VIVERO
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero1', 'La Laguna', 28.4817602, -16.3093042);
INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero2', 'Geneto', 28.4797642, -16.305497);
INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero3', 'Las Americas', 28.0604411, -16.7301994);
INSERT INTO VIVERO (NOMBRE, LOCALIDAD, LATITUD, LONGITUD) VALUES ('Vivero4', 'La Orotava', 28.3929437, -16.5272333);

COMMIT;


-- -----------------------------------------------------
-- Data for table ZONA
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona1', 'Vivero1');
INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona2', 'Vivero1');
INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona3', 'Vivero2');
INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona4', 'Vivero3');
INSERT INTO ZONA (NOMBRE, VIVERO_NOMBRE) VALUES ('Zona5', 'Vivero4');

COMMIT;


-- -----------------------------------------------------
-- Data for table PRODUCTO
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00001', 'Azucena', 78, 7.85);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00002', 'Margarita', 86, 2.56);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00003', 'Lirio', 105, 6.00);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00004', 'Rosa', 78, 1.25);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00005', 'Tulipan', 212, 6.99);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00006', 'Orquidea', 23, 12.86);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00007', 'Amapola', 98, 9.99);
INSERT INTO PRODUCTO (COD_PROD, NOMBRE, STOCK, PRECIO) VALUES ('P00008', 'Geranio', 145, 17.63);

COMMIT;


-- -----------------------------------------------------
-- Data for table CLIENTE
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO CLIENTE (DNI, BONIFICACION, TOTAL_MENSUAL) VALUES ('54115666R', 30, 3);
INSERT INTO CLIENTE (DNI, BONIFICACION, TOTAL_MENSUAL) VALUES ('43487653N', 22.5, 2);
INSERT INTO CLIENTE (DNI, BONIFICACION, TOTAL_MENSUAL) VALUES ('49684321G', 15, 1);
INSERT INTO CLIENTE (DNI, BONIFICACION, TOTAL_MENSUAL) VALUES ('51426002Z', 12.2, 1);
INSERT INTO CLIENTE (DNI, BONIFICACION, TOTAL_MENSUAL) VALUES ('45867321I', 10, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table EMPLEADO
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('47240874K', '685475986231', 950.80, 1, '2020-05-17 09:00:00', NULL, 3, 'Zona1');
INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('42123905L', '167598632105', 978.00, 3, '2018-01-18 09:00:00', NULL, 2, 'Zona1');
INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('56847365P', '105487636333', 950.80, 1, '2020-03-01 15:00:00', NULL, 1, 'Zona2');
INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('54287665T', '541685201477', 1020.00, 4, '2016-02-01 15:00:00', NULL, 2, 'Zona3');
INSERT INTO EMPLEADO (DNI, CSS, SUELDO, ANTIGUEDAD, FECHA_INI, FECHA_FIN, VENTAS, ZONA_NOMBRE) VALUES ('45256147G', '784569633665', 950.80, 1, '2016-02-01 09:00:00', '2016-03-31 22:00:00', 0, 'Zona2');

COMMIT;


-- -----------------------------------------------------
-- Data for table PRODUCTO_ZONA
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00001', 'Zona1');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00002', 'Zona1');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00003', 'Zona1');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00004', 'Zona2');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00005', 'Zona3');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00006', 'Zona4');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00007', 'Zona5');
INSERT INTO PRODUCTO_ZONA (PRODUCTO_COD_PROD, ZONA_NOMBRE) VALUES ('P00008', 'Zona5');

COMMIT;


-- -----------------------------------------------------
-- Data for table PRODUCTO_CLIENTE_EMPLEADO
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00001', '54115666R', '2021-05-17 19:02:21', 10, '47240874K');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00002', '43487653N', '2021-05-21 15:42:54', 2, '47240874K');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00003', '54115666R', '2021-05-23 11:42:26', 5, '47240874K');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00004', '49684321G', '2021-05-23 12:17:40', 2, '42123905L');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00005', '51426002Z', '2021-05-30 17:31:17', 6, '56847365P');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00006', '45867321I', '2021-06-02 19:14:26', 9, '54287665T');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00007', '43487653N', '2021-06-02 18:19:02', 4, '54287665T');
INSERT INTO PRODUCTO_CLIENTE_EMPLEADO (PRODUCTO_COD_PROD, CLIENTE_DNI, FECHA, CANTIDAD, EMPLEADO_DNI) VALUES ('P00008', '54115666R', '2021-06-04 12:27:22', 1, '42123905L');

COMMIT;

