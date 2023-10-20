/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     19/10/2023 11:11:55 p. m.                    */
/*==============================================================*/


ALTER TABLE CLIENTE
   DROP CONSTRAINT FK_CLIENTE_REF_TIPO;

ALTER TABLE CUENTA
   DROP CONSTRAINT FK_CUENTA_REFE_CLIENTE;

ALTER TABLE CUENTA_LOGS
   DROP CONSTRAINT FK_CUENTA_LOG_REF_CUENTA;

ALTER TABLE DIRECCIONES
   DROP CONSTRAINT FK_DIRECCIO_REF_CLIENTE;

ALTER TABLE EMAIL
   DROP CONSTRAINT FK_EMAIL_REF_CLIENTE;

ALTER TABLE TELEFONOS
   DROP CONSTRAINT FK_TELEFONO_REF_CLIENTE;

ALTER TABLE TELEFONOS
   DROP CONSTRAINT FK_TELEFONO_REF_TIPO_TEL;

DROP TABLE CLIENTE CASCADE CONSTRAINTS;

DROP TABLE CUENTA CASCADE CONSTRAINTS;

DROP TABLE CUENTA_LOGS CASCADE CONSTRAINTS;

DROP TABLE DIRECCIONES CASCADE CONSTRAINTS;

DROP TABLE EMAIL CASCADE CONSTRAINTS;

DROP TABLE TELEFONOS CASCADE CONSTRAINTS;

DROP TABLE TIPO_CLIENTE CASCADE CONSTRAINTS;

DROP TABLE TIPO_TELEFONOS CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE  (
   ID_CLIENTE           NUMBER(10)                      NOT NULL,
   ID_TIPO_CLIENTE      VARCHAR(2)                      NOT NULL,
   NOMBRE               VARCHAR(40),
   COLUMN_4             VARCHAR(40),
   CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
CREATE TABLE CUENTA  (
   ID_CLIENTE           NUMBER(10)                      NOT NULL,
   CLI_ID_CLIENTE       NUMBER(10),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(15, 2),
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15),
   CONSTRAINT PK_CUENTA PRIMARY KEY (ID_CLIENTE)
);

/*==============================================================*/
/* Table: CUENTA_LOGS                                           */
/*==============================================================*/
CREATE TABLE CUENTA_LOGS  (
   ID                   NUMBER(20)                      NOT NULL,
   CUANTA_ID            NUMBER(10),
   FECHA_HORA           TIMESTAMP WITH TIME ZONE,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(15, 2)                  NOT NULL,
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15),
   CONSTRAINT PK_CUENTA_LOGS PRIMARY KEY (ID)
);

/*==============================================================*/
/* Table: DIRECCIONES                                           */
/*==============================================================*/
CREATE TABLE DIRECCIONES  (
   ID_DIRECCCIONES      NUMBER(10)                      NOT NULL,
   ID_CLIENTE           NUMBER(10),
   CONSTRAINT PK_DIRECCIONES PRIMARY KEY (ID_DIRECCCIONES)
);

/*==============================================================*/
/* Table: EMAIL                                                 */
/*==============================================================*/
CREATE TABLE EMAIL  (
   ID_EMAIL             NUMBER(10)                      NOT NULL,
   ID_CLIENTE           NUMBER(10),
   CONSTRAINT PK_EMAIL PRIMARY KEY (ID_EMAIL)
);

/*==============================================================*/
/* Table: TELEFONOS                                             */
/*==============================================================*/
CREATE TABLE TELEFONOS  (
   ID_TELEFONO          NUMBER(10)                      NOT NULL,
   ID_CLIENTE           NUMBER(10),
   ID_TIPO_TELEFONOS    VARCHAR(10),
   CONSTRAINT PK_TELEFONOS PRIMARY KEY (ID_TELEFONO)
);

/*==============================================================*/
/* Table: TIPO_CLIENTE                                          */
/*==============================================================*/
CREATE TABLE TIPO_CLIENTE  (
   ID_TIPO_CLIENTE      VARCHAR(2)                      NOT NULL,
   CONSTRAINT PK_TIPO_CLIENTE PRIMARY KEY (ID_TIPO_CLIENTE)
);

/*==============================================================*/
/* Table: TIPO_TELEFONOS                                        */
/*==============================================================*/
CREATE TABLE TIPO_TELEFONOS  (
   ID_TIPO_TELEFONOS    VARCHAR(10)                     NOT NULL,
   CONSTRAINT PK_TIPO_TELEFONOS PRIMARY KEY (ID_TIPO_TELEFONOS)
);

ALTER TABLE CLIENTE
   ADD CONSTRAINT FK_CLIENTE_REF_TIPO FOREIGN KEY (ID_TIPO_CLIENTE)
      REFERENCES TIPO_CLIENTE (ID_TIPO_CLIENTE);

ALTER TABLE CUENTA
   ADD CONSTRAINT FK_CUENTA_REFE_CLIENTE FOREIGN KEY (CLI_ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE CUENTA_LOGS
   ADD CONSTRAINT FK_CUENTA_LOG_REF_CUENTA FOREIGN KEY (CUANTA_ID)
      REFERENCES CUENTA (ID_CLIENTE);

ALTER TABLE DIRECCIONES
   ADD CONSTRAINT FK_DIRECCIO_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE EMAIL
   ADD CONSTRAINT FK_EMAIL_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE TELEFONOS
   ADD CONSTRAINT FK_TELEFONO_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE TELEFONOS
   ADD CONSTRAINT FK_TELEFONO_REF_TIPO_TEL FOREIGN KEY (ID_TIPO_TELEFONOS)
      REFERENCES TIPO_TELEFONOS (ID_TIPO_TELEFONOS);

