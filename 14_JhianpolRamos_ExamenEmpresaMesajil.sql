
CREATE DATAVASE mesajil
GO

Use mesajil
GO

-- Table: UBIGEO
CREATE TABLE UBIGEO (
    CODUBI char(6) NOT NULL ,
    PROUBI varchar(150) NOT NULL,
    DEPUBI varchar(150) NOT NULL,
    DISUBI varchar(150) NOT NULL,
    CONSTRAINT UBIGEO_pk PRIMARY KEY (CODUBI)
);
GO



-- Table: SUCURSAL
CREATE TABLE SUCURSAL (
    IDSUC int NOT NULL  identity(1,1),
	NOMSUC varchar(50) NOT NULL,
    DIRSUC varchar(100) NOT NULL,
    TELSUC char(9) NOT NULL,
	EMASUC varchar(80) NOT NULL,
    CODUBI char(6) NOT NULL,
	ESTSUC char (1) NOT NULL,
    CONSTRAINT SUCURSAL_pk PRIMARY KEY (IDSUC)
);
GO


-- Table: USUARIO
CREATE TABLE USUARIO (
    IDUSU int NOT NULL  identity(1,1),
    NOMUSU varchar(40) NOT NULL,
    APEUSU varchar(40) NOT NULL,
    DNIUSU char(8) NOT NULL,
    EMAUSU varchar(60) NOT NULL,
    TIPUSU varchar(20) NOT NULL,
    CODUBI char(6) NOT NULL,
    IDSUC int NOT NULL,
    CONSTRAINT USUARIO_pk PRIMARY KEY (IDUSU)
);
GO


-- Table: VENTA
CREATE TABLE VENTA (
    IDVEN int NOT NULL  identity(1,1),
    FECVEN date NOT NULL,
    TOTVEN decimal(10,2) NOT NULL,
    IDUSU int NOT NULL,
	ESTVEN char(1) NOT NULL, 
    CONSTRAINT VENTA_pk PRIMARY KEY (IDVEN)
);



-- Table: DETALLEVENTA
CREATE TABLE DETALLEVENTA (
    IDDET int NOT NULL  identity(1,1),
    IDPRO int NOT NULL,
    IDVEN int NOT NULL,
	CANDET int NOT NULL,
	SUBDET decimal(10,2) NOT NULL,
	ESTDET char(1),
    CONSTRAINT DETALLEVENTA_pk PRIMARY KEY (IDDET)
);
GO


-- Table: PRODUCTO
CREATE TABLE PRODUCTO (
    IDPRO int NOT NULL  identity(1,1), 
	CATPRO varchar(50) NOT NULL,  
	NOMPRO varchar(90) NOT NULL,
    PREPRO decimal(10,2) NOT NULL , 
    STOPRO VARCHAR(2) NOT NULL,
	ESTPRO char(1) NOT NULL,
    CONSTRAINT PRODUCTO_pk PRIMARY KEY (IDPRO)
);
GO

-- foreign keys
-- Reference: USUARIO_UBIGEO (table: USUARIO)
ALTER TABLE USUARIO
ADD CONSTRAINT FK_USUARIO_UBIGEO
FOREIGN KEY (CODUBI) REFERENCES UBIGEO (CODUBI)
GO

-- Reference: PRODUCTO_DETALLEVENTA (table: PRODUCTO)
ALTER TABLE DETALLEVENTA 
ADD CONSTRAINT FK_DETALLEVENTA_PRODUCTO 
FOREIGN KEY  (IDPRO) REFERENCES PRODUCTO (IDPRO)
GO

-- Reference: SUCURSAL_UBIGEO (table: SUCURSAL)
ALTER TABLE SUCURSAL 
ADD CONSTRAINT FK_SUCURSAL_UBIGEO 
FOREIGN KEY (CODUBI)REFERENCES UBIGEO (CODUBI)
GO

-- Reference: USUARIO_SUCURSAL (table: USUARIO)
ALTER TABLE USUARIO 
ADD CONSTRAINT FK_USUARIO_SUCURSAL 
FOREIGN KEY (IDSUC) REFERENCES SUCURSAL (IDSUC)
GO


-- Reference: VENTA_USUARIO (table: VENTA)
ALTER TABLE VENTA 
ADD CONSTRAINT FK_VENTA_USUARIO 
FOREIGN KEY (IDUSU) REFERENCES USUARIO (IDUSU)
GO 


-- Reference: DETALLEVENTA_VENTA (table: VENTADETALLE)
ALTER TABLE DETALLEVENTA 
ADD CONSTRAINT FK_DETALLEVENTA_VENTA 
FOREIGN KEY (IDVEN) REFERENCES VENTA (IDVEN)
GO



--INSERTANDO REGISTROS

