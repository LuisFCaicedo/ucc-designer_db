/*==============================================================*/
/* DBMS name:      ORACLE Version 10gR2                         */
/* Created on:     21/11/2023 1:45:04 a. m.                     */
/*==============================================================*/



-- TYPE PACKAGE DECLARATION
CREATE OR REPLACE PACKAGE PDTYPES  
AS
    TYPE REF_CURSOR IS REF CURSOR;
END;

-- INTEGRITY PACKAGE DECLARATION
CREATE OR REPLACE PACKAGE INTEGRITYPACKAGE AS
 PROCEDURE INITNESTLEVEL;
 FUNCTION GETNESTLEVEL RETURN NUMBER;
 PROCEDURE NEXTNESTLEVEL;
 PROCEDURE PREVIOUSNESTLEVEL;
 END INTEGRITYPACKAGE;
/

-- INTEGRITY PACKAGE DEFINITION
CREATE OR REPLACE PACKAGE BODY INTEGRITYPACKAGE AS
 NESTLEVEL NUMBER;

-- PROCEDURE TO INITIALIZE THE TRIGGER NEST LEVEL
 PROCEDURE INITNESTLEVEL IS
 BEGIN
 NESTLEVEL := 0;
 END;


-- FUNCTION TO RETURN THE TRIGGER NEST LEVEL
 FUNCTION GETNESTLEVEL RETURN NUMBER IS
 BEGIN
 IF NESTLEVEL IS NULL THEN
     NESTLEVEL := 0;
 END IF;
 RETURN(NESTLEVEL);
 END;

-- PROCEDURE TO INCREASE THE TRIGGER NEST LEVEL
 PROCEDURE NEXTNESTLEVEL IS
 BEGIN
 IF NESTLEVEL IS NULL THEN
     NESTLEVEL := 0;
 END IF;
 NESTLEVEL := NESTLEVEL + 1;
 END;

-- PROCEDURE TO DECREASE THE TRIGGER NEST LEVEL
 PROCEDURE PREVIOUSNESTLEVEL IS
 BEGIN
 NESTLEVEL := NESTLEVEL - 1;
 END;

 END INTEGRITYPACKAGE;
/


DROP TRIGGER TIB_TIPO_ATAQUES
/

DROP SEQUENCE SECUENCIA_ATAQUE
/

CREATE SEQUENCE SECUENCIA_ATAQUE
INCREMENT BY 1
START WITH 0
 NOMAXVALUE
 NOCACHE
ORDER
/

/*==============================================================*/
/* Table: ACTULIZACION                                          */
/*==============================================================*/
CREATE TABLE ACTULIZACION  (
   ID_ATUALIZACION      VARCHAR(4)                      NOT NULL,
   ID_EQUIPOS           VARCHAR(20),
   ID_SERVIDORES        NUMBER(10),
   NOMBRE               VARCHAR(15)                     NOT NULL,
   CONSTRAINT PK_ACTULIZACION PRIMARY KEY (ID_ATUALIZACION)
)
/

/*==============================================================*/
/* Table: ANTIVIRUS                                             */
/*==============================================================*/
CREATE TABLE ANTIVIRUS  (
   ID_ANTIVIRUS         VARCHAR(10)                     NOT NULL,
   ID_SERVICIOS         NUMERIC(10)                     NOT NULL,
   ID_EQUIPOS           VARCHAR(20)                     NOT NULL,
   ID_SERVIDORES        NUMBER(10)                      NOT NULL,
   NOMBRE               VARCHAR(20)                     NOT NULL,
   PARCHES_SEGURIDAD    VARCHAR(10)                     NOT NULL,
   CONSTRAINT PK_ANTIVIRUS PRIMARY KEY (ID_ANTIVIRUS)
)
/

/*==============================================================*/
/* Table: APLICACIONES                                          */
/*==============================================================*/
CREATE TABLE APLICACIONES  (
   ID_APLICACIONES      VARCHAR(10)                     NOT NULL,
   ID_VULNERABILIDAD    NUMBER(10)                      NOT NULL,
   ID_ATAQUES           NUMBER(0)                       NOT NULL,
   NOMBRE               VARCHAR(16)                     NOT NULL,
   CONSTRAINT PK_APLICACIONES PRIMARY KEY (ID_APLICACIONES)
)
/

/*==============================================================*/
/* Table: ATAQUES                                               */
/*==============================================================*/
CREATE TABLE ATAQUES  (
   ID_ATAQUES           VARCHAR(20)                     NOT NULL,
   ID_TIPO_ATAQUES      NUMBER(20)                      NOT NULL,
   ID_VULNERABILIDAD    NUMBER(10),
   NOMBRE               VARCHAR(23)                     NOT NULL,
   CONSTRAINT PK_ATAQUES PRIMARY KEY (ID_ATAQUES)
)
/

