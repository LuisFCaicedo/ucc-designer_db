/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     1/11/2023 10:35:19 p. m.                     */
/*==============================================================*/


ALTER TABLE ITINERARIO
   DROP CONSTRAINT FK_ITINERAR_REFE_ID_ORIGE;

ALTER TABLE ITINERARIO
   DROP CONSTRAINT FK_ITINERAR_REFE_DESTINO;

ALTER TABLE PASAJES
   DROP CONSTRAINT FK_PASAJES_REFE_CLIENTE;

ALTER TABLE PASAJES
   DROP CONSTRAINT FK_PASAJES_REFE_VUELO;

ALTER TABLE VUELO
   DROP CONSTRAINT FK_VUELO_REFE_COMPANIA;

ALTER TABLE VUELO
   DROP CONSTRAINT FK_VUELO_REFE_ITINERAR;

DROP TABLE CLIENTE CASCADE CONSTRAINTS;

DROP TABLE COMPANIA CASCADE CONSTRAINTS;

DROP TABLE DESTINO CASCADE CONSTRAINTS;

DROP TABLE ID_ORIGEN CASCADE CONSTRAINTS;

DROP TABLE ITINERARIO CASCADE CONSTRAINTS;

DROP TABLE PASAJES CASCADE CONSTRAINTS;

DROP TABLE VUELO CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE  (
   ID_CLIENTE           NUMBER(12)                      NOT NULL,
   NOMBRE               VARCHAR2(20)                    NOT NULL,
   EDAD                 NUMBER(3)                       NOT NULL,
   TELEFONO             NUMBER(12)                      NOT NULL,
   EMAIL                VARCHAR2(30)                    NOT NULL,
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: COMPANIA                                              */
/*==============================================================*/
CREATE TABLE COMPANIA  (
   ID_COMPANIA          NUMBER(10)                      NOT NULL,
   NOMBRE               VARCHAR2(20)                    NOT NULL,
   DIRECCION            VARCHAR2(12)                    NOT NULL,
   TELEFONO             NUMBER(12)                      NOT NULL,
   CONSTRAINT PK_COMPANIA PRIMARY KEY (ID_COMPANIA)
);

/*==============================================================*/
/* Table: DESTINO                                               */
/*==============================================================*/
CREATE TABLE DESTINO  (
   ID_DESTINO           NUMBER(12)                      NOT NULL,
   AEROPUERTO           VARCHAR2(20)                    NOT NULL,
   CIUDAD               VARCHAR2(20)                    NOT NULL,
   COLUMN_4             CHAR(10),
   CONSTRAINT PK_DESTINO PRIMARY KEY (ID_DESTINO)
);

/*==============================================================*/
/* Table: ID_ORIGEN                                             */
/*==============================================================*/
CREATE TABLE ID_ORIGEN  (
   ID_ORIGEN            NUMBER(12)                      NOT NULL,
   AEROPUERTO           VARCHAR2(20)                    NOT NULL,
   CIUDAD               VARCHAR2(20)                    NOT NULL,
   CONSTRAINT PK_ID_ORIGEN PRIMARY KEY (ID_ORIGEN)
);

/*==============================================================*/
/* Table: ITINERARIO                                            */
/*==============================================================*/
CREATE TABLE ITINERARIO  (
   ID_ITINERARIO        NUMBER(12)                      NOT NULL,
   ID_ORIGEN            NUMBER(12)                      NOT NULL,
   ID_DESTINO           NUMBER(12)                      NOT NULL,
   HORA                 TIMESTAMP                       NOT NULL,
   FECHA                DATE                            NOT NULL,
   CONSTRAINT PK_ITINERARIO PRIMARY KEY (ID_ITINERARIO)
);

/*==============================================================*/
/* Table: PASAJES                                               */
/*==============================================================*/
CREATE TABLE PASAJES  (
   ID_PASAJES           NUMBER(12)                      NOT NULL,
   ID_CLIENTE           NUMBER(12)                      NOT NULL,
   ID_VUELO             NUMBER(10)                      NOT NULL,
   CLASE                VARCHAR2(12)                    NOT NULL,
   ASIENTO              VARCHAR2(10)                    NOT NULL,
   VALOR                INTEGER                         NOT NULL,
   CONSTRAINT PK_PASAJES PRIMARY KEY (ID_PASAJES)
);

/*==============================================================*/
/* Table: VUELO                                                 */
/*==============================================================*/
CREATE TABLE VUELO  (
   ID_VUELO             NUMBER(10)                      NOT NULL,
   ID_COMPANIA          NUMBER(10)                      NOT NULL,
   ID_ITINERARIO        NUMBER(12)                      NOT NULL,
   CAPACIDAD            NUMBER(10)                      NOT NULL,
   MODELO_AVION         VARCHAR2(50)                    NOT NULL,
   NUMERO_VUELO         VARCHAR2(50)                    NOT NULL,
   CONSTRAINT PK_VUELO PRIMARY KEY (ID_VUELO)
);

ALTER TABLE ITINERARIO
   ADD CONSTRAINT FK_ITINERAR_REFE_ID_ORIGE FOREIGN KEY (ID_ORIGEN)
      REFERENCES ID_ORIGEN (ID_ORIGEN);

ALTER TABLE ITINERARIO
   ADD CONSTRAINT FK_ITINERAR_REFE_DESTINO FOREIGN KEY (ID_DESTINO)
      REFERENCES DESTINO (ID_DESTINO);

ALTER TABLE PASAJES
   ADD CONSTRAINT FK_PASAJES_REFE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE PASAJES
   ADD CONSTRAINT FK_PASAJES_REFE_VUELO FOREIGN KEY (ID_VUELO)
      REFERENCES VUELO (ID_VUELO);

ALTER TABLE VUELO
   ADD CONSTRAINT FK_VUELO_REFE_COMPANIA FOREIGN KEY (ID_COMPANIA)
      REFERENCES COMPANIA (ID_COMPANIA);

ALTER TABLE VUELO
   ADD CONSTRAINT FK_VUELO_REFE_ITINERAR FOREIGN KEY (ID_ITINERARIO)
      REFERENCES ITINERARIO (ID_ITINERARIO);