INSERT INTO UBIGEO
(CODUBI, PROUBI, DEPUBI,DISUBI)
VALUES
('150501','LIMA','CAÑETE','SAN VICENTE DE CAÑETE'),
('150502','LIMA','CAÑETE','ASIA'),
('150503','LIMA','CAÑETE','CALANGO'),
('150504','LIMA','CAÑETE','CERRO AZUL'),
('150505','LIMA','CAÑETE','CHILCA'),
('150506','LIMA','CAÑETE','COAYLLO'),
('150507','LIMA','CAÑETE','IMPERIAL'),
('150508','LIMA','CAÑETE','LUNAHUANA'),
('150509','LIMA','CAÑETE','MALA'),
('150510','LIMA','CAÑETE','NUEVO IMPERIAL'),
('150511','LIMA','CAÑETE','PACARAN'),
('150512','LIMA','CAÑETE','QUILMANA'),
('150513','LIMA','CAÑETE','SAN ANTONIO'),
('150514','LIMA','CAÑETE','SAN LUIS'),
('150515','LIMA','CAÑETE','SANTA CRUZ DE FLORES'),
('150516','LIMA','CAÑETE','ZUÑIGA'),
('110201','ICA','CHINCHA','CHINCHA ALTA'),
('110202','ICA','CHINCHA','ALTO LARAN'),
('110203','ICA','CHINCHA','CHAVIN'),
('110204','ICA','CHINCHA','CHINCHA BAJA'),
('110205','ICA','CHINCHA','EL CARMEN'),
('110206','ICA','CHINCHA','GROCIO PRADO'),
('110207','ICA','CHINCHA','PUEBLO NUEVO'),
('110208','ICA','CHINCHA','SAN JUAN DE YANAC'),
('110209','ICA','CHINCHA','SAN PEDRO DE HUACARPANA'),
('110210','ICA','CHINCHA','SUNAMPE'),
('110211','ICA','CHINCHA','TAMBO DE MORA'),
('150101','LIMA','LIMA','LIMA'),
('150102','LIMA','LIMA','ANCON'),
('150103','LIMA','LIMA','ATE'),
('150104','LIMA','LIMA','BARRANCO'),
('150105','LIMA','LIMA','BREÑA'),
('150106','LIMA','LIMA','CARABAYLLO'),
('150107','LIMA','LIMA','CHACLACAYO'),
('150108','LIMA','LIMA','CHORRILLOS'),
('150109','LIMA','LIMA','CIENEGUILLA'),
('150110','LIMA','LIMA','COMAS'),
('150111','LIMA','LIMA','EL AGUSTINO'),
('150112','LIMA','LIMA','INDEPENDENCIA'),
('150113','LIMA','LIMA','JESUS MARIA'),
('150114','LIMA','LIMA','LA MOLINA'),
('150115','LIMA','LIMA','LA VICTORIA'),
('150116','LIMA','LIMA','LINCE'),
('150117','LIMA','LIMA','LOS OLIVOS'),
('150118','LIMA','LIMA','LURIGANCHO'),
('150119','LIMA','LIMA','LURIN'),
('150120','LIMA','LIMA','MAGDALENA DEL MAR'),
('150121','LIMA','LIMA','MAGDALENA VIEJA'),
('150122','LIMA','LIMA','MIRAFLORES'),
('150123','LIMA','LIMA','PACHACAMAC'),
('150124','LIMA','LIMA','PUCUSANA'),
('150125','LIMA','LIMA','PUENTE PIEDRA'),
('150126','LIMA','LIMA','PUNTA HERMOSA'),
('150127','LIMA','LIMA','PUNTA NEGRA'),
('150128','LIMA','LIMA','RIMAC'),
('150129','LIMA','LIMA','SAN BARTOLO'),
('150130','LIMA','LIMA','SAN BORJA'),
('150131','LIMA','LIMA','SAN ISIDRO'),
('150132','LIMA','LIMA','SAN JUAN DE LURIGANCHO'),
('150133','LIMA','LIMA','SAN JUAN DE MIRAFLORES'),
('150134','LIMA','LIMA','SAN LUIS'),
('150135','LIMA','LIMA','SAN MARTIN DE PORRES'),
('150136','LIMA','LIMA','SAN MIGUEL'),
('150137','LIMA','LIMA','SANTA ANITA'),
('150138','LIMA','LIMA','SANTA MARIA DEL MAR'),
('150139','LIMA','LIMA','SANTA ROSA'),
('150140','LIMA','LIMA','SANTIAGO DE SURCO'),
('150141','LIMA','LIMA','SURQUILLO'),
('150142','LIMA','LIMA','VILLA EL SALVADOR'),
('150143','LIMA','LIMA','VILLA MARIA DEL TRIUNFO');
GO