/*==============================================================*/
/* Table: EQUIPOS                                               */
/*==============================================================*/
CREATE TABLE EQUIPOS  (
   ID_EQUIPOS           VARCHAR(20)                     NOT NULL,
   ID_VULNERABILIDAD    NUMBER(10),
   NOMBRE               VARCHAR(20)                     NOT NULL,
   USUARIO              VARCHAR(20)                     NOT NULL,
   SISTEMA_OPERATIVO    VARCHAR(10)                     NOT NULL,
   IP_V4                VARCHAR(16)                     NOT NULL,
   CONSTRAINT PK_EQUIPOS PRIMARY KEY (ID_EQUIPOS)
)
/

/*==============================================================*/
/* Table: ESTADO_PUERTO                                         */
/*==============================================================*/
CREATE TABLE ESTADO_PUERTO  (
   ID_ESTADO_PUERTO     VARCHAR(10)                     NOT NULL,
   ID_EQUIPOS           NUMBER(10),
   ID_SERVIDORES        NUMBER(10),
   NOMBRE               VARCHAR(12)                     NOT NULL,
   CONSTRAINT PK_ESTADO_PUERTO PRIMARY KEY (ID_ESTADO_PUERTO)
)
/

/*==============================================================*/
/* Table: PUERTOS                                               */
/*==============================================================*/
CREATE TABLE PUERTOS  (
   ID_PUERTOS           NUMBER(50)                      NOT NULL,
   ID_ESTADO_PUERTO     NUMBER(10),
   ID_TIPO_PUERTO       NUMBER(10),
   ID_EQUIPOS           NUMBER(10),
   ID_SERVIDORES        NUMBER(10),
   NOMBRE               VARCHAR(20)                     NOT NULL,
   CONSTRAINT PK_PUERTOS PRIMARY KEY (ID_PUERTOS)
)
/

/*==============================================================*/
/* Table: SERVICIOS                                             */
/*==============================================================*/
CREATE TABLE SERVICIOS  (
   ID_SERVICIOS         NUMERIC(10)                     NOT NULL,
   NOMBRE               VARCHAR(10)                     NOT NULL,
   CONSTRAINT PK_SERVICIOS PRIMARY KEY (ID_SERVICIOS)
)
/

/*==============================================================*/
/* Table: SERVIDORES                                            */
/*==============================================================*/
CREATE TABLE SERVIDORES  (
   ID_SERVIDORES        NUMBER(10)                      NOT NULL,
   ID_VULNERABILIDAD    NUMBER(10),
   NOMBRE               VARCHAR(8)                      NOT NULL,
   IP                   VARCHAR(14)                     NOT NULL,
   CONSTRAINT PK_SERVIDORES PRIMARY KEY (ID_SERVIDORES)
)
/

/*==============================================================*/
/* Table: TIPO_ATAQUES                                          */
/*==============================================================*/
CREATE TABLE TIPO_ATAQUES  (
   ID_TIPO_ATAQUES      NUMBER(20)                      NOT NULL,
   NOMBRE               VARCHAR(100)                    NOT NULL,
   CONSTRAINT PK_TIPO_ATAQUES PRIMARY KEY (ID_TIPO_ATAQUES)
)
/

/*==============================================================*/
/* Table: TIPO_PUERTO                                           */
/*==============================================================*/
CREATE TABLE TIPO_PUERTO  (
   ID_TIPO_PUERTO       VARCHAR(10)                     NOT NULL,
   NOMBRE               VARCHAR(10)                     NOT NULL,
   CONSTRAINT PK_TIPO_PUERTO PRIMARY KEY (ID_TIPO_PUERTO)
)
/

/*==============================================================*/
/* Table: VULNERABILIDAD                                        */
/*==============================================================*/
CREATE TABLE VULNERABILIDAD  (
   ID_VULNERABILIDAD    VARCHAR(10)                     NOT NULL,
   DESCRPCION           VARCHAR(255)                    NOT NULL,
   IP_V4                VARCHAR(16)                     NOT NULL,
   CONSTRAINT PK_VULNERABILIDAD PRIMARY KEY (ID_VULNERABILIDAD)
)
/

ALTER TABLE ACTULIZACION
   ADD CONSTRAINT FK_ACTULIZA_REFE_EQUIPOS FOREIGN KEY (ID_EQUIPOS)
      REFERENCES EQUIPOS (ID_EQUIPOS)
/

ALTER TABLE ACTULIZACION
   ADD CONSTRAINT FK_ACTULIZA_REFE_SERVIDOR FOREIGN KEY (ID_SERVIDORES)
      REFERENCES SERVIDORES (ID_SERVIDORES)
/

