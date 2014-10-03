--------------------------------------------------------
-- Archivo creado  - miércoles-octubre-01-2014   
--------------------------------------------------------
DROP TABLE "CLIENTE_TEL" cascade constraints;
DROP TABLE "SDA_AGREGADORES" cascade constraints;
DROP TABLE "SDA_CAT_RESPUESTAS" cascade constraints;
DROP TABLE "SDA_LOG_DEPURACION" cascade constraints;
DROP TABLE "SDA_METODOS" cascade constraints;
DROP TABLE "SDA_PAISES" cascade constraints;
DROP TABLE "SDA_PARAMETROS" cascade constraints;
DROP TABLE "SDA_PARAMETROS_SISTEMA" cascade constraints;
DROP TABLE "SDA_RESPUESTAS" cascade constraints;
DROP TABLE "SDA_RESULTADOS_RESPUESTA" cascade constraints;
DROP TABLE "SDA_USUARIO_SISTEMA" cascade constraints;
DROP SEQUENCE "SQ_SDA_AGREGADORES";
DROP SEQUENCE "SQ_SDA_CAT_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_DEPURACION_LOG";
DROP SEQUENCE "SQ_SDA_LOG_DEPURACION";
DROP SEQUENCE "SQ_SDA_METODOS";
DROP SEQUENCE "SQ_SDA_PAIS";
DROP SEQUENCE "SQ_SDA_PARAMETROS";
DROP SEQUENCE "SQ_SDA_PARAMETROS_SISTEMA";
DROP SEQUENCE "SQ_SDA_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_RESULTADO_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_USUARIO_SISTEMA";
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_AGREGADORES
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_AGREGADORES"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 49 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_CAT_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_CAT_RESPUESTAS"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 7 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_DEPURACION_LOG
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_DEPURACION_LOG"  MINVALUE 1 MAXVALUE 100000000 INCREMENT BY 1 START WITH 17 NOCACHE  ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_LOG_DEPURACION
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_LOG_DEPURACION"  MINVALUE 1 MAXVALUE 100000000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_METODOS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_METODOS"  MINVALUE 1 MAXVALUE 500000 INCREMENT BY 1 START WITH 138 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PAIS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PAIS"  MINVALUE 1 MAXVALUE 300 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PARAMETROS"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 375 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PARAMETROS_SISTEMA"  MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESPUESTAS"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 115 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESULTADO_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESULTADO_RESPUESTAS"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 164 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_USUARIO_SISTEMA
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_USUARIO_SISTEMA"  MINVALUE 2 MAXVALUE 10000 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CLIENTE_TEL
--------------------------------------------------------

  CREATE TABLE "CLIENTE_TEL" 
   (	"ID" NUMBER, 
	"NUMERO" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Table SDA_AGREGADORES
--------------------------------------------------------

  CREATE TABLE "SDA_AGREGADORES" 
   (	"ID" NUMBER, 
	"NOMBRE_AGREGADOR" VARCHAR2(255), 
	"ESTADO" NUMBER, 
	"ID_PAIS" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_AGREGADORES"."ID" IS 'pk de la tabla SDA_AGREGADORES';
 
   COMMENT ON COLUMN "SDA_AGREGADORES"."NOMBRE_AGREGADOR" IS 'El nombre del agregador';
 
   COMMENT ON COLUMN "SDA_AGREGADORES"."ESTADO" IS 'El estado del agregador';
 
   COMMENT ON COLUMN "SDA_AGREGADORES"."ID_PAIS" IS 'fk con la tabla paises del agregador';
--------------------------------------------------------
--  DDL for Table SDA_CAT_RESPUESTAS
--------------------------------------------------------

  CREATE TABLE "SDA_CAT_RESPUESTAS" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  CREATE TABLE "SDA_LOG_DEPURACION" 
   (	"ID" NUMBER, 
	"SUSCRIPTOR" VARCHAR2(50), 
	"RESPUESTA" CLOB, 
	"ENVIO" CLOB, 
	"ESTADO_TRANSACCION" VARCHAR2(255), 
	"FECHA_TRANSACCION" TIMESTAMP (6), 
	"TIPO_TRANSACCION" VARCHAR2(50), 
	"ID_METODO" NUMBER, 
	"ID_USUARIO_SISTEMA" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" 
 LOB ("RESPUESTA") STORE AS BASICFILE (
  TABLESPACE "AGREGADOR" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) 
 LOB ("ENVIO") STORE AS BASICFILE (
  TABLESPACE "AGREGADOR" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
 

   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID" IS 'pk de la tabla de SDA_LOG_DEPURACION';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."SUSCRIPTOR" IS 'numero de telefono que se desea depurar';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."RESPUESTA" IS 'respuesta obtenida al invocar al metodo web del servicio de los agregadores';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ENVIO" IS 'archivo enviado al servicio de los agregadores';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ESTADO_TRANSACCION" IS 'estado de la depuracion la cual sera mostrada en el reporte';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."FECHA_TRANSACCION" IS 'Fecha en la que fue ejecutado la depuracion';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."TIPO_TRANSACCION" IS 'Tipo de depuracion ARCHIVO MASIVA UNITARIA';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID_METODO" IS 'FK con la tabla de SDA_METODOS';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID_USUARIO_SISTEMA" IS 'FK con la tabla de SDA_USUARIO_SISTEMA';
--------------------------------------------------------
--  DDL for Table SDA_METODOS
--------------------------------------------------------

  CREATE TABLE "SDA_METODOS" 
   (	"ID" NUMBER, 
	"ID_AGREGADOR" NUMBER, 
	"METODO" NUMBER, 
	"USUARIO" VARCHAR2(255), 
	"CONTRASENIA" VARCHAR2(255), 
	"END_POINT" VARCHAR2(1000), 
	"SEGURIDAD" NUMBER, 
	"INPUTMESSAGETEXT" VARCHAR2(4000), 
	"INPUTMESSAGENAME" VARCHAR2(255), 
	"SERVICE_NAME" VARCHAR2(20), 
	"SOAPACTIONURI" VARCHAR2(255), 
	"NAMESPACEURI" VARCHAR2(255), 
	"STYLE" VARCHAR2(255), 
	"TARGETMETHODNAME" VARCHAR2(255), 
	"TARGETOBJECTURI" VARCHAR2(255), 
	"TARGETURL" VARCHAR2(255), 
	"WSDL_AGREGADOR" VARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_METODOS"."ID" IS 'pk de la tabla metodos de los servicios web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."ID_AGREGADOR" IS 'fk relacion con la tabla de agregadores de los servicios web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."METODO" IS 'el id del tipo metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."USUARIO" IS 'USUARIO del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."CONTRASENIA" IS 'CONTRASENIA del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."END_POINT" IS 'END_POINT del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."SEGURIDAD" IS 'SEGURIDAD significa si saldra por el puerto de http o por el puerto del https el metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."INPUTMESSAGETEXT" IS 'el cuerpo del mensaje del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."INPUTMESSAGENAME" IS 'el nombre del mensaje de envio del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."SERVICE_NAME" IS 'nombre del servicioque contiene el metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."SOAPACTIONURI" IS 'SOAPACTIONURI dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."NAMESPACEURI" IS 'NAMESPACEURI dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."STYLE" IS 'STYLE dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."TARGETMETHODNAME" IS 'TARGETMETHODNAME dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."TARGETOBJECTURI" IS 'TARGETOBJECTURI dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."TARGETURL" IS 'TARGETURL dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."WSDL_AGREGADOR" IS 'WSDL_AGREGADOR dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
--------------------------------------------------------
--  DDL for Table SDA_PAISES
--------------------------------------------------------

  CREATE TABLE "SDA_PAISES" 
   (	"ID" NUMBER, 
	"PAIS" VARCHAR2(100), 
	"CODIGO" VARCHAR2(10), 
	"STATUS" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_PAISES"."ID" IS 'pk de la tabla SDA_PAISES de donde sera ejecutado el agregador';
 
   COMMENT ON COLUMN "SDA_PAISES"."PAIS" IS 'El nombre del pais de donde sera ejecutado en agregador';
 
   COMMENT ON COLUMN "SDA_PAISES"."CODIGO" IS 'El codigo de pais de donde sera ejecutado en agregador';
 
   COMMENT ON COLUMN "SDA_PAISES"."STATUS" IS 'El estado del pais de donde sera ejecutado en agregador';
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS" 
   (	"ID" NUMBER, 
	"NOMBRE" VARCHAR2(255), 
	"ID_METODO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_PARAMETROS"."ID" IS 'pk de la tabla de SDA_PARAMETROS';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."NOMBRE" IS 'nombre del parametro a enviar en el servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."ID_METODO" IS 'fk con la tabla de metodos';
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS_SISTEMA" 
   (	"ID" NUMBER, 
	"KEY" VARCHAR2(255), 
	"VALUE" VARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."ID" IS 'pk de la tabla de SDA_PARAMETROS_SISTEMA';
 
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."KEY" IS 'nombre del parametro que sera utilizado dentro del sistema';
 
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."VALUE" IS 'valor del parametro que sera utilizado dentro del sistema';
--------------------------------------------------------
--  DDL for Table SDA_RESPUESTAS
--------------------------------------------------------

  CREATE TABLE "SDA_RESPUESTAS" 
   (	"ID" NUMBER, 
	"ID_METODO" NUMBER, 
	"ID_RESPUESTA" NUMBER, 
	"NOMBRE" VARCHAR2(255)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID" IS 'pk de la tabla de SDA_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID_METODO" IS 'fk con la tabla de metodos';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID_RESPUESTA" IS 'fk con la descripcion del catalogo de respuesta';
--------------------------------------------------------
--  DDL for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  CREATE TABLE "SDA_RESULTADOS_RESPUESTA" 
   (	"ID" NUMBER, 
	"ID_RESPUESTA" NUMBER, 
	"VALOR" VARCHAR2(255), 
	"DATO" VARCHAR2(20)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID" IS 'pk de la tabla de SDA_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID_RESPUESTA" IS 'fk con la tabla de respuestas';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."VALOR" IS 'el VALOR que se considerara con el dato que se espera retorne en la respuesta';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."DATO" IS 'el dato que se espera retorne en la respuesta';
--------------------------------------------------------
--  DDL for Table SDA_USUARIO_SISTEMA
--------------------------------------------------------

  CREATE TABLE "SDA_USUARIO_SISTEMA" 
   (	"ID" NUMBER, 
	"USUARIO" VARCHAR2(255), 
	"CONTRASENIA" VARCHAR2(255), 
	"ESTADO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
 

   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."ID" IS 'pk de la tabla de SDA_USUARIO_SISTEMA';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."USUARIO" IS 'nombre del usuario con permisos de entrar al sistema';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."CONTRASENIA" IS 'contrasenia del usuario con permisos de entrar al sistema';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."ESTADO" IS 'estado del usuario con permisos de entrar al sistema';
REM INSERTING into CLIENTE_TEL
SET DEFINE OFF;
Insert into CLIENTE_TEL (ID,NUMERO) values (1,'50370001635');
Insert into CLIENTE_TEL (ID,NUMERO) values (2,'50370001639');
Insert into CLIENTE_TEL (ID,NUMERO) values (3,'50370001647');
Insert into CLIENTE_TEL (ID,NUMERO) values (4,'50370001650');
Insert into CLIENTE_TEL (ID,NUMERO) values (5,'50370001659');
Insert into CLIENTE_TEL (ID,NUMERO) values (6,'50370001660');
Insert into CLIENTE_TEL (ID,NUMERO) values (7,'50255846245');
Insert into CLIENTE_TEL (ID,NUMERO) values (8,'50247166159');
Insert into CLIENTE_TEL (ID,NUMERO) values (9,'50242155220');
Insert into CLIENTE_TEL (ID,NUMERO) values (10,'50242435799');
Insert into CLIENTE_TEL (ID,NUMERO) values (11,'50242107214');
Insert into CLIENTE_TEL (ID,NUMERO) values (12,'50247009375');
Insert into CLIENTE_TEL (ID,NUMERO) values (13,'50370001661');
Insert into CLIENTE_TEL (ID,NUMERO) values (14,'50370001665');
Insert into CLIENTE_TEL (ID,NUMERO) values (15,'50370001671');
Insert into CLIENTE_TEL (ID,NUMERO) values (16,'50370001678');
Insert into CLIENTE_TEL (ID,NUMERO) values (17,'50370001679');
Insert into CLIENTE_TEL (ID,NUMERO) values (18,'50370001682');
Insert into CLIENTE_TEL (ID,NUMERO) values (19,'50370001690');
Insert into CLIENTE_TEL (ID,NUMERO) values (20,'50370001701');
Insert into CLIENTE_TEL (ID,NUMERO) values (21,'50370001708');
Insert into CLIENTE_TEL (ID,NUMERO) values (22,'50370001712');
Insert into CLIENTE_TEL (ID,NUMERO) values (23,'50370001720');
Insert into CLIENTE_TEL (ID,NUMERO) values (24,'50370001730');
Insert into CLIENTE_TEL (ID,NUMERO) values (25,'50370001742');
Insert into CLIENTE_TEL (ID,NUMERO) values (26,'50370001748');
Insert into CLIENTE_TEL (ID,NUMERO) values (27,'50370001761');
Insert into CLIENTE_TEL (ID,NUMERO) values (28,'50370001762');
Insert into CLIENTE_TEL (ID,NUMERO) values (29,'50370001764');
Insert into CLIENTE_TEL (ID,NUMERO) values (30,'50370001770');
Insert into CLIENTE_TEL (ID,NUMERO) values (31,'50370001773');
Insert into CLIENTE_TEL (ID,NUMERO) values (32,'50370001777');
Insert into CLIENTE_TEL (ID,NUMERO) values (33,'50370001784');
Insert into CLIENTE_TEL (ID,NUMERO) values (34,'50370001787');
Insert into CLIENTE_TEL (ID,NUMERO) values (35,'50370001788');
Insert into CLIENTE_TEL (ID,NUMERO) values (36,'50370001790');
Insert into CLIENTE_TEL (ID,NUMERO) values (37,'50370001795');
Insert into CLIENTE_TEL (ID,NUMERO) values (38,'50370001837');
Insert into CLIENTE_TEL (ID,NUMERO) values (39,'50370001839');
Insert into CLIENTE_TEL (ID,NUMERO) values (40,'50370001841');
Insert into CLIENTE_TEL (ID,NUMERO) values (41,'50370001844');
Insert into CLIENTE_TEL (ID,NUMERO) values (42,'50370001864');
Insert into CLIENTE_TEL (ID,NUMERO) values (43,'50370001865');
Insert into CLIENTE_TEL (ID,NUMERO) values (44,'50370001868');
Insert into CLIENTE_TEL (ID,NUMERO) values (45,'50370001872');
Insert into CLIENTE_TEL (ID,NUMERO) values (47,'50370001875');
Insert into CLIENTE_TEL (ID,NUMERO) values (48,'50370001877');
Insert into CLIENTE_TEL (ID,NUMERO) values (49,'50370001878');
Insert into CLIENTE_TEL (ID,NUMERO) values (50,'50370001882');
Insert into CLIENTE_TEL (ID,NUMERO) values (51,'50370001883');
Insert into CLIENTE_TEL (ID,NUMERO) values (52,'50370001884');
Insert into CLIENTE_TEL (ID,NUMERO) values (53,'50370001887');
Insert into CLIENTE_TEL (ID,NUMERO) values (54,'50258260744');
REM INSERTING into SDA_AGREGADORES
SET DEFINE OFF;
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (1,'MOBILE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (2,'CONTENTAMOBILE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (3,'TELEVIDA',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (4,'P MOBILE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (5,'WIRELES IDEA',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (6,'WAU',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (7,'TECH4MOBILE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (8,'ESTRATEGIAS MOVILES',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (9,'ZED',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (10,'BINBIT',1,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (11,'TIMWE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (12,'OPRATEL',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (13,'MOVIXLA',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (14,'GRUPO M',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (15,'XURPAS',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (16,'SMS AMERICAS',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (17,'WORLD2 MOBILE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (18,'INTERACEL',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (19,'CRONOS',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (20,'PINGSA',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (21,'NUESTRO DIARIO',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (22,'BIZNET (CELUMANIX)',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (23,'VAS LATIN',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (24,'NEOMOBILE',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (25,'NARANYA',0,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (26,'SMT',1,1);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (27,'BINBIT',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (28,'BITWORKS',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (29,'BIZNET (CELUMANIX)',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (30,'CONTENTAMOBILE',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (31,'CLARO FANATICOS',0,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (32,'CRONOS',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (33,'ESTRATEGIAS MOVILES',0,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (34,'GRUPO M',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (35,'MOBILE',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (36,'MOVIXLA',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (37,'OPRATEL',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (38,'SILVER SOLUTIONS',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (39,'SMS AMERICAS',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (40,'TEAM SOURCING',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (41,'TELEVIDA',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (42,'TIMWE',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (43,'VAS LATIN',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (47,'XURPAS',0,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (45,'WAU',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (46,'WIRELES IDEA',1,2);
Insert into SDA_AGREGADORES (ID,NOMBRE_AGREGADOR,ESTADO,ID_PAIS) values (48,'ZED',1,2);
REM INSERTING into SDA_CAT_RESPUESTAS
SET DEFINE OFF;
Insert into SDA_CAT_RESPUESTAS (ID,NOMBRE) values (1,'item');
Insert into SDA_CAT_RESPUESTAS (ID,NOMBRE) values (2,'ns1:resultCode');
Insert into SDA_CAT_RESPUESTAS (ID,NOMBRE) values (3,'Resp');
Insert into SDA_CAT_RESPUESTAS (ID,NOMBRE) values (4,'Value');
Insert into SDA_CAT_RESPUESTAS (ID,NOMBRE) values (5,'Return');
Insert into SDA_CAT_RESPUESTAS (ID,NOMBRE) values (6,'string');
REM INSERTING into SDA_LOG_DEPURACION
SET DEFINE OFF;
REM INSERTING into SDA_METODOS
SET DEFINE OFF;
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (25,13,2,null,'m75v21x06','http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wss:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wss:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (26,13,3,null,'m75v21x06','http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wss:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wss:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (27,21,1,null,'$$CLAR0GTND','http://76.12.24.124/php_ws/ws_nd.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:server"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><password xsi:type="xsd:string">_*pass_*</password></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (28,21,2,null,'$$CLAR0GTND','http://76.12.24.124/php_ws/ws_nd.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:server"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><password xsi:type="xsd:string">_*pass_*</password></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (29,21,3,null,'$$CLAR0GTND','http://76.12.24.124/php_ws/ws_nd.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:server"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><password xsi:type="xsd:string">_*pass_*</password></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (30,12,1,null,'cl4r0gu4t3m4l4','http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope> ',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (31,12,2,null,'cl4r0gu4t3m4l4','http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (32,12,3,null,'cl4r0gu4t3m4l4','http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (34,20,1,null,')866k7@7K[Y*WGO','http://api.pingsa.com/clarogt/webService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></soapenv:Body></soapenv:Envelope>',null,null,'soapenv:Body',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (35,20,2,null,')866k7@7K[Y*WGO','http://api.pingsa.com/clarogt/webService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></soapenv:Body></soapenv:Envelope>',null,null,'soapenv:Body',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (36,20,3,null,')866k7@7K[Y*WGO','http://api.pingsa.com/clarogt/webService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></soapenv:Body></soapenv:Envelope>',null,null,'soapenv:Body',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (37,16,1,null,'cl4r0_g04t3m4l4','http://reports.smsamericas.net/ws_claro/Service.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></sms:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'sms:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (38,16,2,null,'cl4r0_g04t3m4l4','http://reports.smsamericas.net/ws_claro/Service.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></sms:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'sms:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (40,7,1,null,'wssrvasocs','http://www.tech4mobile.com/WS_ServiciosAsociados/Service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (41,7,2,null,'wssrvasocs','http://www.tech4mobile.com/WS_ServiciosAsociados/Service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (42,7,3,null,'wssrvasocs','http://www.tech4mobile.com/WS_ServiciosAsociados/Service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (43,3,1,null,'Pa55w0rd','http://190.111.8.113/appclaro/webService/appclaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (44,3,2,null,'Pa55w0rd','http://190.111.8.113/appclaro/webService/appclaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>	',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (45,3,3,null,'Pa55w0rd','http://190.111.8.113/appclaro/webService/appclaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (46,11,1,null,'guaclaro1','http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'clar:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (47,11,2,null,'guaclaro1','http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (48,11,3,null,'guaclaro1','http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (49,23,1,null,'nc#Cb411','http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wsb:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'wsb:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (50,23,2,null,'nc#Cb411','http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsb:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsb:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (1,26,1,'PA00000737','Admin111','https://hub.americamovil.com/sag/services/blackgrayService',1,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://www.csapi.org/schema/parlayx/blackgray/v1_0/local"><soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"><wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:Username>_*user_*</wsse:Username><wsse:Password Type="...#PasswordDigest">_*passSMT_*</wsse:Password><wsse:Nonce>_*nonce_*</wsse:Nonce><wsse:Created>_*dateSMT_*</wsse:Created></wsse:UsernameToken></wsse:Security><tns:RequestSOAPHeader xmlns:tns="http://www.huawei.com.cn/schema/common/v2_1"><tns:AppId>35000001000001</tns:AppId><tns:TransId>2014011716010012345</tns:TransId><tns:OA>_*movil_*</tns:OA><tns:FA>_*movil_*</tns:FA></tns:RequestSOAPHeader></soapenv:Header><soapenv:Body><loc:deleteGrayList><loc:version>_*version_*</loc:version><loc:grayList><grayee><msisdn>_*movil_*</msisdn>    </grayee></loc:grayList></loc:deleteGrayList></soapenv:Body></soapenv:Envelope>',null,null,'loc:deleteGrayList',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (2,10,1,null,'ebea4edabf','http://webservices.binbit.com/claro_gt/claro_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'clar:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (3,10,2,null,'ebea4edabf','http://webservices.binbit.com/claro_gt/claro_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (4,10,3,null,'ebea4edabf','http://webservices.binbit.com/claro_gt/claro_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><marcacion xsi:type="xsd:string">_*marcacion_*</marcacion><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (5,22,1,null,'qwio2012','http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (6,22,2,null,'qwio2012','http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (7,22,3,null,'qwio2012','http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (8,2,1,'7182818284','7182818284','http://callcenter2.contentamobile.com/server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><operacion xsi:type="xsd:string">_*operacion_*</operacion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (9,2,2,'7182818284','7182818284','http://callcenter2.contentamobile.com/server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (10,2,3,'7182818284','7182818284','http://callcenter2.contentamobile.com/server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (12,19,1,null,'neef1he7Az5thaimoojiemahChoy0v','http://hdclaro.cronos.mobi/',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></hdc:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'hdc:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (13,19,2,null,'neef1he7Az5thaimoojiemahChoy0v','http://hdclaro.cronos.mobi/',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></hdc:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'hdc:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (14,19,3,null,'neef1he7Az5thaimoojiemahChoy0v','http://hdclaro.cronos.mobi/',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></hdc:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'hdc:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (15,8,1,null,'1234','http://corp.esmoviles.com/public/Subscriptions/webservice/claroWebService/claroWebService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="claro-webservices"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'clar:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (16,8,2,null,'1234','http://corp.esmoviles.com/public/Subscriptions/webservice/claroWebService/claroWebService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="claro-webservices"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (17,8,3,null,'1234','http://corp.esmoviles.com/public/Subscriptions/webservice/claroWebService/claroWebService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="claro-webservices"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (18,14,1,null,'clrPsshxq678','http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (19,14,2,null,'clrPsshxq678','http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (20,14,3,null,'clrPsshxq678','http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (21,1,1,'cl4w0d.11','c45pe2','http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:listaNegra><mob:movil>_*movil_*</mob:movil><mob:accion>_*accion_*</mob:accion><mob:pass>_*pass_*</mob:pass></mob:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'mob:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (22,1,2,'cl4w0d.11','c45pe2','http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:consultaServicios><mob:movil>_*movil_*</mob:movil><mob:pass>_*pass_*</mob:pass></mob:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'mob:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (23,1,3,'cl4w0d.11','c45pe2','http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:bajaServicios><mob:movil>_*movil_*</mob:movil><mob:servicio>_*servicio_*</mob:servicio><mob:mcorta>_*mcorta_*</mob:mcorta><mob:pass>_*pass_*</mob:pass></mob:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'mob:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (24,13,1,null,'m75v21x06','http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wss:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'wss:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (51,23,3,null,'nc#Cb411','http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsb:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsb:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (52,6,1,null,'w@uCEN539','http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (53,6,2,null,'w@uCEN539','http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (54,6,3,null,'w@uCEN539','http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (55,5,1,null,'W1c0S3rv1c3','http://php.wirelessidea.com/claro_services/gt/ws_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (56,5,2,null,'W1c0S3rv1c3','http://php.wirelessidea.com/claro_services/gt/ws_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (57,5,3,null,'W1c0S3rv1c3','http://php.wirelessidea.com/claro_services/gt/ws_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (58,17,1,null,'$zf3RmyP','http://siglo21.conceptomovil.com/apps/suscripcion/wsc/suscrimovil_server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:suscripcionesmovil"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (59,17,2,null,'$zf3RmyP','http://siglo21.conceptomovil.com/apps/suscripcion/wsc/suscrimovil_server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:suscripcionmovil"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (60,17,3,null,'$zf3RmyP','http://siglo21.conceptomovil.com/apps/suscripcion/wsc/suscrimovil_server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:suscripcionmovil"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (61,15,1,null,'C@GT14','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (39,16,3,null,'cl4r0_g04t3m4l4','http://reports.smsamericas.net/ws_claro/Service.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></sms:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'sms:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (127,45,2,null,'w@uCEN539','http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (128,45,3,null,'w@uCEN539','http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (129,46,1,null,'W1c0S3rv1c3','http://php.wirelessidea.com/claro_services/gt/ws_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (130,46,2,null,'W1c0S3rv1c3','http://php.wirelessidea.com/claro_services/gt/ws_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (134,47,3,null,'C@GT14','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (135,48,1,null,'1234','http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><action xsi:type="xsd:string">_*accion_*</action><pass xsi:type="xsd:string">_*pass_*</pass></wsc:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'wsc:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (136,48,2,null,'1234','http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsc:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsc:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (137,48,3,null,'1234','http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsc:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsc:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (76,29,1,null,'qwio2012;','http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (77,29,2,null,'qwio2012;','http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (78,29,3,null,'qwio2012;','http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (62,15,2,null,'C@GT14','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (63,15,3,null,'C@GT14','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (64,9,1,null,'1234','http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><action xsi:type="xsd:string">_*accion_*</action><pass xsi:type="xsd:string">_*pass_*</pass></wsc:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'wsc:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (65,9,2,null,'1234','http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsc:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsc:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (66,9,3,null,'1234','http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsc:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsc:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (79,30,1,'7182818284','7182818284','http://callcenter2.contentamobile.com/server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><operacion xsi:type="xsd:string">_*operacion_*</operacion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (80,30,2,'7182818284','7182818284','http://callcenter2.contentamobile.com/server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (81,30,3,'7182818284','7182818284','http://callcenter2.contentamobile.com/server.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (86,32,2,null,'gua6needaiwa5dook6thaicaiTo4oh','http://hdclaro.cronos.mobi/',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></hdc:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'hdc:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (87,32,3,null,'gua6needaiwa5dook6thaicaiTo4oh','http://hdclaro.cronos.mobi/',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></hdc:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'hdc:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (88,33,1,null,'1234','http://corp.esmoviles.com/public/Subscriptions/webservice/claroWebService/claroWebService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="claro-webservices"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'clar:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (89,33,2,null,'1234','http://corp.esmoviles.com/public/Subscriptions/webservice/claroWebService/claroWebService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="claro-webservices"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (95,35,2,null,'claro','http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:consultaServicios><mob:movil>_*movil_*</mob:movil><mob:pass>_*pass_*</mob:pass></mob:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'mob:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (96,35,3,null,'claro','http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:bajaServicios><mob:movil>_*movil_*</mob:movil><mob:servicio>_*servicio_*</mob:servicio><mob:mcorta>_*mcorta_*</mob:mcorta><mob:pass>_*pass_*</mob:pass></mob:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'mob:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (98,36,2,null,'m75v21x06','http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wss:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wss:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (103,38,1,null,'332vbf3','http://silversolempresas.com/suscripcion/servicios/WsEsClaroSuscripcion.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (104,38,2,null,'332vbf3','http://silversolempresas.com/suscripcion/servicios/WsEsClaroSuscripcion.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (105,38,3,null,'332vbf3','http://silversolempresas.com/suscripcion/servicios/WsEsClaroSuscripcion.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (70,27,1,null,'ebea4edabf','http://webservices.binbit.com/claro_gt/claro_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'clar:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (107,39,2,null,'cl4r0_s4lv4d0r','http://reports.smsamericas.net/ws_claro/Service.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></sms:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'sms:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (109,40,1,null,'CLAROSV','http://98.129.194.129/ws/sv/claro/ws_server_clarosv.php',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:teamclarosvwsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><password>_*pass_*</password></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (110,40,2,null,'CLAROSV','http://98.129.194.129/ws/sv/claro/ws_server_clarosv.php',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:teamclarosvwsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><password>_*pass_*</password></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (111,40,3,null,'CLAROSV','http://98.129.194.129/ws/sv/claro/ws_server_clarosv.php',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:teamclarosvwsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><password>_*pass_*</password></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (112,41,1,null,'Pa55w0rd','http://190.111.8.113/appclaro/webService/appclaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (113,41,2,null,'Pa55w0rd','http://190.111.8.113/appclaro/webService/appclaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>	',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (114,41,3,null,'Pa55w0rd','http://190.111.8.113/appclaro/webService/appclaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (117,42,3,null,'salclaro1','http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (82,31,1,'6JWg9m-6ehcj','6JWg9m-6ehcj','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (83,31,2,'6JWg9m-6ehcj','6JWg9m-6ehcj','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (84,31,3,'6JWg9m-6ehcj','6JWg9m-6ehcj','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (85,32,1,null,'gua6needaiwa5dook6thaicaiTo4oh','http://hdclaro.cronos.mobi/',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></hdc:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'hdc:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (90,33,3,null,'1234','http://corp.esmoviles.com/public/Subscriptions/webservice/claroWebService/claroWebService.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="claro-webservices"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (91,34,1,null,'clrPsshxq678','http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (92,34,2,null,'clrPsshxq678','http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (93,34,3,null,'clrPsshxq678','http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (94,35,1,null,'claro','http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:listaNegra><mob:movil>_*movil_*</mob:movil><mob:accion>_*accion_*</mob:accion><mob:pass>_*pass_*</mob:pass></mob:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'mob:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (97,36,1,null,'m75v21x06','http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wss:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'wss:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (99,36,3,null,'m75v21x06','http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wss:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wss:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (100,37,1,null,'cl4r0gu473m4l4','http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (71,27,2,null,'ebea4edabf','http://webservices.binbit.com/claro_gt/claro_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (72,27,3,null,'ebea4edabf','http://webservices.binbit.com/claro_gt/claro_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><marcacion xsi:type="xsd:string">_*marcacion_*</marcacion><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (73,28,1,'y512f2','y512f2','http://claro.bitworks.com.sv/wsserviciosclaro.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (74,28,2,'y512f2','y512f2','http://claro.bitworks.com.sv/wsserviciosclaro.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (75,28,3,'y512f2','y512f2','http://claro.bitworks.com.sv/wsserviciosclaro.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'tem:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (101,37,2,null,'cl4r0gu473m4l4','http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (102,37,3,null,'cl4r0gu473m4l4','http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (106,39,1,null,'cl4r0_s4lv4d0r','http://reports.smsamericas.net/ws_claro/Service.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></sms:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'sms:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (108,39,3,null,'cl4r0_s4lv4d0r','http://reports.smsamericas.net/ws_claro/Service.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></sms:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'sms:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (115,42,1,null,'salclaro1','http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'clar:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (116,42,2,null,'salclaro1','http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'clar:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (119,43,1,null,'nc#Cb411','http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wsb:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'wsb:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (120,43,2,null,'nc#Cb411','http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsb:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsb:consultaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (125,43,3,null,'nc#Cb411','http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsb:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'wsb:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (126,45,1,null,'w@uCEN539','http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx',0,'<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'tem:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (131,46,3,null,'W1c0S3rv1c3','http://php.wirelessidea.com/claro_services/gt/ws_gt.php',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:bajaServicios',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (132,47,1,null,'C@GT14','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>',null,null,'urn:listaNegra',null,null,null,null,null,null);
Insert into SDA_METODOS (ID,ID_AGREGADOR,METODO,USUARIO,CONTRASENIA,END_POINT,SEGURIDAD,INPUTMESSAGETEXT,INPUTMESSAGENAME,SERVICE_NAME,SOAPACTIONURI,NAMESPACEURI,STYLE,TARGETMETHODNAME,TARGETOBJECTURI,TARGETURL,WSDL_AGREGADOR) values (133,47,2,null,'C@GT14','http://108.166.12.47',0,'<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>',null,null,'urn:consultaServicios',null,null,null,null,null,null);
REM INSERTING into SDA_PAISES
SET DEFINE OFF;
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (1,'GUATEMALA','502',1);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (2,'EL SALVADOR','503',0);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (3,'HONDURAS','504',0);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (4,'NICARAGUA','505',0);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (5,'COSTA RICA','506',0);
REM INSERTING into SDA_PARAMETROS
SET DEFINE OFF;
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (218,'pass',81);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (219,'movil',82);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (220,'accion',82);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (228,'movil',86);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (235,'servicio',87);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (230,'pass',86);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (231,'movil',85);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (232,'accion',85);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (233,'pass',85);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (234,'movil',87);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (236,'mcorta',87);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (239,'accion',88);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (242,'pass',89);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (243,'movil',90);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (244,'servicio',90);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (245,'mcorta',90);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (246,'pass',90);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (251,'pass',92);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (254,'mcorta',93);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (255,'pass',93);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (258,'pass',95);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (261,'pass',94);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (263,'servicio',96);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (265,'pass',96);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (268,'pass',97);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (269,'movil',98);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (274,'pass',99);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (275,'movil',100);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (279,'pass',101);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (282,'mcorta',102);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (284,'movil',103);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (286,'pass',103);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (290,'servicio',105);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (293,'movil',106);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (298,'movil',108);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (299,'servicio',108);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (300,'mcorta',108);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (303,'accion',109);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (305,'movil',110);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (306,'pass',110);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (309,'mcorta',111);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (310,'pass',111);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (314,'movil',113);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (316,'movil',114);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (317,'servicio',114);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (318,'mcorta',114);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (319,'pass',114);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (320,'movil',115);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (321,'accion',115);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (324,'pass',116);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (327,'servicio',117);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (195,'movil',71);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (196,'pass',71);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (203,'pass',73);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (208,'mcorta',75);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (209,'pass',75);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (210,'movil',79);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (211,'operacion',79);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (212,'pass',79);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (213,'movil',80);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (214,'pass',80);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (215,'movil',81);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (216,'servicio',81);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (217,'mcorta',81);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (221,'pass',82);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (222,'movil',83);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (223,'pass',83);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (224,'movil',84);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (225,'servicio',84);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (226,'mcorta',84);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (227,'pass',84);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (237,'pass',87);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (238,'movil',88);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (240,'pass',88);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (241,'movil',89);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (247,'movil',91);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (248,'accion',91);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (249,'pass',91);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (250,'movil',92);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (252,'movil',93);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (253,'servicio',93);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (256,'movil',95);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (264,'mcorta',96);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (259,'movil',94);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (260,'accion',94);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (262,'movil',96);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (266,'movil',97);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (267,'accion',97);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (270,'pass',98);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (271,'movil',99);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (272,'servicio',99);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (273,'mcorta',99);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (276,'accion',100);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (277,'pass',100);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (278,'movil',101);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (280,'movil',102);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (281,'servicio',102);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (283,'pass',102);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (285,'accion',103);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (287,'movil',104);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (288,'pass',104);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (289,'movil',105);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (291,'mcorta',105);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (292,'pass',105);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (294,'accion',106);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (295,'pass',106);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (296,'movil',107);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (297,'pass',107);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (301,'pass',108);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (302,'movil',109);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (304,'pass',109);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (307,'movil',111);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (308,'servicio',111);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (311,'movil',112);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (312,'accion',112);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (313,'pass',112);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (315,'pass',113);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (322,'pass',115);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (323,'movil',116);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (329,'pass',117);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (326,'movil',117);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (328,'mcorta',117);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (1,'user',1);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (2,'passSMT',1);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (3,'nonce',1);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (4,'dateSMT',1);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (5,'movil',1);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (6,'version',1);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (7,'movil',2);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (8,'accion',2);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (9,'pass',2);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (10,'movil',3);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (11,'pass',3);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (12,'movil',4);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (13,'servicio',4);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (14,'marcacion',4);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (15,'pass',4);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (16,'movil',5);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (17,'accion',5);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (18,'pass',5);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (19,'movil',6);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (20,'pass',6);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (21,'movil',7);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (22,'servicio',7);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (23,'mcorta',7);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (24,'pass',7);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (25,'movil',8);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (26,'operacion',8);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (27,'pass',8);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (28,'movil',9);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (29,'pass',9);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (30,'movil',10);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (31,'servicio',10);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (32,'mcorta',10);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (33,'pass',10);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (34,'movil',12);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (35,'accion',12);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (36,'pass',12);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (37,'movil',13);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (38,'pass',13);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (39,'movil',14);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (40,'servicio',14);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (41,'mcorta',14);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (42,'pass',14);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (43,'movil',15);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (44,'accion',15);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (45,'pass',15);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (46,'movil',16);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (47,'pass',16);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (48,'movil',17);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (49,'servicio',17);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (50,'mcorta',17);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (51,'pass',17);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (52,'movil',18);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (53,'accion',18);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (54,'pass',18);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (55,'movil',19);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (56,'pass',19);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (57,'movil',20);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (58,'servicio',20);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (59,'mcorta',20);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (60,'pass',20);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (61,'movil',21);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (62,'accion',21);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (63,'pass',21);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (64,'movil',22);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (65,'pass',22);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (66,'movil',23);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (67,'servicio',23);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (68,'pass',23);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (69,'mcorta',23);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (70,'movil',24);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (71,'accion',24);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (72,'pass',24);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (73,'movil',25);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (74,'pass',25);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (75,'movil',26);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (76,'servicio',26);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (77,'mcorta',26);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (78,'pass',26);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (80,'movil',27);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (81,'accion',27);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (82,'pass',27);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (83,'movil',28);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (84,'pass',28);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (85,'movil',29);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (86,'servicio',29);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (87,'mcorta',29);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (88,'pass',29);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (89,'movil',30);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (90,'accion',30);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (91,'pass',30);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (92,'movil',31);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (93,'pass',31);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (94,'movil',32);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (95,'servicio',32);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (96,'mcorta',32);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (97,'pass',32);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (98,'movil',34);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (99,'accion',34);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (100,'pass',34);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (101,'movil',35);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (102,'pass',35);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (103,'movil',36);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (104,'servicio',36);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (105,'mcorta',36);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (106,'pass',36);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (107,'movil',37);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (108,'accion',37);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (109,'pass',37);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (110,'movil',40);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (111,'accion',40);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (112,'pass',40);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (113,'item',41);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (114,'movil',42);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (115,'servicio',42);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (116,'mcorta',42);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (117,'pass',42);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (118,'movil',43);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (119,'accion',43);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (120,'pass',43);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (121,'movil',44);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (122,'pass',44);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (123,'movil',45);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (124,'servicio',45);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (125,'mcorta',45);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (126,'pass',45);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (127,'movil',46);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (128,'accion',46);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (129,'pass',46);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (130,'movil',47);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (131,'pass',47);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (132,'movil',48);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (133,'servicio',48);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (134,'mcorta',48);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (135,'pass',48);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (136,'movil',49);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (137,'accion',49);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (138,'pass',49);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (139,'movil',50);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (140,'pass',50);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (144,'mcorta',51);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (142,'movil',51);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (143,'servicio',51);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (145,'pass',51);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (146,'movil',52);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (147,'accion',52);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (148,'pass',52);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (149,'movil',53);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (150,'pass',53);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (151,'movil',54);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (152,'servicio',54);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (153,'mcorta',54);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (154,'pass',54);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (155,'movil',55);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (156,'accion',55);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (157,'pass',55);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (158,'movil',56);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (159,'pass',56);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (160,'movil',57);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (161,'servicio',57);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (162,'mcorta',57);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (163,'pass',57);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (164,'movil',58);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (165,'accion',58);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (166,'pass',58);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (167,'movil',59);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (168,'pass',59);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (169,'movil',60);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (170,'servicio',60);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (171,'mcorta',60);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (172,'pass',60);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (173,'movil',61);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (174,'accion',61);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (175,'pass',61);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (176,'movil',62);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (177,'pass',62);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (178,'movil',63);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (179,'servicio',63);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (180,'mcorta',63);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (181,'pass',63);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (182,'movil',64);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (183,'accion',64);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (184,'pass',64);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (185,'movil',65);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (186,'pass',65);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (187,'movil',66);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (188,'servicio',66);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (190,'mcorta',66);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (191,'pass',66);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (192,'movil',70);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (193,'accion',70);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (194,'pass',70);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (197,'movil',72);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (198,'servicio',72);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (199,'mcorta',72);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (200,'pass',72);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (201,'movil',73);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (202,'accion',73);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (204,'movil',74);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (205,'pass',74);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (206,'movil',75);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (207,'servicio',75);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (331,'pass',120);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (332,'movil',119);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (334,'pass',119);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (336,'servicio',125);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (337,'mcorta',125);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (340,'accion',126);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (344,'movil',128);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (345,'servicio',128);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (349,'accion',129);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (354,'servicio',131);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (355,'mcorta',131);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (357,'movil',132);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (358,'accion',132);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (359,'pass',132);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (364,'mcorta',134);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (372,'mcorta',137);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (373,'pass',137);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (374,'accion',135);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (330,'movil',120);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (333,'accion',119);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (335,'movil',125);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (338,'pass',125);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (339,'movil',126);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (341,'pass',126);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (342,'movil',127);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (343,'pass',127);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (346,'mcorta',128);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (347,'pass',128);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (348,'movil',129);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (350,'pass',129);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (351,'movil',130);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (352,'pass',130);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (353,'movil',131);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (356,'pass',131);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (360,'movil',133);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (361,'pass',133);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (362,'movil',134);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (363,'servicio',134);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (365,'pass',134);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (366,'movil',135);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (367,'pass',135);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (368,'movil',136);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (369,'pass',136);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (370,'movil',137);
Insert into SDA_PARAMETROS (ID,NOMBRE,ID_METODO) values (371,'servicio',137);
REM INSERTING into SDA_PARAMETROS_SISTEMA
SET DEFINE OFF;
Insert into SDA_PARAMETROS_SISTEMA (ID,KEY,VALUE) values (1,'accion','2');
Insert into SDA_PARAMETROS_SISTEMA (ID,KEY,VALUE) values (2,'host','172.24.0.222');
Insert into SDA_PARAMETROS_SISTEMA (ID,KEY,VALUE) values (3,'version','1.0');
REM INSERTING into SDA_RESPUESTAS
SET DEFINE OFF;
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (66,81,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (70,86,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (71,85,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (73,88,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (77,92,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (78,93,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (83,98,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (86,101,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (88,103,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (91,106,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (94,109,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (95,110,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (96,111,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (101,116,5,'Return');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (59,71,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (61,73,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (63,75,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (64,79,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (65,80,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (67,82,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (68,83,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (69,84,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (72,87,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (80,94,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (76,91,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (79,95,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (81,96,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (82,97,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (84,99,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (85,100,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (87,102,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (89,104,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (90,105,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (92,107,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (93,108,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (97,112,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (98,113,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (99,114,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (100,115,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (102,117,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (1,1,2,'ns1:resultCode');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (2,2,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (3,3,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (4,4,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (5,5,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (6,6,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (7,7,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (8,8,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (9,9,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (10,10,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (11,12,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (12,13,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (13,14,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (14,18,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (15,19,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (16,20,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (17,21,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (18,22,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (19,23,6,'string');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (20,24,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (21,25,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (22,26,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (25,28,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (24,27,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (26,29,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (27,30,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (28,31,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (29,32,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (30,34,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (31,35,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (32,36,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (33,37,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (34,40,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (35,42,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (36,43,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (37,44,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (38,45,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (39,46,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (40,47,5,'Return');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (41,48,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (42,49,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (43,50,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (44,51,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (45,52,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (46,53,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (50,56,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (48,54,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (49,55,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (51,57,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (52,58,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (53,59,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (54,60,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (55,64,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (56,65,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (57,66,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (58,70,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (60,72,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (62,74,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (105,120,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (106,119,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (109,127,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (111,129,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (112,130,1,'item');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (113,131,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (114,135,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (107,125,3,'Resp');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (108,126,4,'Value');
Insert into SDA_RESPUESTAS (ID,ID_METODO,ID_RESPUESTA,NOMBRE) values (110,128,4,'Value');
REM INSERTING into SDA_RESULTADOS_RESPUESTA
SET DEFINE OFF;
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (97,66,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (98,66,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (101,69,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (102,69,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (111,78,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (121,84,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (105,71,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (106,71,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (118,81,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (120,82,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (123,85,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (124,85,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (125,87,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (126,87,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (127,88,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (128,88,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (129,90,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (130,90,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (131,91,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (133,93,'Exito','SI');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (134,93,'Fallo','NO');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (138,96,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (139,97,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (140,97,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (142,99,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (88,58,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (91,61,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (93,63,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (94,63,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (95,64,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (96,64,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (99,67,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (100,67,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (107,72,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (108,72,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (109,76,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (110,76,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (112,78,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (119,82,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (115,80,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (116,80,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (117,81,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (122,84,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (132,91,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (135,94,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (136,94,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (137,96,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (141,99,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (143,100,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (144,100,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (145,102,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (146,102,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (1,2,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (3,4,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (4,4,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (5,1,'Exito','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (6,1,'the msisdn has already existed','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (7,1,'the msisdn format is wrong','2');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (8,1,'the msisdn is not existed (for delete black list)','3');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (9,1,'the ASPID is not existed','4');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (10,1,'the serviceID is not existed','5');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (11,1,'system SMT error','9');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (12,2,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (13,5,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (14,5,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (15,6,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (16,6,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (17,8,'Exito','SI');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (18,8,'Fallo','NO');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (19,10,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (20,10,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (21,11,'Exito','SI');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (22,11,'Fallo','NO');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (25,13,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (27,14,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (26,13,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (28,14,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (29,16,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (30,16,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (31,17,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (32,17,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (33,19,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (34,19,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (35,20,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (36,20,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (37,22,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (38,22,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (39,21,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (40,21,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (41,24,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (42,24,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (43,26,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (44,26,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (45,27,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (46,27,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (47,29,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (48,29,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (49,30,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (50,30,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (51,32,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (52,32,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (53,33,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (54,33,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (55,34,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (56,34,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (57,35,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (58,35,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (59,36,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (60,36,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (61,38,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (62,38,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (63,39,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (64,39,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (65,41,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (66,41,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (67,42,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (68,42,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (69,44,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (70,44,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (71,45,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (72,45,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (73,48,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (74,48,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (75,49,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (76,49,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (77,51,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (78,51,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (79,52,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (80,52,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (81,54,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (82,54,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (83,55,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (84,55,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (85,57,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (86,57,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (87,58,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (89,60,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (90,60,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (92,61,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (150,106,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (155,108,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (158,111,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (159,111,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (160,113,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (161,113,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (162,114,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (163,114,'Fallo','2');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (151,106,'Fallo','2');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (152,107,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (153,107,'Fallo','0');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (154,108,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (156,110,'Exito','1');
Insert into SDA_RESULTADOS_RESPUESTA (ID,ID_RESPUESTA,VALOR,DATO) values (157,110,'Fallo','0');
REM INSERTING into SDA_USUARIO_SISTEMA
SET DEFINE OFF;
Insert into SDA_USUARIO_SISTEMA (ID,USUARIO,CONTRASENIA,ESTADO) values (1,'admin','admin',1);
--------------------------------------------------------
--  DDL for Index CLIENTE_TEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLIENTE_TEL_PK" ON "CLIENTE_TEL" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_AGREGADORES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_AGREGADORES_PK" ON "SDA_AGREGADORES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_CAT_RESPUESTAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_CAT_RESPUESTAS_PK" ON "SDA_CAT_RESPUESTAS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_LOG_DEPURACION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_LOG_DEPURACION_PK" ON "SDA_LOG_DEPURACION" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_METODOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_METODOS_PK" ON "SDA_METODOS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_PAISES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PAISES_PK" ON "SDA_PAISES" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_PARAMETROS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PARAMETROS_PK" ON "SDA_PARAMETROS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_PARAMETROS_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PARAMETROS_SISTEMA_PK" ON "SDA_PARAMETROS_SISTEMA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_RESPUESTA_PK" ON "SDA_RESPUESTAS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_RESULTADOS_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_RESULTADOS_RESPUESTA_PK" ON "SDA_RESULTADOS_RESPUESTA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  DDL for Index SDA_USUARIO_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_USUARIO_SISTEMA_PK" ON "SDA_USUARIO_SISTEMA" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR" ;
--------------------------------------------------------
--  Constraints for Table CLIENTE_TEL
--------------------------------------------------------

  ALTER TABLE "CLIENTE_TEL" ADD CONSTRAINT "CLIENTE_TEL_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "CLIENTE_TEL" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_AGREGADORES
--------------------------------------------------------

  ALTER TABLE "SDA_AGREGADORES" ADD CONSTRAINT "SDA_AGREGADORES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("NOMBRE_AGREGADOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ID_PAIS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_CAT_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_CAT_RESPUESTAS" ADD CONSTRAINT "SDA_CAT_RESPUESTAS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_CAT_RESPUESTAS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_CAT_RESPUESTAS" MODIFY ("NOMBRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" ADD CONSTRAINT "SDA_LOG_DEPURACION_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("SUSCRIPTOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ESTADO_TRANSACCION" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("FECHA_TRANSACCION" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID_METODO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID_USUARIO_SISTEMA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_METODOS
--------------------------------------------------------

  ALTER TABLE "SDA_METODOS" ADD CONSTRAINT "SDA_METODOS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_METODOS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("ID_AGREGADOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("METODO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("END_POINT" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("INPUTMESSAGETEXT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_PAISES
--------------------------------------------------------

  ALTER TABLE "SDA_PAISES" ADD CONSTRAINT "SDA_PAISES_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_PAISES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PAISES" MODIFY ("PAIS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_PARAMETROS
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS" ADD CONSTRAINT "SDA_PARAMETROS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("ID_METODO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS_SISTEMA" ADD CONSTRAINT "SDA_PARAMETROS_SISTEMA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("KEY" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("VALUE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_RESPUESTAS" ADD CONSTRAINT "SDA_RESPUESTA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID_METODO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID_RESPUESTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" ADD CONSTRAINT "SDA_RESULTADOS_RESPUESTA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" MODIFY ("ID_RESPUESTA" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_USUARIO_SISTEMA
--------------------------------------------------------

  ALTER TABLE "SDA_USUARIO_SISTEMA" ADD CONSTRAINT "SDA_USUARIO_SISTEMA_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "AGREGADOR"  ENABLE;
 
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("USUARIO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("CONTRASENIA" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("ESTADO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SDA_AGREGADORES
--------------------------------------------------------

  ALTER TABLE "SDA_AGREGADORES" ADD CONSTRAINT "SDA_AGREGADORES_PAISES_FK" FOREIGN KEY ("ID_PAIS")
	  REFERENCES "SDA_PAISES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" ADD CONSTRAINT "SDA_LOG_DEPURACION_METODOS_FK" FOREIGN KEY ("ID_METODO")
	  REFERENCES "SDA_METODOS" ("ID") ENABLE;
 
  ALTER TABLE "SDA_LOG_DEPURACION" ADD CONSTRAINT "SDA_LOG_USUARIO_FK" FOREIGN KEY ("ID_USUARIO_SISTEMA")
	  REFERENCES "SDA_USUARIO_SISTEMA" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_METODOS
--------------------------------------------------------

  ALTER TABLE "SDA_METODOS" ADD CONSTRAINT "SDA_METODOS_AGREGADORES_FK" FOREIGN KEY ("ID_AGREGADOR")
	  REFERENCES "SDA_AGREGADORES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_PARAMETROS
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS" ADD CONSTRAINT "SDA_PARAMETROS_METODOS_FK" FOREIGN KEY ("ID_METODO")
	  REFERENCES "SDA_METODOS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_RESPUESTAS" ADD CONSTRAINT "SDA_RESPUESTAS_METODOS_FK" FOREIGN KEY ("ID_METODO")
	  REFERENCES "SDA_METODOS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" ADD CONSTRAINT "SDA_RESULTADOS_RESPUESTA_FK1" FOREIGN KEY ("ID_RESPUESTA")
	  REFERENCES "SDA_RESPUESTAS" ("ID") ENABLE;
