--------------------------------------------------------
-- ARCHIVO CREADO  jueves-septiembre-26-2014   
-- USUARIO CREADOR Edwin Mejia - Avantia Consultores
--------------------------------------------------------

DROP TABLE "SDA_RESULTADOS_RESPUESTA" cascade constraints;
DROP SEQUENCE "SQ_SDA_RESULTADO_RESPUESTAS";

DROP TABLE "CLIENTE_TEL" cascade constraints;
DROP TABLE "SDA_AGREGADORES" cascade constraints;
DROP TABLE "SDA_METODOS" cascade constraints;
DROP TABLE "SDA_PAISES" cascade constraints;
DROP TABLE "SDA_PARAMETROS" cascade constraints;
DROP TABLE "SDA_RESPUESTAS" cascade constraints;
DROP TABLE "SDA_PARAMETROS_SISTEMA" cascade constraints;
DROP TABLE "SDA_USUARIO_SISTEMA" cascade constraints;
DROP TABLE "SDA_LOG_DEPURACION" cascade constraints;
DROP SEQUENCE "SQ_SDA_AGREGADORES";
DROP SEQUENCE "SQ_SDA_METODOS";
DROP SEQUENCE "SQ_SDA_PAIS";
DROP SEQUENCE "SQ_SDA_PARAMETROS";
DROP SEQUENCE "SQ_SDA_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_PARAMETROS_SISTEMA";
DROP SEQUENCE "SQ_SDA_USUARIO_SISTEMA";
DROP SEQUENCE "SQ_SDA_LOG_DEPURACION";

---------------------------------------------------------------
------------------DDL CREACION DE SECUENCIAS-------------------
---------------------------------------------------------------

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_AGREGADORES
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_AGREGADORES"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 27 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_METODOS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_METODOS"  MINVALUE 1 MAXVALUE 50000 INCREMENT BY 1 START WITH 24 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PAIS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PAIS"  MINVALUE 1 MAXVALUE 300 INCREMENT BY 1 START WITH 6 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PARAMETROS"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 70 NOCACHE  NOORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESPUESTAS"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 20 NOCACHE  NOORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESULTADO_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESULTADO_RESPUESTAS"  MINVALUE 1 MAXVALUE 100 INCREMENT BY 1 START WITH 35 NOCACHE  NOORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

	CREATE SEQUENCE "SQ_SDA_PARAMETROS_SISTEMA" MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
	
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_USUARIO_SISTEMA
--------------------------------------------------------

	CREATE SEQUENCE "SQ_SDA_USUARIO_SISTEMA" MINVALUE 2 MAXVALUE 10000 INCREMENT BY 1 START WITH 2 NOCACHE  NOORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_LOG_DEPURACION
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_LOG_DEPURACION"  MINVALUE 1 MAXVALUE 100000000 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;

   
   
---------------------------------------------------------------
------------------DDL CREACION DE TABLAS-----------------------
---------------------------------------------------------------
   
   
   
--------------------------------------------------------
--  DDL for Table CLIENTE_TEL
--------------------------------------------------------

  CREATE TABLE "CLIENTE_TEL" 
   (    "ID" NUMBER, 
		"NUMERO" VARCHAR2(20 BYTE)
   ) ;
   
--------------------------------------------------------
--  DDL for Table SDA_PAISES
--------------------------------------------------------

  CREATE TABLE "SDA_PAISES" 
   (    "ID" NUMBER, 
		"PAIS" VARCHAR2(100 BYTE), 
		"CODIGO" VARCHAR2(10 BYTE), 
		"STATUS" NUMBER(*,0)
   )   ;
   
   COMMENT ON COLUMN "SDA_PAISES"."ID" IS 'pk de la tabla SDA_PAISES de donde sera ejecutado el agregador';
   
   COMMENT ON COLUMN "SDA_PAISES"."PAIS" IS 'El nombre del pais de donde sera ejecutado en agregador';
   
   COMMENT ON COLUMN "SDA_PAISES"."CODIGO" IS 'El codigo de pais de donde sera ejecutado en agregador';
   
   COMMENT ON COLUMN "SDA_PAISES"."STATUS" IS 'El estado del pais de donde sera ejecutado en agregador';
   