INSERT INTO SUCURSAL
(NOMSUC,DIRSUC, TELSUC,EMASUC, CODUBI,ESTSUC)
VALUES
('Galeria Compuplaza','Av. Garcilaso de la Vega 1249 – Tienda 107','934934276','tienda107@mesajilhnos.com','150106','A'),
('Galeria Garcilaso', 'Av. Garcilaso de la Vega 1261- Tienda 213 ','998192606',' ventas@mesajil.com','150143','A'),
('Lima Centro ','Jr. Camaná 1127 Lima – Cercado','977572751','ventas@mesajil.com','150106','A'),
('Galeria San Isidro','Av. República de Colombia 130 – 136','983472621',' tiendasi@mesajilhnos.com','150131','A'),
('Galeria La Molina','Av. Javier Prado Este 5940 ','904926818','tiendalamolina@mesajilhnos.com','150114','A'),
('Galeria Compupalace','Av. Petit Thouars 5356 – Tienda 2107-2108','977582308',' ventas@mesajil.com','150122','A'),
('Galeria Compupalace','Av. Petit Thouars 5356 – Tienda 1112','999918579','tienda1112@mesajilhnos.com','150122','A'),
('Galeria Compupalace','Av. Petit Thouars 5356 – Tienda 1073','923355777','showroomhp@mesajilhnos.com','150122','A');
GO

INSERT INTO USUARIO
(NOMUSU,APEUSU, DNIUSU,EMAUSU, TIPUSU,CODUBI,IDSUC)
VALUES
('Sergio Londo','Flores Tadeo','70134576','segio.flores@vallegrande.edu.pe','Vendedor','150141','1'),
('Juan Gabriel','Condori Jara','71203989','juan.condori@vallegrande.edu.pe','Vendedor','150501','2'),
('Edson Rolando','Garcia Cadenas','72145676','edson.cardenas@vallegrande.edu.pe','Vendedor','150142','3'),
('Victor Alex ','Ramos Mochisuki ','73150976','victor.ramos@vallegrande.edu.pe','Vendedor','150134','4'),
('Alvalo Raul','Flores Perez','74010576','alvaro.perez@vallegrande.edu.pe','Jefe Sucursal','150141','5'),
('Rodrigo Calloba ','Carbajal Tomaro','75904276','rodrigo.tomaro@vallegrande.edu.pe','Vendedor','150141','6'),
('Malakias Sebastian','Sondama Perezoso','76104573','malakias.perezoso@vallegrande.edu.pe','Administrador','150121','7');
GO


INSERT INTO PRODUCTO
(CATPRO,NOMPRO,PREPRO,STOPRO,ESTPRO)
VALUES
('Computadoras','All In One HP 200 G4 Intel Core i3-10110U 8GB/1TB/21.5″ FreeDOS SKU: 023107','2054.85','60','A'),
('Adaptadores Cables','Cable Fuente Poder Tipo 8 de 1.80m SKU: 000028','300.00','69','A'),
('Componenes para PC','Case Antryx RX Energy S + Fuente B600W SKU: 023487','335.16','50','A'),
('Impresoras','Impresora BIXOLON TERMICA SRP-F312II USB/RED SKU: 023399','957.60','70','A'),
('Periféricos ','Audifono JBL Harman T750BT NC Bluetooth White SKU: 023465','391.02','20','A'),
('Zona Gamer','Adaptador Astro Gaming HDMI para Playstation 5 SKU: 023514','157.61','92','A');
GO

INSERT INTO VENTA
(FECVEN,TOTVEN, IDUSU,ESTVEN)
VALUES
('2021-06-24','200.00','1','A'),
('2020-02-12','300.00','2','A'),
('2020-12-01','500.00','3','A'),
('2020-03-21','200.00','1','A'),
('2019-09-14','300.00','2','A'),
('2019-03-20','500.00','3','A');
GO

INSERT INTO DETALLEVENTA
(IDPRO,IDVEN, CANDET, SUBDET,ESTDET)
VALUES
('2','1','2','1000.00','A'),
('4','2','3','600.00','A'),
('1','3','4','500.00','A'),
('3','4','5','700.00','A'),
('6','5','6','800.00','A'),
('5','6','7','900.00','A');
GO 


--VISTAS

/* Generando una vista de solo los  vendedores de la tabla usuario */
CREATE VIEW v
AS
SELECT
    U.NOMUSU AS 'Nombre',
    U.APEUSU AS 'Apellido',
    U.DNIUSU AS 'Dni',
    U.EMAUSU AS 'Email',
	V.FECVEN AS  'Fecha',
	V.TOTVEN AS  'Total',
	P.NOMPRO AS 'NomreProducto',
	D.SUBDET AS  'Subtotal'
FROM DETALLEVENTA AS D 
	INNER JOIN  VENTA AS V ON 
	D.IDVEN = V.IDVEN
	INNER JOIN PRODUCTO AS P ON
	D.IDPRO = P.IDPRO
	INNER JOIN  USUARIO AS U ON 
	V.IDUSU =  U.IDUSU
GO
