--------------------------------------------------------
-- ARCHIVO CREADO  jueves-septiembre-17-2014   
-- USUARIO CREADOR Edwin Mejia - Avantia Consultores
--------------------------------------------------------
--SE ELIMINO DEFINITIVAMENTE
DROP TABLE "SDA_INSUMOS" cascade constraints;

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
DROP SEQUENCE "SQ_SDA_DEPURACION_LOG";

---------------------------------------------------------------
------------------DDL CREACION DE SECUENCIAS-------------------
---------------------------------------------------------------

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_AGREGADORES
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_AGREGADORES"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 100 ORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_METODOS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_METODOS"  MINVALUE 1 MAXVALUE 50000 INCREMENT BY 1 START WITH 1 CACHE 1000 ORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PAIS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PAIS"  MINVALUE 1 MAXVALUE 300 INCREMENT BY 1 START WITH 1 CACHE 50 ORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PARAMETROS"  MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 1 CACHE 1000 ORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESPUESTAS"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 1 CACHE 1000 ORDER  NOCYCLE ;

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

	CREATE SEQUENCE "SQ_SDA_PARAMETROS_SISTEMA" MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 1 CACHE 100 ORDER  NOCYCLE ;	
	
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_USUARIO_SISTEMA
--------------------------------------------------------

	CREATE SEQUENCE "SQ_SDA_USUARIO_SISTEMA" MINVALUE 2 MAXVALUE 10000 INCREMENT BY 1 START WITH 2 CACHE 100 ORDER  NOCYCLE ;
   
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_DEPURACION_LOG
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_DEPURACION_LOG"  MINVALUE 1 MAXVALUE 100000000 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;

   
   
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
		"ESTADO" NUMBER,
		"NOMBRE" VARCHAR2(255 BYTE), 
		"USUARIO" VARCHAR2(255 BYTE), 
		"CONTRASENIA" VARCHAR2(255 BYTE), 
		"END_POINT" VARCHAR2(1000 BYTE),
		"SEGURIDAD" NUMBER,
		"ORDEN_EJECUCION" NUMBER,
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
 
   COMMENT ON COLUMN "SDA_METODOS"."ESTADO" IS 'estado del metodo del servicio web de los agregadores';
   
   COMMENT ON COLUMN "SDA_METODOS"."NOMBRE" IS 'nombre del metodo del servicio web de los agregadores';
   
   COMMENT ON COLUMN "SDA_METODOS"."USUARIO" IS 'USUARIO del metodo del servicio web de los agregadores';
   
   COMMENT ON COLUMN "SDA_METODOS"."CONTRASENIA" IS 'CONTRASENIA del metodo del servicio web de los agregadores';
   
   COMMENT ON COLUMN "SDA_METODOS"."END_POINT" IS 'END_POINT del metodo del servicio web de los agregadores';
   
   COMMENT ON COLUMN "SDA_METODOS"."SEGURIDAD" IS 'SEGURIDAD significa si saldra por el puerto de http o por el puerto del https el metodo del servicio web de los agregadores';
   
   COMMENT ON COLUMN "SDA_METODOS"."ORDEN_EJECUCION" IS 'ORDEN_EJECUCION del metodo del servicio web de los agregadores';
   
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
		"RESPUESTA" VARCHAR2(4000 BYTE),
		"ENVIO" VARCHAR2(4000 BYTE),
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
 
  ALTER TABLE "SDA_METODOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("END_POINT" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("INPUTMESSAGETEXT" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_METODOS" MODIFY ("ORDEN_EJECUCION" NOT NULL ENABLE);
  
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


/*
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('1', '50370001635')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('2', '50370001639')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('3', '50370001647')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('4', '50370001650')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('5', '50370001659')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('6', '50370001660')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('7', '50255846245')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('8', '50247166159')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('9', '50242155220')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('10', '50242435799')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('11', '50242107214')
INSERT INTO "CLIENTE_TEL" (ID, NUMERO) VALUES ('12', '50247009375')
COMMIT;

/*