--------------------------------------------------------
--  DDL for Table SDA_AGREGADORES
--------------------------------------------------------

  CREATE TABLE "SDA_AGREGADORES" 
   (    "ID" NUMBER, 
		"NOMBRE_AGREGADOR" VARCHAR2(255 BYTE), 
		"ESTADO" NUMBER, 
		"ID_PAIS" NUMBER
   )  ;

   COMMENT ON COLUMN "SDA_AGREGADORES"."ID" IS 'pk de la tabla SDA_AGREGADORES';
   
   COMMENT ON COLUMN "SDA_AGREGADORES"."NOMBRE_AGREGADOR" IS 'El nombre del agregador';
   
   COMMENT ON COLUMN "SDA_AGREGADORES"."ESTADO" IS 'El estado del agregador';
   
   COMMENT ON COLUMN "SDA_AGREGADORES"."ID_PAIS" IS 'fk con la tabla paises del agregador';
   
--------------------------------------------------------
--  DDL for Table SDA_METODOS
--------------------------------------------------------

  CREATE TABLE "SDA_METODOS" 
   (    "ID" NUMBER, 
		"ID_AGREGADOR" NUMBER, 
		"METODO" NUMBER, 
		"USUARIO" VARCHAR2(255 BYTE), 
		"CONTRASENIA" VARCHAR2(255 BYTE), 
		"END_POINT" VARCHAR2(1000 BYTE),
		"SEGURIDAD" NUMBER,
		"INPUTMESSAGETEXT" VARCHAR2(4000 BYTE), 
		"INPUTMESSAGENAME" VARCHAR2(255 BYTE), 
		"SERVICE_NAME" VARCHAR2(20 BYTE), 
		"SOAPACTIONURI" VARCHAR2(255 BYTE),
		"NAMESPACEURI" VARCHAR2(255 BYTE), 
		"STYLE" VARCHAR2(255 BYTE), 
		"TARGETMETHODNAME" VARCHAR2(255 BYTE), 
		"TARGETOBJECTURI" VARCHAR2(255 BYTE), 
		"TARGETURL" VARCHAR2(255 BYTE), 
		"WSDL_AGREGADOR" VARCHAR2(255 BYTE)
   )  ;
 

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
--  DDL for Table SDA_PARAMETROS
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS" 
   (    "ID" NUMBER, 
		"NOMBRE" VARCHAR2(255 BYTE), 
		"ID_METODO" NUMBER
   )   ;
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."ID" IS 'pk de la tabla de SDA_PARAMETROS';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."NOMBRE" IS 'nombre del parametro a enviar en el servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."ID_METODO" IS 'fk con la tabla de metodos';


--------------------------------------------------------
--  DDL for Table SDA_RESPUESTAS
--------------------------------------------------------

  CREATE TABLE "SDA_RESPUESTAS" 
   (    "ID" NUMBER, 
		"NOMBRE" VARCHAR2(255 BYTE),
		"ID_METODO" NUMBER
   ) ;
   
   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID" IS 'pk de la tabla de SDA_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."NOMBRE" IS 'nombre del parametro a recibir el servicio web de los agregadores cada uno de estos sera guardado en la tabla de logs';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID_METODO" IS 'fk con la tabla de metodos';
   
--------------------------------------------------------
--  DDL for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  CREATE TABLE "SDA_RESULTADOS_RESPUESTA" 
   (	"ID" NUMBER, 
	"ID_RESPUESTA" NUMBER, 
	"VALOR" VARCHAR2(255 BYTE), 
	"DATO" VARCHAR2(20 BYTE)
   ) ;
  
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID" IS 'pk de la tabla de SDA_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."DATO" IS 'el dato que se espera retorne en la respuesta';
   
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."VALOR" IS 'el VALOR que se considerara con el dato que se espera retorne en la respuesta';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID_RESPUESTA" IS 'fk con la tabla de respuestas';
   
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS_SISTEMA" 
   (    "ID" NUMBER, 
		"KEY" VARCHAR2(255 BYTE), 
		"VALUE" VARCHAR2(255 BYTE)
   )   ;
   
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."ID" IS 'pk de la tabla de SDA_PARAMETROS_SISTEMA';
 
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."KEY" IS 'nombre del parametro que sera utilizado dentro del sistema';
 
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."VALUE" IS 'valor del parametro que sera utilizado dentro del sistema';
   
