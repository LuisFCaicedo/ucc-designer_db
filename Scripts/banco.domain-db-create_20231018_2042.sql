/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     18/10/2023 8:43:01 p. m.                     */
/*==============================================================*/


/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
CREATE TABLE CLIENTE  (
   ID_CLIENTE           NUMBER(10)                      NOT NULL,
   ID_TIPO_CLIENTE      VARCHAR(2)                      NOT NULL,
   NOMBRE               VARCHAR(40)                     NOT NULL,
   APELLIDOS            VARCHAR(40)                     NOT NULL
);

ALTER TABLE CLIENTE
   ADD CONSTRAINT PK_CLIENTE PRIMARY KEY (ID_CLIENTE);

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
CREATE TABLE CUENTA  (
   ID                   NUMERIC(10)                     NOT NULL,
   ID_CLIENTE           NUMBER(10),
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACIO   TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(12, 2)                  NOT NULL,
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15)
);

ALTER TABLE CUENTA
   ADD CONSTRAINT PK_CUENTA PRIMARY KEY (ID);

/*==============================================================*/
/* Table: CUENTA_LOGS                                           */
/*==============================================================*/
CREATE TABLE CUENTA_LOGS  (
   ID                   NUMERIC(20)                     NOT NULL,
   FECHA_HORA           TIMESTAMP WITH TIME ZONE,
   CUENTA_ID            NUMERIC(10)                     NOT NULL,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACIO   TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(12, 2)                  NOT NULL,
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15)
);

ALTER TABLE CUENTA_LOGS
   ADD CONSTRAINT PK_CUENTA_LOGS PRIMARY KEY (ID);

/*==============================================================*/
/* Table: DIRECCIONES                                           */
/*==============================================================*/
CREATE TABLE DIRECCIONES  (
   ID_DIRECCION         NUMBER(10)                      NOT NULL,
   ID_CLIENTE           NUMBER(10)                      NOT NULL
);

ALTER TABLE DIRECCIONES
   ADD CONSTRAINT PK_DIRECCIONES PRIMARY KEY (ID_DIRECCION);

/*==============================================================*/
/* Table: EMAILS                                                */
/*==============================================================*/
CREATE TABLE EMAILS  (
   ID_EMAIL             NUMBER(10)                      NOT NULL,
   ID_CLIENTE           NUMBER(10)                      NOT NULL,
   EMAIL                VARCHAR(50)                     NOT NULL
);

ALTER TABLE EMAILS
   ADD CONSTRAINT PK_EMAILS PRIMARY KEY (ID_EMAIL);

/*==============================================================*/
/* Table: TELEFONOS                                             */
/*==============================================================*/
CREATE TABLE TELEFONOS  (
   ID_TELEFONO          NUMBER(10)                      NOT NULL,
   ID_CLIENTE           NUMBER(10)                      NOT NULL,
   ID_TIPO_TELEFONO     VARCHAR(2)                      NOT NULL,
   TELEFONO             VARCHAR(20)                     NOT NULL
);

ALTER TABLE TELEFONOS
   ADD CONSTRAINT PK_TELEFONOS PRIMARY KEY (ID_TELEFONO);

/*==============================================================*/
/* Table: TIPO_CLIENTE                                          */
/*==============================================================*/
CREATE TABLE TIPO_CLIENTE  (
   ID_TIPO_CLIENTE      VARCHAR(2)                      NOT NULL,
   NOMBRE               VARCHAR(20)                     NOT NULL
);

ALTER TABLE TIPO_CLIENTE
   ADD CONSTRAINT PK_TIPO_CLIENTE PRIMARY KEY (ID_TIPO_CLIENTE);

/*==============================================================*/
/* Table: TIPO_TELEFONO                                         */
/*==============================================================*/
CREATE TABLE TIPO_TELEFONO  (
   ID_TIPO_TELEFONO     VARCHAR(2)                      NOT NULL,
   NOMBRE               VARCHAR(20)                     NOT NULL
);

ALTER TABLE TIPO_TELEFONO
   ADD CONSTRAINT PK_TIPO_TELEFONO PRIMARY KEY (ID_TIPO_TELEFONO);

ALTER TABLE CLIENTE
   ADD CONSTRAINT FK_CLIENTE_REF_TIPO_CLIENTE FOREIGN KEY (ID_TIPO_CLIENTE)
      REFERENCES TIPO_CLIENTE (ID_TIPO_CLIENTE);

ALTER TABLE CUENTA
   ADD CONSTRAINT FK_CUENTA_REFERENCE_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE CUENTA_LOGS
   ADD CONSTRAINT FK_CUENTA_LOGS_REF_CUENTA FOREIGN KEY (CUENTA_ID)
      REFERENCES CUENTA (ID);

ALTER TABLE DIRECCIONES
   ADD CONSTRAINT FK_DIRECCION_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE EMAILS
   ADD CONSTRAINT FK_EMAILS_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE TELEFONOS
   ADD CONSTRAINT FK_TELEFONO_REF_CLIENTE FOREIGN KEY (ID_CLIENTE)
      REFERENCES CLIENTE (ID_CLIENTE);

ALTER TABLE TELEFONOS
   ADD CONSTRAINT FK_TELEFONO_REF_TIPO_TEL FOREIGN KEY (ID_TIPO_TELEFONO)
      REFERENCES TIPO_TELEFONO (ID_TIPO_TELEFONO);