ALTER TABLE ANTIVIRUS
   ADD CONSTRAINT FK_ANTIVIRU_REFE_EQUIPOS FOREIGN KEY (ID_EQUIPOS)
      REFERENCES EQUIPOS (ID_EQUIPOS)
/

ALTER TABLE ANTIVIRUS
   ADD CONSTRAINT FK_ANTIVIRU_REFE_SERVICIO FOREIGN KEY (ID_SERVICIOS)
      REFERENCES SERVICIOS (ID_SERVICIOS)
/

ALTER TABLE ANTIVIRUS
   ADD CONSTRAINT FK_ANTIVIRU_REFE_SERVIDOR FOREIGN KEY (ID_SERVIDORES)
      REFERENCES SERVIDORES (ID_SERVIDORES)
/

ALTER TABLE APLICACIONES
   ADD CONSTRAINT FK_APLICACI_REFE_ATAQUES FOREIGN KEY (ID_ATAQUES)
      REFERENCES ATAQUES (ID_ATAQUES)
/

ALTER TABLE APLICACIONES
   ADD CONSTRAINT FK_APLICACI_REFE_VULNERAB FOREIGN KEY (ID_VULNERABILIDAD)
      REFERENCES VULNERABILIDAD (ID_VULNERABILIDAD)
/

ALTER TABLE ATAQUES
   ADD CONSTRAINT FK_ATAQUES_REFE_TIPO_ATA FOREIGN KEY (ID_TIPO_ATAQUES)
      REFERENCES TIPO_ATAQUES (ID_TIPO_ATAQUES)
/

ALTER TABLE ATAQUES
   ADD CONSTRAINT FK_ATAQUES_REFERENCE_VULNERAB FOREIGN KEY (ID_VULNERABILIDAD)
      REFERENCES VULNERABILIDAD (ID_VULNERABILIDAD)
/

ALTER TABLE EQUIPOS
   ADD CONSTRAINT FK_EQUIPOS_REFE_VULNERAB FOREIGN KEY (ID_VULNERABILIDAD)
      REFERENCES VULNERABILIDAD (ID_VULNERABILIDAD)
/

ALTER TABLE ESTADO_PUERTO
   ADD CONSTRAINT FK_ESTADO_P_REFE_EQUIPOS FOREIGN KEY (ID_EQUIPOS)
      REFERENCES EQUIPOS (ID_EQUIPOS)
/

ALTER TABLE ESTADO_PUERTO
   ADD CONSTRAINT FK_ESTADO_P_REFE_SERVIDOR FOREIGN KEY (ID_SERVIDORES)
      REFERENCES SERVIDORES (ID_SERVIDORES)
/

ALTER TABLE PUERTOS
   ADD CONSTRAINT FK_PUERTOS_REFE_EQUIPOS FOREIGN KEY (ID_EQUIPOS)
      REFERENCES EQUIPOS (ID_EQUIPOS)
/

ALTER TABLE PUERTOS
   ADD CONSTRAINT FK_PUERTOS_REFE_ESTADO_P FOREIGN KEY (ID_ESTADO_PUERTO)
      REFERENCES ESTADO_PUERTO (ID_ESTADO_PUERTO)
/

ALTER TABLE PUERTOS
   ADD CONSTRAINT FK_PUERTOS_REFE_SERVIDOR FOREIGN KEY (ID_SERVIDORES)
      REFERENCES SERVIDORES (ID_SERVIDORES)
/

ALTER TABLE PUERTOS
   ADD CONSTRAINT FK_PUERTOS_REFE_TIPO_PUE FOREIGN KEY (ID_TIPO_PUERTO)
      REFERENCES TIPO_PUERTO (ID_TIPO_PUERTO)
/

ALTER TABLE SERVIDORES
   ADD CONSTRAINT FK_SERVIDOR_REFE_VULNERAB FOREIGN KEY (ID_VULNERABILIDAD)
      REFERENCES VULNERABILIDAD (ID_VULNERABILIDAD)
/


CREATE TRIGGER TIB_TIPO_ATAQUES BEFORE INSERT
ON TIPO_ATAQUES FOR EACH ROW
DECLARE
    INTEGRITY_ERROR  EXCEPTION;
    ERRNO            INTEGER;
    ERRMSG           CHAR(200);
    DUMMY            INTEGER;
    FOUND            BOOLEAN;

BEGIN
    --  COLUMN "ID_TIPO_ATAQUES" USES SEQUENCE SECUENCIA_ATAQUE
    SELECT SECUENCIA_ATAQUE.NEXTVAL INTO :NEW.ID_TIPO_ATAQUES FROM DUAL;

--  ERRORS HANDLING
EXCEPTION
    WHEN INTEGRITY_ERROR THEN
       RAISE_APPLICATION_ERROR(ERRNO, ERRMSG);
END;
/