--------------------------------------------------------
--  DDL for Table SDA_USUARIO_SISTEMA	
--------------------------------------------------------

  CREATE TABLE "SDA_USUARIO_SISTEMA" 
   (    "ID" NUMBER, 
		"USUARIO" VARCHAR2(255 BYTE), 
		"CONTRASENIA" VARCHAR2(255 BYTE), 
		"ESTADO" NUMBER
   )  ;
   
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."ID" IS 'pk de la tabla de SDA_USUARIO_SISTEMA';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."USUARIO" IS 'nombre del usuario con permisos de entrar al sistema';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."CONTRASENIA" IS 'contrasenia del usuario con permisos de entrar al sistema';
   
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."ESTADO" IS 'estado del usuario con permisos de entrar al sistema';
   
--------------------------------------------------------
--  DDL for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  CREATE TABLE "SDA_LOG_DEPURACION" 
   (    "ID" NUMBER, 
		"SUSCRIPTOR" VARCHAR2(50 BYTE), 
		"RESPUESTA" CLOB,
		"ENVIO" CLOB, 
		"ESTADO_TRANSACCION" VARCHAR2(255 BYTE),
		"FECHA_TRANSACCION" TIMESTAMP (6),
		"TIPO_TRANSACCION" VARCHAR2(50 BYTE),
		"ID_METODO" NUMBER,
		"ID_USUARIO_SISTEMA" NUMBER
   )  ;
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID" IS 'pk de la tabla de SDA_LOG_DEPURACION';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."SUSCRIPTOR" IS 'numero de telefono que se desea depurar';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ENVIO" IS 'archivo enviado al servicio de los agregadores';
	
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."RESPUESTA" IS 'respuesta obtenida al invocar al metodo web del servicio de los agregadores';
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ESTADO_TRANSACCION" IS 'estado de la depuracion la cual sera mostrada en el reporte';
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."FECHA_TRANSACCION" IS 'Fecha en la que fue ejecutado la depuracion';
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."TIPO_TRANSACCION" IS 'Tipo de depuracion ARCHIVO MASIVA UNITARIA';
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID_METODO" IS 'FK con la tabla de SDA_METODOS';
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID_USUARIO_SISTEMA" IS 'FK con la tabla de SDA_USUARIO_SISTEMA';
   
   
---------------------------------------------------------------
------------------DDL CREACION DE INDEX------------------------
---------------------------------------------------------------


 --------------------------------------------------------
--  DDL for Index CLIENTE_TEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLIENTE_TEL_PK" ON "CLIENTE_TEL" ("ID");
  
--------------------------------------------------------
--  DDL for Index SDA_PAISES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PAISES_PK" ON "SDA_PAISES" ("ID") ;  
  
--------------------------------------------------------
--  DDL for Index SDA_AGREGADORES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_AGREGADORES_PK" ON "SDA_AGREGADORES" ("ID")  ;
  
--------------------------------------------------------
--  DDL for Index SDA_METODOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_METODOS_PK" ON "SDA_METODOS" ("ID") ;

--------------------------------------------------------
--  DDL for Index SDA_PARAMETROS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PARAMETROS_PK" ON "SDA_PARAMETROS" ("ID");
  
--------------------------------------------------------
--  DDL for Index SDA_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_RESPUESTA_PK" ON "SDA_RESPUESTAS" ("ID")  ;

--------------------------------------------------------
--  DDL for Index SDA_RESULTADOS_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_RESULTADOS_RESPUESTA_PK" ON "SDA_RESULTADOS_RESPUESTA" ("ID")  ;
  
--------------------------------------------------------
--  DDL for Index SDA_PARAMETROS_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PARAMETROS_SISTEMA_PK" ON "SDA_PARAMETROS_SISTEMA" ("ID");
  
