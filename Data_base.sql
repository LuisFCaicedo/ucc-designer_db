/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     11/10/2023 8:03:35 p. m.                     */
/*==============================================================*/


ALTER TABLE CUENTA_LOGS
   DROP CONSTRAINT FK_CUENTA_LOG_REF_CUENTA;

DROP TABLE CUENTA CASCADE CONSTRAINTS;

DROP TABLE CUENTA_LOGS CASCADE CONSTRAINTS;

/*==============================================================*/
/* Table: CUENTA                                                */
/*==============================================================*/
CREATE TABLE CUENTA  (
   ID_CLIENTE           NUMBER(10)                      NOT NULL,
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
   CUANTA_ID            NUMBER(10)                      NOT NULL,
   FECHA_HORA           TIMESTAMP WITH TIME ZONE,
   FECHA_REGISTRO       TIMESTAMP WITH TIME ZONE        NOT NULL,
   FECHA_ACTUALIZACION  TIMESTAMP WITH TIME ZONE,
   SALDO                DECIMAL(15, 2)                  NOT NULL,
   USUARIO              VARCHAR(10),
   IP                   VARCHAR(15),
   CONSTRAINT PK_CUENTA_LOGS PRIMARY KEY (ID)
);

ALTER TABLE CUENTA_LOGS
   ADD CONSTRAINT FK_CUENTA_LOG_REF_CUENTA FOREIGN KEY (CUANTA_ID)
      REFERENCES CUENTA (ID_CLIENTE);