--------------------------------------------------------
--  DDL for Index SDA_USUARIO_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_USUARIO_SISTEMA_PK" ON "SDA_USUARIO_SISTEMA" ("ID")  ;
 
--------------------------------------------------------
--  DDL for Index SDA_LOG_DEPURACION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_LOG_DEPURACION_PK" ON "SDA_LOG_DEPURACION" ("ID");
  
  
  
---------------------------------------------------------------
-------------------DDL CREATE CONSTRAINTS----------------------
---------------------------------------------------------------
 
 
  
--------------------------------------------------------
--  Constraints for Table CLIENTE_TEL
--------------------------------------------------------

  ALTER TABLE "CLIENTE_TEL" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CLIENTE_TEL" ADD CONSTRAINT "CLIENTE_TEL_PK" PRIMARY KEY ("ID")  ENABLE;

--------------------------------------------------------
--  Constraints for Table SDA_PAISES
--------------------------------------------------------

  ALTER TABLE "SDA_PAISES" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_PAISES" ADD CONSTRAINT "SDA_PAISES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_PAISES" MODIFY ("PAIS" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Constraints for Table SDA_AGREGADORES
--------------------------------------------------------

  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_AGREGADORES" ADD CONSTRAINT "SDA_AGREGADORES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("NOMBRE_AGREGADOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ID_PAIS" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table SDA_METODOS
--------------------------------------------------------

  ALTER TABLE "SDA_METODOS" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_METODOS" ADD CONSTRAINT "SDA_METODOS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_METODOS" MODIFY ("ID_AGREGADOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("METODO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("END_POINT" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("INPUTMESSAGETEXT" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Constraints for Table SDA_PARAMETROS
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_PARAMETROS" ADD CONSTRAINT "SDA_PARAMETROS_PK" PRIMARY KEY ("ID") ENABLE; 
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("ID_METODO" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Constraints for Table SDA_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_RESPUESTAS" ADD CONSTRAINT "SDA_RESPUESTA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID_METODO" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Constraints for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" ADD CONSTRAINT "SDA_RESULTADOS_RESPUESTA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" MODIFY ("ID_RESPUESTA" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Constraints for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" ADD CONSTRAINT "SDA_PARAMETROS_SISTEMA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("KEY" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("VALUE" NOT NULL ENABLE);

--------------------------------------------------------
--  Constraints for Table SDA_USUARIO_SISTEMA
--------------------------------------------------------

  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_USUARIO_SISTEMA" ADD CONSTRAINT "SDA_USUARIO_SISTEMA_PK" PRIMARY KEY ("ID") ENABLE;
  
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("USUARIO" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("CONTRASENIA" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_USUARIO_SISTEMA" MODIFY ("ESTADO" NOT NULL ENABLE);
  
--------------------------------------------------------
--  Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_LOG_DEPURACION" ADD CONSTRAINT "SDA_LOG_DEPURACION_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("SUSCRIPTOR" NOT NULL ENABLE);

  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ESTADO_TRANSACCION" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("FECHA_TRANSACCION" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID_METODO" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID_USUARIO_SISTEMA" NOT NULL ENABLE);
  

  
---------------------------------------------------------------
-------------DDL CREATE REFERENCES CONSTRAINTS-----------------
---------------------------------------------------------------
  
  
--------------------------------------------------------
--  Ref Constraints for Table SDA_AGREGADORES
--------------------------------------------------------

  ALTER TABLE "SDA_AGREGADORES" 
    ADD CONSTRAINT "SDA_AGREGADORES_PAISES_FK" FOREIGN KEY ("ID_PAIS")
        REFERENCES "SDA_PAISES" ("ID") ON DELETE CASCADE ENABLE;
		
--------------------------------------------------------
--  Ref Constraints for Table SDA_METODOS
--------------------------------------------------------

  ALTER TABLE "SDA_METODOS" 
    ADD CONSTRAINT "SDA_METODOS_AGREGADORES_FK" FOREIGN KEY ("ID_AGREGADOR")
      REFERENCES "SDA_AGREGADORES" ("ID") ON DELETE CASCADE ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SDA_PARAMETROS
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS" 
    ADD CONSTRAINT "SDA_PARAMETROS_METODOS_FK" FOREIGN KEY ("ID_METODO")
      REFERENCES "SDA_METODOS" ("ID") ON DELETE CASCADE ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SDA_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_RESPUESTAS" 
    ADD CONSTRAINT "SDA_RESPUESTAS_METODOS_FK" FOREIGN KEY ("ID_METODO")
      REFERENCES "SDA_METODOS" ("ID") ON DELETE CASCADE ENABLE;

--------------------------------------------------------
--  Ref Constraints for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" 
	ADD CONSTRAINT "SDA_RESULTADOS_RESPUESTA_FK1" FOREIGN KEY ("ID_RESPUESTA")
	  REFERENCES "SDA_RESPUESTAS" ("ID") ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" 
    ADD CONSTRAINT "SDA_LOG_DEPURACION_METODOS_FK" FOREIGN KEY ("ID_METODO")
      REFERENCES "SDA_METODOS" ("ID") ENABLE;

  ALTER TABLE "SDA_LOG_DEPURACION" 
    ADD CONSTRAINT "SDA_LOG_USUARIO_FK" FOREIGN KEY ("ID_USUARIO_SISTEMA")
      REFERENCES "SDA_USUARIO_SISTEMA" ("ID") ENABLE;

	  
INSERT INTO "SDA_USUARIO_SISTEMA" (ID, USUARIO, CONTRASENIA, ESTADO) VALUES ('1', 'admin', 'admin', '1');
COMMIT;


INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('1', '50370001635')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('2', '50370001639')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('3', '50370001647')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('4', '50370001650')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('5', '50370001659')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('6', '50370001660')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('7', '50255846245')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('8', '50247166159')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('9', '50242155220')  ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('10', '50242435799') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('11', '50242107214') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('12', '50247009375') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('13', '50370001661') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('14', '50370001665') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('15', '50370001671') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('16', '50370001678') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('17', '50370001679') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('18', '50370001682') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('19', '50370001690') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('20', '50370001701') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('21', '50370001708') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('22', '50370001712') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('23', '50370001720') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('24', '50370001730') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('25', '50370001742') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('26', '50370001748') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('27', '50370001761') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('28', '50370001762') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('29', '50370001764') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('30', '50370001770') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('31', '50370001773') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('32', '50370001777') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('33', '50370001784') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('34', '50370001787') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('35', '50370001788') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('36', '50370001790') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('37', '50370001795') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('38', '50370001837') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('39', '50370001839') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('40', '50370001841') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('41', '50370001844') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('42', '50370001864') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('43', '50370001865') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('44', '50370001868') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('45', '50370001872') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('47', '50370001875') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('48', '50370001877') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('49', '50370001878') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('50', '50370001882') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('51', '50370001883') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('52', '50370001884') ;
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('53', '50370001887') ;

commit;

Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (1,'GUATEMALA','502',1);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (2,'EL SALVADOR','503',0);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (3,'HONDURAS','504',0);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (4,'NICARAGUA','505',0);
Insert into SDA_PAISES (ID,PAIS,CODIGO,STATUS) values (5,'COSTA RICA','506',0);

commit;

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

commit;

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

commit;

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

commit;

Insert into SDA_PARAMETROS_SISTEMA (ID,KEY,VALUE) values (1,'accion','2');
Insert into SDA_PARAMETROS_SISTEMA (ID,KEY,VALUE) values (2,'host','172.24.0.222');
Insert into SDA_PARAMETROS_SISTEMA (ID,KEY,VALUE) values (3,'version','1.0');

commit;

Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (1,'ns1:resultCode',1);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (2,'value',2);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (3,'item',3);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (4,'value',4);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (5,'value',5);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (6,'value',6);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (7,'item',7);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (8,'Resp',8);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (9,'item',9);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (10,'item',10);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (11,'value',12);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (12,'item',13);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (13,'value',14);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (14,'Resp',18);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (15,'item',19);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (16,'Resp',20);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (17,'string',21);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (18,'item',22);
Insert into SDA_RESPUESTAS (ID,NOMBRE,ID_METODO) values (19,'string',23);

commit;

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


commit;