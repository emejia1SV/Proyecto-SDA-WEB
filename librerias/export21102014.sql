-----------------------------------------------------------
-- ARCHIVO CREADO  LUNES	-	13	-	OCTUBRE	-	2014   
-- USUARIO CREADOR 		Edwin Mejia - Avantia Consultores
-----------------------------------------------------------

DROP TABLE "CLIENTE_TEL" 				cascade constraints;
DROP TABLE "SDA_PAISES" 				cascade constraints;
DROP TABLE "SDA_AGREGADORES" 			cascade constraints;
DROP TABLE "SDA_METODOS" 				cascade constraints;
DROP TABLE "SDA_PARAMETROS" 			cascade constraints;
DROP TABLE "SDA_RESPUESTAS" 			cascade constraints;
DROP TABLE "SDA_RESULTADOS_RESPUESTA" 	cascade constraints;
DROP TABLE "SDA_LOG_DEPURACION" 		cascade constraints;
DROP TABLE "SDA_PARAMETROS_SISTEMA" 	cascade constraints;
DROP TABLE "SDA_USUARIO_SISTEMA" 		cascade constraints;
DROP TABLE "SDA_CAT_RESPUESTAS" 		cascade constraints;
DROP TABLE "SDA_CAT_RESULTADOS" 		cascade constraints;

DROP SEQUENCE "SQ_SDA_AGREGADORES";
DROP SEQUENCE "SQ_SDA_CAT_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_CAT_RESULTADO";
DROP SEQUENCE "SQ_SDA_LOG_DEPURACION";
DROP SEQUENCE "SQ_SDA_METODOS";
DROP SEQUENCE "SQ_SDA_PAIS";
DROP SEQUENCE "SQ_SDA_PARAMETROS";
DROP SEQUENCE "SQ_SDA_PARAMETROS_SISTEMA";
DROP SEQUENCE "SQ_SDA_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_RESULTADO_RESPUESTAS";
DROP SEQUENCE "SQ_SDA_USUARIO_SISTEMA";


--------------------------------------------------------------------------------------------------
------------------------------------DDL CREACION DE SECUENCIAS------------------------------------
--------------------------------------------------------------------------------------------------

--------------------------------------------------------
--  DDL for Sequence SQ_SDA_LOG_DEPURACION
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_LOG_DEPURACION"  		MINVALUE 1 MAXVALUE 1000000 INCREMENT BY 1 START WITH 1 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_CAT_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_CAT_RESPUESTAS"  		MINVALUE 1 MAXVALUE 1000 	INCREMENT BY 1 START WITH 9 	NOCACHE NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_CAT_RESULTADO
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_CAT_RESULTADO"  		MINVALUE 1 MAXVALUE 1000 	INCREMENT BY 1 START WITH 9 	NOCACHE NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PAIS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PAIS"  					MINVALUE 1 MAXVALUE 300 	INCREMENT BY 1 START WITH 6 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_AGREGADORES
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_AGREGADORES"  			MINVALUE 1 MAXVALUE 100000 	INCREMENT BY 1 START WITH 93 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_METODOS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_METODOS"  				MINVALUE 1 MAXVALUE 500000 	INCREMENT BY 1 START WITH 252 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PARAMETROS"  			MINVALUE 1 MAXVALUE 100000 	INCREMENT BY 1 START WITH 718 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESPUESTAS"  			MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 243 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_RESULTADO_RESPUESTAS
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_RESULTADO_RESPUESTAS"  	MINVALUE 1 MAXVALUE 100000 INCREMENT BY 1 START WITH 364 	NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_USUARIO_SISTEMA
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_USUARIO_SISTEMA"  		MINVALUE 2 MAXVALUE 10000 INCREMENT BY 1 START WITH 2 		NOCACHE  NOORDER  NOCYCLE ;
 --------------------------------------------------------
--  DDL for Sequence SQ_SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_PARAMETROS_SISTEMA"  	MINVALUE 1 MAXVALUE 1000 INCREMENT BY 1 START WITH 10 		NOCACHE  NOORDER  NOCYCLE ;
   
   
---------------------------------------------------------------
------------------DDL CREACION DE TABLAS-----------------------
---------------------------------------------------------------
   
   
   
   
--------------------------------------------------------
--  DDL for Table CLIENTE_TEL
--------------------------------------------------------

  CREATE TABLE "CLIENTE_TEL" 
   (	"ID" NUMBER, 
		"NUMERO" VARCHAR2(20 BYTE)
   ) ;

--------------------------------------------------------
--  DDL for Table SDA_PAISES
--------------------------------------------------------

  CREATE TABLE "SDA_PAISES" 
   (	"ID" NUMBER, 
		"PAIS" VARCHAR2(100 BYTE), 
		"CODIGO" VARCHAR2(10 BYTE), 
		"STATUS" NUMBER
   ) ;
 

   COMMENT ON COLUMN "SDA_PAISES"."ID" IS 'pk de la tabla SDA_PAISES de donde sera ejecutado el agregador';
 
   COMMENT ON COLUMN "SDA_PAISES"."PAIS" IS 'El nombre del pais de donde sera ejecutado en agregador';
 
   COMMENT ON COLUMN "SDA_PAISES"."CODIGO" IS 'El codigo de pais de donde sera ejecutado en agregador';
 
   COMMENT ON COLUMN "SDA_PAISES"."STATUS" IS 'El estado del pais de donde sera ejecutado en agregador';
--------------------------------------------------------
--  DDL for Table SDA_AGREGADORES
--------------------------------------------------------

  CREATE TABLE "SDA_AGREGADORES" 
   (	"ID" NUMBER, 
		"NOMBRE_AGREGADOR" VARCHAR2(255 BYTE), 
		"ESTADO" NUMBER, 
		"ID_PAIS" NUMBER
   ) ;
 

   COMMENT ON COLUMN "SDA_AGREGADORES"."ID" IS 'pk de la tabla SDA_AGREGADORES';
 
   COMMENT ON COLUMN "SDA_AGREGADORES"."NOMBRE_AGREGADOR" IS 'El nombre del agregador';
 
   COMMENT ON COLUMN "SDA_AGREGADORES"."ESTADO" IS 'El estado del agregador';
 
   COMMENT ON COLUMN "SDA_AGREGADORES"."ID_PAIS" IS 'fk con la tabla paises del agregador';
--------------------------------------------------------
--  DDL for Table SDA_CAT_RESPUESTAS
--------------------------------------------------------

  CREATE TABLE "SDA_CAT_RESPUESTAS" 
   (	"ID" NUMBER, 
		"NOMBRE" VARCHAR2(20 BYTE)
   )  ;
 

   COMMENT ON COLUMN "SDA_CAT_RESPUESTAS"."ID" IS 'pk de la tabla de SDA_CAT_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_CAT_RESPUESTAS"."NOMBRE" IS 'nombre del parametro a recibir el servicio web de los agregadores cada uno de estos sera guardado en la tabla de logs';
--------------------------------------------------------
--  DDL for Table SDA_CAT_RESULTADOS
--------------------------------------------------------

  CREATE TABLE "SDA_CAT_RESULTADOS" 
   (	"ID" NUMBER, 
		"DATO" VARCHAR2(100 BYTE), 
		"VALOR" VARCHAR2(100 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  CREATE TABLE "SDA_LOG_DEPURACION" 
   (	"ID" NUMBER, 
		"SUSCRIPTOR" VARCHAR2(50 BYTE), 
		"RESPUESTA" CLOB, 
		"ENVIO" CLOB, 
		"ESTADO_TRANSACCION" VARCHAR2(255 BYTE), 
		"DESCRIPCION_ESTADO" VARCHAR2(4000 BYTE), 
		"FECHA_TRANSACCION" TIMESTAMP (6), 
		"TIPO_TRANSACCION" VARCHAR2(50 BYTE), 
		"ID_METODO" NUMBER, 
		"ID_USUARIO_SISTEMA" NUMBER
   )  ;
 

   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ID" IS 'pk de la tabla de SDA_LOG_DEPURACION';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."SUSCRIPTOR" IS 'numero de telefono que se desea depurar';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."RESPUESTA" IS 'respuesta obtenida al invocar al metodo web del servicio de los agregadores';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ENVIO" IS 'archivo enviado al servicio de los agregadores';
 
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ESTADO_TRANSACCION" IS 'estado de la depuracion la cual sera mostrada en el reporte';
   
   COMMENT ON COLUMN "SDA_LOG_DEPURACION"."ESTADO_TRANSACCION" IS 'descripcion del estado de la depuracion la cual sera mostrada en el dialogo del reporte';
 
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
		"SOAPACTIONURI" VARCHAR2(255), 
		"CONTENT_TYPE" VARCHAR2(255)
   )  ;
 

   COMMENT ON COLUMN "SDA_METODOS"."ID" IS 'pk de la tabla metodos de los servicios web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."ID_AGREGADOR" IS 'fk relacion con la tabla de agregadores de los servicios web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."METODO" IS 'el id del tipo metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."USUARIO" IS 'USUARIO del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."CONTRASENIA" IS 'CONTRASENIA del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."END_POINT" IS 'END_POINT del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."SEGURIDAD" IS 'SEGURIDAD significa si saldra por el puerto de http o por el puerto del https el metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."INPUTMESSAGETEXT" IS 'el cuerpo del mensaje del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."SOAPACTIONURI" IS 'SOAPACTIONURI dato requerido para el parseo automatico del metodo del servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_METODOS"."CONTENT_TYPE" IS 'el tipo de contenido del asmx';
   
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS" 
   (	"ID" NUMBER, 
		"NOMBRE" VARCHAR2(255 BYTE), 
		"ID_METODO" NUMBER
   )  ;
 

   COMMENT ON COLUMN "SDA_PARAMETROS"."ID" IS 'pk de la tabla de SDA_PARAMETROS';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."NOMBRE" IS 'nombre del parametro a enviar en el servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."ID_METODO" IS 'fk con la tabla de metodos';
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS_SISTEMA" 
   (	"ID" NUMBER, 
		"KEY" VARCHAR2(255 BYTE), 
		"VALUE" VARCHAR2(255 BYTE)
   )  ;
 

   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."ID" IS 'pk de la tabla de SDA_PARAMETROS_SISTEMA';
 
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."KEY" IS 'nombre del parametro que sera utilizado dentro del sistema';
 
   COMMENT ON COLUMN "SDA_PARAMETROS_SISTEMA"."VALUE" IS 'valor del parametro que sera utilizado dentro del sistema';
--------------------------------------------------------
--  DDL for Table SDA_RESPUESTAS
--------------------------------------------------------

  CREATE TABLE "SDA_RESPUESTAS" 
   (	"ID" NUMBER, 
		"NOMBRE" VARCHAR2(255 BYTE), 
		"ID_RESPUESTA" NUMBER, 
		"ID_METODO" NUMBER
   )  ;
 

   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID" IS 'pk de la tabla de SDA_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."NOMBRE" IS 'nombre del parametro a recibir el servicio web de los agregadores cada uno de estos sera guardado en la tabla de logs';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID_RESPUESTA" IS 'fk con la tabla de SDA_CAT_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESPUESTAS"."ID_METODO" IS 'fk con la tabla de metodos';
--------------------------------------------------------
--  DDL for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  CREATE TABLE "SDA_RESULTADOS_RESPUESTA" 
   (	"ID" NUMBER, 
		"ID_RESPUESTA" NUMBER, 
		"VALOR" VARCHAR2(255 BYTE), 
		"DATO" VARCHAR2(20 BYTE), 
		"ID_RESULTADO" NUMBER
   )  ;
 

   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID" IS 'pk de la tabla de SDA_RESPUESTAS';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID_RESPUESTA" IS 'fk con la tabla de SDA_RESPUESTAS';
   
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."ID_RESULTADO" IS 'fk con la tabla de SDA_CAT_RESULTADOS';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."VALOR" IS 'el VALOR que se considerara con el dato que se espera retorne en la respuesta';
 
   COMMENT ON COLUMN "SDA_RESULTADOS_RESPUESTA"."DATO" IS 'el dato que se espera retorne en la respuesta';
--------------------------------------------------------
--  DDL for Table SDA_USUARIO_SISTEMA
--------------------------------------------------------

  CREATE TABLE "SDA_USUARIO_SISTEMA" 
   (	"ID" NUMBER, 
		"USUARIO" VARCHAR2(255 BYTE),  
		"ESTADO" NUMBER
   )  ;
 

   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."ID" IS 'pk de la tabla de SDA_USUARIO_SISTEMA';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."USUARIO" IS 'nombre del usuario con permisos de entrar al sistema';
 
   COMMENT ON COLUMN "SDA_USUARIO_SISTEMA"."ESTADO" IS 'estado del usuario con permisos de entrar al sistema';

   
   
 
--------------------------------------------------------
--  DDL for Index CLIENTE_TEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CLIENTE_TEL_PK" ON "CLIENTE_TEL" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_AGREGADORES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_AGREGADORES_PK" ON "SDA_AGREGADORES" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_CAT_RESPUESTAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_CAT_RESPUESTAS_PK" ON "SDA_CAT_RESPUESTAS" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_CAT_RESULTADOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_CAT_RESULTADOS_PK" ON "SDA_CAT_RESULTADOS" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_LOG_DEPURACION_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_LOG_DEPURACION_PK" ON "SDA_LOG_DEPURACION" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_METODOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_METODOS_PK" ON "SDA_METODOS" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_PAISES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PAISES_PK" ON "SDA_PAISES" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_PARAMETROS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PARAMETROS_PK" ON "SDA_PARAMETROS" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_PARAMETROS_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_PARAMETROS_SISTEMA_PK" ON "SDA_PARAMETROS_SISTEMA" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_RESPUESTA_PK" ON "SDA_RESPUESTAS" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_RESULTADOS_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_RESULTADOS_RESPUESTA_PK" ON "SDA_RESULTADOS_RESPUESTA" ("ID");
--------------------------------------------------------
--  DDL for Index SDA_USUARIO_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SDA_USUARIO_SISTEMA_PK" ON "SDA_USUARIO_SISTEMA" ("ID");
   
  
---------------------------------------------------------------
-------------------DDL CREATE CONSTRAINTS----------------------
---------------------------------------------------------------

 
 
--------------------------------------------------------
--  Constraints for Table SDA_CAT_RESULTADOS
--------------------------------------------------------

  ALTER TABLE "SDA_CAT_RESULTADOS" ADD CONSTRAINT "SDA_CAT_RESULTADOS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_CAT_RESULTADOS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_CAT_RESULTADOS" MODIFY ("DATO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_CAT_RESULTADOS" MODIFY ("VALOR" NOT NULL ENABLE);
  
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
--  Constraints for Table SDA_CAT_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_CAT_RESPUESTAS" MODIFY ("ID" NOT NULL ENABLE);
  
  ALTER TABLE "SDA_CAT_RESPUESTAS" ADD CONSTRAINT "SDA_CAT_RESPUESTAS_PK" PRIMARY KEY ("ID") ENABLE; 
 
  ALTER TABLE "SDA_CAT_RESPUESTAS" MODIFY ("NOMBRE" NOT NULL ENABLE);
  
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

  ALTER TABLE "SDA_RESPUESTAS" 
    ADD CONSTRAINT "SDA_CAT_RESPUESTAS_FK" FOREIGN KEY ("ID_RESPUESTA")
      REFERENCES "SDA_CAT_RESPUESTAS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_RESULTADOS_RESPUESTA
--------------------------------------------------------

  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" 
	ADD CONSTRAINT "SDA_RESULTADOS_RESPUESTA_FK1" FOREIGN KEY ("ID_RESPUESTA")
	  REFERENCES "SDA_RESPUESTAS" ("ID") ENABLE;
	  
  ALTER TABLE "SDA_RESULTADOS_RESPUESTA" 
	ADD CONSTRAINT "SDA_RESULTADOS_RESPUESTA_FK2" FOREIGN KEY ("ID_RESULTADO")
	  REFERENCES "SDA_CAT_RESULTADOS" ("ID") ENABLE;
	  
--------------------------------------------------------
--  Ref Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" 
    ADD CONSTRAINT "SDA_LOG_DEPURACION_METODOS_FK" FOREIGN KEY ("ID_METODO")
      REFERENCES "SDA_METODOS" ("ID") ENABLE;

  ALTER TABLE "SDA_LOG_DEPURACION" 
    ADD CONSTRAINT "SDA_LOG_USUARIO_FK" FOREIGN KEY ("ID_USUARIO_SISTEMA")
      REFERENCES "SDA_USUARIO_SISTEMA" ("ID") ENABLE;


SET DEFINE OFF;
Insert into SDA_PAISES
   (ID, PAIS, CODIGO, STATUS)
 Values
   (1, 'GUATEMALA', '502', 1);
Insert into SDA_PAISES
   (ID, PAIS, CODIGO, STATUS)
 Values
   (2, 'EL SALVADOR', '503', 1);
Insert into SDA_PAISES
   (ID, PAIS, CODIGO, STATUS)
 Values
   (3, 'HONDURAS', '504', 1);
Insert into SDA_PAISES
   (ID, PAIS, CODIGO, STATUS)
 Values
   (4, 'NICARAGUA', '505', 1);
Insert into SDA_PAISES
   (ID, PAIS, CODIGO, STATUS)
 Values
   (5, 'COSTA RICA', '506', 1);
COMMIT;


SET DEFINE OFF;
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (450, 'timeOutWebServices', '5000');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (1, 'accion', '2');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (2, 'version', '1.0');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (3, 'host1', '172.24.0.222');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (4, 'host2', '172.24.0.222');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (5, 'host3', '172.24.0.222');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (6, 'host4', '172.24.0.222');
Insert into SDA_PARAMETROS_SISTEMA
   (ID, KEY, VALUE)
 Values
   (7, 'host5', '172.24.0.222');
COMMIT;


SET DEFINE OFF;
Insert into SDA_USUARIO_SISTEMA
   (ID, USUARIO, ESTADO)
 Values
   (1, 'admin', 1);
Insert into SDA_USUARIO_SISTEMA
   (ID, USUARIO, ESTADO)
 Values
   (400, 'edwina.mejia', 1);
Insert into SDA_USUARIO_SISTEMA
   (ID, USUARIO, ESTADO)
 Values
   (401, 'jose.molina', 1);
COMMIT;


	SET DEFINE OFF;
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (7, 'anyType');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (1, 'item');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (2, 'ns1:resultCode');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (3, 'Resp');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (4, 'Value');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (5, 'Return');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (6, 'string');
Insert into SDA_CAT_RESPUESTAS
   (ID, NOMBRE)
 Values
   (8, 'ns1:statusCode');
COMMIT;



SET DEFINE OFF;
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (1, '0', 'Fallo');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (2, '1', 'Exito');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (3, '2', 'the msisdn format is wrong');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (4, '3', 'the msisdn is not existed (for delete black list)');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (5, '4', 'the ASPID is not existed');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (6, '1', 'the msisdn has already existed');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (7, '5', 'the serviceID is not existed');
Insert into SDA_CAT_RESULTADOS
   (ID, DATO, VALOR)
 Values
   (8, '9', 'system SMT error');
COMMIT;


SET DEFINE OFF;
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (85, 'OPRATEL', 1, 5);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (86, 'TELEVIDA', 1, 5);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (87, 'SMT', 1, 5);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (76, 'CDC', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (77, 'OPRATEL', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (70, 'BIZNET (CELUMANIX)', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (71, 'CONTENTAMOBILE', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (72, 'GRUPO M', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (73, 'INTERACTIVE MEDIA', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (75, 'NEOMOBILE', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (69, 'BITE', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (1, 'MOBILE', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (2, 'CONTENTAMOBILE', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (3, 'TELEVIDA', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (5, 'WIRELES IDEA', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (6, 'WAU', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (7, 'TECH4MOBILE', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (9, 'ZED', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (10, 'BINBIT', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (11, 'TIMWE', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (12, 'OPRATEL', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (13, 'MOVIXLA', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (14, 'GRUPO M', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (15, 'XURPAS', 0, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (16, 'SMS AMERICAS', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (17, 'WORLD2 MOBILE', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (19, 'CRONOS', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (20, 'PINGSA', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (22, 'BIZNET (CELUMANIX)', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (23, 'VAS LATIN', 0, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (24, 'NEOMOBILE', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (26, 'SMT', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (27, 'BINBIT', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (28, 'BITWORKS', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (29, 'BIZNET (CELUMANIX)', 0, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (30, 'CONTENTAMOBILE', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (32, 'CRONOS', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (34, 'GRUPO M', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (35, 'MOBILE', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (36, 'MOVIXLA', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (37, 'OPRATEL', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (40, 'TEAM SOURCING', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (41, 'TELEVIDA', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (42, 'TIMWE', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (43, 'VAS LATIN', 0, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (49, 'BIZNET_CELUMANIX', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (50, 'CONTENTAMOBILE', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (51, 'CRONOS', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (52, 'GRUPO_M', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (53, 'MEDIA_INTERACTIVA', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (54, 'MOBILE', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (55, 'MOVIXLA', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (56, 'NEOMOBILE', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (57, 'NETMOVILE', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (58, 'OPRATEL', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (59, 'SMS_AMERICAS', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (60, 'TELENICA', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (61, 'TELEVIDA', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (62, 'TEMOGLO', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (63, 'TIMWE', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (64, 'VAS_LATIN', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (65, 'WAU', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (66, 'WIRELES_IDEA', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (68, 'ZED', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (74, 'MOBILE', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (78, 'SMT', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (79, 'SMT', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (80, 'SMT', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (81, 'CONTENTAMOBILE', 1, 5);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (83, 'GRUPO M', 1, 5);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (84, 'MOBILE', 1, 5);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (90, 'CDC', 1, 3);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (91, 'CDC', 1, 4);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (88, 'CDC', 1, 1);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (89, 'CDC', 1, 2);
Insert into SDA_AGREGADORES
   (ID, NOMBRE_AGREGADOR, ESTADO, ID_PAIS)
 Values
   (92, 'CDC', 1, 5);
COMMIT;



SET DEFINE OFF;
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (12, 19, 1, NULL, 'neef1he7Az5thaimoojiemahChoy0v', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></hdc:listaNegra></soapenv:Body></soapenv:Envelope>', 'hdc:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (13, 19, 2, NULL, 'neef1he7Az5thaimoojiemahChoy0v', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></hdc:consultaServicios></soapenv:Body></soapenv:Envelope>', 'hdc:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (14, 19, 3, NULL, 'neef1he7Az5thaimoojiemahChoy0v', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></hdc:bajaServicios></soapenv:Body></soapenv:Envelope>', 'hdc:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (18, 14, 1, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (19, 14, 2, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (20, 14, 3, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (21, 1, 1, 'cl4w0d.11', 'c45pe2', 
    'http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:listaNegra><mob:movil>_*movil_*</mob:movil><mob:accion>_*accion_*</mob:accion><mob:pass>_*pass_*</mob:pass></mob:listaNegra></soapenv:Body></soapenv:Envelope>', 'mob:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (22, 1, 2, 'cl4w0d.11', 'c45pe2', 
    'http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:consultaServicios><mob:movil>_*movil_*</mob:movil><mob:pass>_*pass_*</mob:pass></mob:consultaServicios></soapenv:Body></soapenv:Envelope>', 'mob:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (23, 1, 3, 'cl4w0d.11', 'c45pe2', 
    'http://mobilemedios.com/wsmedios/clarogt/wsCLAGT.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:bajaServicios><mob:movil>_*movil_*</mob:movil><mob:servicio>_*servicio_*</mob:servicio><mob:mcorta>_*mcorta_*</mob:mcorta><mob:pass>_*pass_*</mob:pass></mob:bajaServicios></soapenv:Body></soapenv:Envelope>', 'mob:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (24, 13, 1, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wss:listaNegra></soapenv:Body></soapenv:Envelope>', 'wss:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (25, 13, 2, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wss:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wss:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (26, 13, 3, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroGtWS', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wss:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wss:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (30, 12, 1, NULL, 'cl4r0gu4t3m4l4', 
    'http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope> ', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (31, 12, 2, NULL, 'cl4r0gu4t3m4l4', 
    'http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (32, 12, 3, NULL, 'cl4r0gu4t3m4l4', 
    'http://www.opratel.com/testing/ws_claro_guatemala/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (34, 20, 1, NULL, ')866k7@7K[Y*WGO', 
    'http://api.pingsa.com/clarogt/webService.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></soapenv:Body></soapenv:Envelope>', 'soapenv:Body', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (35, 20, 2, NULL, ')866k7@7K[Y*WGO', 
    'http://api.pingsa.com/clarogt/webService.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></soapenv:Body></soapenv:Envelope>', 'soapenv:Body', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (36, 20, 3, NULL, ')866k7@7K[Y*WGO', 
    'http://api.pingsa.com/clarogt/webService.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></soapenv:Body></soapenv:Envelope>', 'soapenv:Body', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (37, 16, 1, NULL, 'cl4r0_g04t3m4l4', 
    'http://reports.smsamericas.net/ws_claro/Service.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></sms:listaNegra></soapenv:Body></soapenv:Envelope>', 'sms:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (38, 16, 2, NULL, 'cl4r0_g04t3m4l4', 
    'http://reports.smsamericas.net/ws_claro/Service.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></sms:consultaServicios></soapenv:Body></soapenv:Envelope>', 'sms:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (39, 16, 3, NULL, 'cl4r0_g04t3m4l4', 
    'http://reports.smsamericas.net/ws_claro/Service.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></sms:bajaServicios></soapenv:Body></soapenv:Envelope>', 'sms:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (40, 7, 1, NULL, 'wssrvasocs', 
    'http://www.tech4mobile.com/WS_ServiciosAsociados/Service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (41, 7, 2, NULL, 'wssrvasocs', 
    'http://www.tech4mobile.com/WS_ServiciosAsociados/Service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (42, 7, 3, NULL, 'wssrvasocs', 
    'http://www.tech4mobile.com/WS_ServiciosAsociados/Service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (43, 3, 1, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (44, 3, 2, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>	', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (45, 3, 3, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (46, 11, 1, NULL, 'guaclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>', 'clar:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (47, 11, 2, NULL, 'guaclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>', 'clar:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (48, 11, 3, NULL, 'guaclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>', 'clar:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (49, 23, 1, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wsb:listaNegra></soapenv:Body></soapenv:Envelope>', 'wsb:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (50, 23, 2, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsb:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wsb:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (51, 23, 3, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsb:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wsb:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (52, 6, 1, NULL, 'w@uCEN539', 
    'http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (53, 6, 2, NULL, 'w@uCEN539', 
    'http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (54, 6, 3, NULL, 'w@uCEN539', 
    'http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (55, 5, 1, NULL, 'W1c0S3rv1c3', 
    'http://php.wirelessidea.com/claro_services/gt/ws_gt.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (56, 5, 2, NULL, 'W1c0S3rv1c3', 
    'http://php.wirelessidea.com/claro_services/gt/ws_gt.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (57, 5, 3, NULL, 'W1c0S3rv1c3', 
    'http://php.wirelessidea.com/claro_services/gt/ws_gt.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (58, 17, 1, NULL, '$zf3RmyP', 
    'http://siglo21.conceptomovil.com/apps/suscripcion/wsc/suscrimovil_server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:suscripcionesmovil"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (59, 17, 2, NULL, '$zf3RmyP', 
    'http://siglo21.conceptomovil.com/apps/suscripcion/wsc/suscrimovil_server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:suscripcionmovil"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (60, 17, 3, NULL, '$zf3RmyP', 
    'http://siglo21.conceptomovil.com/apps/suscripcion/wsc/suscrimovil_server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:suscripcionmovil"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (61, 15, 1, NULL, 'C@GT14', 
    'http://108.166.12.47', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (1, 26, 1, 'PA00000737', 'Admin111', 
    'https://hub.americamovil.com/sag/services/blackgrayService', 1, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://www.csapi.org/schema/parlayx/blackgray/v1_0/local"><soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"><wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:Username>_*user_*</wsse:Username><wsse:Password Type="...#PasswordDigest">_*passSMT_*</wsse:Password><wsse:Nonce>_*nonce_*</wsse:Nonce><wsse:Created>_*dateSMT_*</wsse:Created></wsse:UsernameToken></wsse:Security><tns:RequestSOAPHeader xmlns:tns="http://www.huawei.com.cn/schema/common/v2_1"><tns:AppId>35000001000001</tns:AppId><tns:TransId>2014011716010012345</tns:TransId><tns:OA>_*movil_*</tns:OA><tns:FA>_*movil_*</tns:FA></tns:RequestSOAPHeader></soapenv:Header><soapenv:Body><loc:deleteGrayList><loc:version>_*version_*</loc:version><loc:grayList><grayee><msisdn>_*movil_*</msisdn>    </grayee></loc:grayList></loc:deleteGrayList></soapenv:Body></soapenv:Envelope>', 'loc:deleteGrayList', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (2, 10, 1, NULL, 'ebea4edabf', 
    'http://webservices.binbit.com/claro_gt/claro_gt.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>', 'clar:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (3, 10, 2, NULL, 'ebea4edabf', 
    'http://webservices.binbit.com/claro_gt/claro_gt.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>', 'clar:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (4, 10, 3, NULL, 'ebea4edabf', 
    'http://webservices.binbit.com/claro_gt/claro_gt.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><marcacion xsi:type="xsd:string">_*marcacion_*</marcacion><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>', 'clar:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (5, 22, 1, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (6, 22, 2, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (7, 22, 3, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (8, 2, 1, '7182818284', '7182818284', 
    'http://callcenter2.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><operacion xsi:type="xsd:string">_*operacion_*</operacion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (9, 2, 2, '7182818284', '7182818284', 
    'http://callcenter2.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (10, 2, 3, '7182818284', '7182818284', 
    'http://callcenter2.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (184, 64, 1, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wsb:listaNegra></soapenv:Body></soapenv:Envelope>', 'wsb:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (185, 64, 2, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsb:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wsb:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (186, 64, 3, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsb:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wsb:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (187, 65, 1, NULL, 'w@uCEN539', 
    'http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (188, 65, 2, NULL, 'w@uCEN539', 
    'http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (189, 65, 3, NULL, 'w@uCEN539', 
    'http://wauservices.waumovil.net/ServiceSubscription/SubscriptionAdmin.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (190, 66, 1, NULL, 'W1c0S3rv1c3', 
    'http://php.wirelessidea.com/claro_services/ni/ws_ni.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (191, 66, 2, NULL, 'W1c0S3rv1c3', 
    'http://php.wirelessidea.com/claro_services/ni/ws_ni.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (192, 66, 3, NULL, 'W1c0S3rv1c3', 
    'http://php.wirelessidea.com/claro_services/ni/ws_ni.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:claro_services_cc_ws"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (193, 68, 1, NULL, '1234', 
    'http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><action xsi:type="xsd:string">_*accion_*</action><pass xsi:type="xsd:string">_*pass_*</pass></wsc:listaNegra></soapenv:Body></soapenv:Envelope>', 'wsc:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (194, 68, 2, NULL, '1234', 
    'http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsc:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wsc:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (195, 68, 3, NULL, '1234', 
    'http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsc:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wsc:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (94, 35, 1, NULL, 'claro', 
    'http://mobilemedios.com/wsmedios/clarosv/wsCLASV.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:listaNegra><mob:movil>_*movil_*</mob:movil><mob:accion>_*accion_*</mob:accion><mob:pass>_*pass_*</mob:pass></mob:listaNegra></soapenv:Body></soapenv:Envelope>', 'mob:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (97, 36, 1, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroSvWS', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.sv.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></wss:listaNegra></soapenv:Body></soapenv:Envelope>', 'wss:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (99, 36, 3, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroSvWS', 0, '<soapenv:Envelope  soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.sv.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></wss:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wss:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (100, 37, 1, NULL, 'cl4r0gu473m4l4', 
    'http://www.opratel.com/testing/ws_claro/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (71, 27, 2, NULL, 'ebea4edabf', 
    'http://webservices.binbit.com/claro_gt/claro_gt.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>', 'clar:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (72, 27, 3, NULL, 'ebea4edabf', 
    'http://webservices.binbit.com/claro_gt/claro_gt.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_gt/claro_gt.php"><soapenv:Header/><soapenv:Body><clar:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><marcacion>_*mcorta_*</marcacion><pass>_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>', 'clar:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (73, 28, 1, 'y512f2', 'y512f2', 
    'http://claro.bitworks.com.sv/wsserviciosclaro.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (74, 28, 2, 'y512f2', 'y512f2', 
    'http://claro.bitworks.com.sv/wsserviciosclaro.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (75, 28, 3, 'y512f2', 'y512f2', 
    'http://claro.bitworks.com.sv/wsserviciosclaro.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (101, 37, 2, NULL, 'cl4r0gu473m4l4', 
    'http://www.opratel.com/testing/ws_claro/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (102, 37, 3, NULL, 'cl4r0gu473m4l4', 
    'http://www.opratel.com/testing/ws_claro/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (115, 42, 1, NULL, 'salclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>', 'clar:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (116, 42, 2, NULL, 'salclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>', 'clar:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (119, 43, 1, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wsb:listaNegra></soapenv:Body></soapenv:Envelope>', 'wsb:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (95, 35, 2, NULL, 'claro', 
    'http://mobilemedios.com/wsmedios/clarosv/wsCLASV.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:consultaServicios><mob:movil>_*movil_*</mob:movil><mob:pass>_*pass_*</mob:pass></mob:consultaServicios></soapenv:Body></soapenv:Envelope>', 'mob:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (96, 35, 3, NULL, 'claro', 
    'http://mobilemedios.com/wsmedios/clarosv/wsCLASV.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:bajaServicios><mob:movil>_*movil_*</mob:movil><mob:servicio>_*servicio_*</mob:servicio><mob:mcorta>_*mcorta_*</mob:mcorta><mob:pass>_*pass_*</mob:pass></mob:bajaServicios></soapenv:Body></soapenv:Envelope>', 'mob:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (98, 36, 2, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroSvWS', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.sv.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></wss:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wss:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (70, 27, 1, NULL, 'ebea4edabf', 
    'http://webservices.binbit.com/claro_gt/claro_gt.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://webservices.binbit.com/claro_sv/claro_sv.php"><soapenv:Header/><soapenv:Body><clar:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>', 'clar:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (109, 40, 1, NULL, 'CLAROSV', 
    'http://98.129.194.129/ws/sv/claro/ws_server_clarosv.php', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:teamclarosvwsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><password>_*pass_*</password></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (110, 40, 2, NULL, 'CLAROSV', 
    'http://98.129.194.129/ws/sv/claro/ws_server_clarosv.php', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:teamclarosvwsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><password>_*pass_*</password></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (111, 40, 3, NULL, 'CLAROSV', 
    'http://98.129.194.129/ws/sv/claro/ws_server_clarosv.php', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:teamclarosvwsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><password>_*pass_*</password></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (112, 41, 1, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (113, 41, 2, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>	', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (114, 41, 3, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (117, 42, 3, NULL, 'salclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>', 'clar:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (85, 32, 1, NULL, 'gua6needaiwa5dook6thaicaiTo4oh', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></hdc:listaNegra></soapenv:Body></soapenv:Envelope>', 'hdc:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (91, 34, 1, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (158, 55, 3, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroNiWS', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:bajaServicios><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wss:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wss:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (159, 56, 1, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsListaNegra.asmx', 0, '<soapenv:Envelope xmlns:tem="http://tempuri.org" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><tem:listaNegra><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (160, 56, 2, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsConsultaServicios.asmx', 0, '<soapenv:Envelope xmlns:tem="http://tempuri.org" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (161, 56, 3, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsBajaServicios.asmx', 0, '<soapenv:Envelope xmlns:tem="http://tempuri.org" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (162, 57, 1, NULL, 'n3tm0b1l3', 
    'http://smpp.netmovil.co/ServiciosClaro/ServiciosAsociados.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:net="http://netmobile.com.ni/"><soapenv:Header/><soapenv:Body><net:listaNegra><net:movil>_*movil_*</net:movil><net:accion>_*accion_*</net:accion><net:pass>_*pass_*</net:pass></net:listaNegra></soapenv:Body></soapenv:Envelope>', 'net:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (163, 57, 2, NULL, 'n3tm0b1l3', 
    'http://smpp.netmovil.co/ServiciosClaro/ServiciosAsociados.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:net="http://netmobile.com.ni/"><soapenv:Header/><soapenv:Body><net:consultaServicios><net:movil>_*movil_*</net:movil><net:pass>_*pass_*</net:pass></net:consultaServicios></soapenv:Body></soapenv:Envelope>', 'net:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (164, 57, 3, NULL, 'n3tm0b1l3', 
    'http://smpp.netmovil.co/ServiciosClaro/ServiciosAsociados.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:net="http://netmobile.com.ni/"><soapenv:Header/><soapenv:Body><net:bajaServicios><net:movil>_*movil_*</net:movil><net:servicio>_*servicio_*</net:servicio><net:mcorta>_*mcorta_*</net:mcorta><net:pass>_*pass_*</net:pass></net:bajaServicios></soapenv:Body></soapenv:Envelope>', 'net:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (166, 58, 1, NULL, 'cl4r0N1c4r4gu4', 
    'http://www.opratel.com/testing/ws_claro_nicaragua/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (167, 58, 2, NULL, 'cl4r0N1c4r4gu4', 
    'http://www.opratel.com/testing/ws_claro_nicaragua/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (168, 58, 3, NULL, 'cl4r0N1c4r4gu4', 
    'http://www.opratel.com/testing/ws_claro_nicaragua/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (169, 59, 1, NULL, 'cl4r0_n1c4r4gu4', 
    'http://reports.smsamericas.net/ws_claro/Service.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:listaNegra><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></sms:listaNegra></soapenv:Body></soapenv:Envelope>', 'sms:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (170, 59, 2, NULL, 'cl4r0_n1c4r4gu4', 
    'http://reports.smsamericas.net/ws_claro/Service.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:consultaServicios><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></sms:consultaServicios></soapenv:Body></soapenv:Envelope>', 'sms:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (92, 34, 2, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (93, 34, 3, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (146, 51, 3, NULL, '23566ed95af2d48972d9668638ba94', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></hdc:bajaServicios></soapenv:Body></soapenv:Envelope>', 'hdc:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (147, 52, 1, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (148, 52, 2, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (149, 52, 3, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (150, 53, 1, NULL, '1234', 
    'http://ws.mediainteractiva.info/CLARO-ws/MTService', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (151, 53, 2, NULL, '1234', 
    'http://ws.mediainteractiva.info/CLARO-ws/MTService', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (152, 53, 3, NULL, '1234', 
    'http://ws.mediainteractiva.info/CLARO-ws/MTService', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (153, 54, 1, NULL, 'n1c4G5v.0', 
    'http://mobilemedios.com/wsmedios/claroni/wsCLANI.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (154, 54, 2, NULL, 'n1c4G5v.0', 
    'http://mobilemedios.com/wsmedios/claroni/wsCLANI.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (155, 54, 3, NULL, 'n1c4G5v.0', 
    'http://mobilemedios.com/wsmedios/claroni/wsCLANI.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (156, 55, 1, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroNiWS', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:listaNegra><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></wss:listaNegra></soapenv:Body></soapenv:Envelope>', 'wss:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (157, 55, 2, NULL, 'm75v21x06', 
    'http://prodws.services.movixla.com/movix-ws/services/MovixSubscriptionsClaroNiWS', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wss="http://wssubscriptions.gt.claro.ws.movix.cl"><soapenv:Header/><soapenv:Body><wss:consultaServicios><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wss:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wss:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (120, 43, 2, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsb:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wsb:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (125, 43, 3, NULL, 'nc#Cb411', 
    'http://wsbjopt.vaslatin.com:8080/wsBajasClaro/wsBajasVasLatinClaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsb="http://wsbjopt.vaslatin.com/"><soapenv:Header/><soapenv:Body><wsb:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsb:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wsb:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (138, 49, 1, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (139, 49, 2, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (140, 49, 3, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (141, 50, 1, '7182818284', '7182818284', 
    'http://callcenter2.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><operacion xsi:type="xsd:string">_*accion_*</operacion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (142, 50, 2, '7182818284', '7182818284', 
    'http://callcenter2.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (143, 50, 3, '7182818284', '7182818284', 
    'http://callcenter2.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (144, 51, 1, NULL, '23566ed95af2d48972d9668638ba94', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:listaNegra><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></hdc:listaNegra></soapenv:Body></soapenv:Envelope>', 'hdc:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (145, 51, 2, NULL, '23566ed95af2d48972d9668638ba94', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></hdc:consultaServicios></soapenv:Body></soapenv:Envelope>', 'hdc:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (87, 32, 3, NULL, 'gua6needaiwa5dook6thaicaiTo4oh', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></hdc:bajaServicios></soapenv:Body></soapenv:Envelope>', 'hdc:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (172, 60, 1, NULL, 'claro', 
    'http://165.98.97.101:8080/soap.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:soapwsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (76, 29, 1, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (77, 29, 2, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (78, 29, 3, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (62, 15, 2, NULL, 'C@GT14', 
    'http://108.166.12.47', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (63, 15, 3, NULL, 'C@GT14', 
    'http://108.166.12.47', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:wsagregadores"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (64, 9, 1, NULL, '1234', 
    'http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><action xsi:type="xsd:string">_*accion_*</action><pass xsi:type="xsd:string">_*pass_*</pass></wsc:listaNegra></soapenv:Body></soapenv:Envelope>', 'wsc:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (65, 9, 2, NULL, '1234', 
    'http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></wsc:consultaServicios></soapenv:Body></soapenv:Envelope>', 'wsc:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (66, 9, 3, NULL, '1234', 
    'http://wpclaro.zed.com/external/WsClaroLatam/WsClaroLatam.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:wsc="WsClaroLatam"><soapenv:Header/><soapenv:Body><wsc:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></wsc:bajaServicios></soapenv:Body></soapenv:Envelope>', 'wsc:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (79, 30, 1, '7182818284', '7182818284', 
    'http://callcenter23.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><operacion>_*accion_*</operacion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (80, 30, 2, '7182818284', '7182818284', 
    'http://callcenter23.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (81, 30, 3, '7182818284', '7182818284', 
    'http://callcenter23.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (86, 32, 2, NULL, 'gua6needaiwa5dook6thaicaiTo4oh', 
    'http://hdclaro.cronos.mobi/', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:hdc="http://hdclaro.cronos.mobi/"><soapenv:Header/><soapenv:Body><hdc:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></hdc:consultaServicios></soapenv:Body></soapenv:Envelope>', 'hdc:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (173, 60, 2, NULL, 'claro', 
    'http://165.98.97.101:8080/soap.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:soapwsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (174, 60, 3, NULL, 'claro', 
    'http://165.98.97.101:8080/soap.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:soapwsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (175, 61, 1, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:string">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (176, 61, 2, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (177, 61, 3, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (178, 62, 1, NULL, 'Cl4r0N1', 
    'http://190.106.0.126/web/wsdl/claro.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><listaNegra><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></listaNegra></soapenv:Body></soapenv:Envelope>', 'listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (179, 62, 2, NULL, 'Cl4r0N1', 
    'http://190.106.0.126/web/wsdl/claro.php', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></consultaServicios></soapenv:Body></soapenv:Envelope>', 'consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (180, 62, 3, NULL, 'Cl4r0N1', 
    'http://190.106.0.126/web/wsdl/claro.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><bajaServicios><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></bajaServicios></soapenv:Body></soapenv:Envelope>', 'bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (181, 63, 1, NULL, 'nicclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:listaNegra soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><accion xsi:type="xsd:int">_*accion_*</accion><pass xsi:type="xsd:string">_*pass_*</pass></clar:listaNegra></soapenv:Body></soapenv:Envelope>', 'clar:listaNegra', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (182, 63, 2, NULL, 'nicclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:consultaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><pass xsi:type="xsd:string">_*pass_*</pass></clar:consultaServicios></soapenv:Body></soapenv:Envelope>', 'clar:consultaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (183, 63, 3, NULL, 'nicclaro1', 
    'http://neo2.and.timwe.com/util-andean-webservice-utility/services/ClaroWebServicePort', 0, '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:clar="http://claro.ws.andean.util.timwe.com"><soapenv:Header/><soapenv:Body><clar:bajaServicios soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/"><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></clar:bajaServicios></soapenv:Body></soapenv:Envelope>', 'clar:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (222, 80, 1, 'PA00000737', 'Admin111', 
    'https://hub.americamovil.com/sag/services/blackgrayService', 1, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://www.csapi.org/schema/parlayx/blackgray/v1_0/local"><soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"><wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:Username>_*user_*</wsse:Username><wsse:Password Type="...#PasswordDigest">_*passSMT_*</wsse:Password><wsse:Nonce>_*nonce_*</wsse:Nonce><wsse:Created>_*dateSMT_*</wsse:Created></wsse:UsernameToken></wsse:Security><tns:RequestSOAPHeader xmlns:tns="http://www.huawei.com.cn/schema/common/v2_1"><tns:AppId>35000001000001</tns:AppId><tns:TransId>2014011716010012345</tns:TransId><tns:OA>_*movil_*</tns:OA><tns:FA>_*movil_*</tns:FA></tns:RequestSOAPHeader></soapenv:Header><soapenv:Body><loc:deleteGrayList><loc:version>_*version_*</loc:version><loc:grayList><grayee><msisdn>_*movil_*</msisdn>    </grayee></loc:grayList></loc:deleteGrayList></soapenv:Body></soapenv:Envelope>', 'loc:deleteGrayList', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (223, 81, 1, NULL, '7182818284', 
    'http://callcenter32.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><operacion>_*accion_*</operacion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (224, 81, 2, NULL, '7182818284', 
    'http://callcenter32.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (239, 88, 1, NULL, NULL, 
    'http://172.17.72.244:9090/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:deleteFromBlacklistRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:deleteFromBlacklistRequest></soapenv:Body></soapenv:Envelope>', 'crm:deleteFromBlacklistRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (240, 88, 3, NULL, NULL, 
    'http://172.17.72.244:9090/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:cleanupSubscriptionRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:cleanupSubscriptionRequest></soapenv:Body></soapenv:Envelope>', 'crm:cleanupSubscriptionRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (241, 89, 1, NULL, NULL, 
    'http://172.17.72.245:9093/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:deleteFromBlacklistRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:deleteFromBlacklistRequest></soapenv:Body></soapenv:Envelope>', 'crm:deleteFromBlacklistRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (242, 89, 3, NULL, NULL, 
    'http://172.17.72.245:9093/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:cleanupSubscriptionRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:cleanupSubscriptionRequest></soapenv:Body></soapenv:Envelope>', 'crm:cleanupSubscriptionRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (244, 90, 3, NULL, NULL, 
    'http://172.17.72.244:9091/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:cleanupSubscriptionRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:cleanupSubscriptionRequest></soapenv:Body></soapenv:Envelope>', 'crm:cleanupSubscriptionRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (247, 92, 1, NULL, NULL, 
    'http://172.17.72.244:9092/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:deleteFromBlacklistRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:deleteFromBlacklistRequest></soapenv:Body></soapenv:Envelope>', 'crm:deleteFromBlacklistRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (248, 92, 3, NULL, NULL, 
    'http://172.17.72.244:9092/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:cleanupSubscriptionRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:cleanupSubscriptionRequest></soapenv:Body></soapenv:Envelope>', 'crm:cleanupSubscriptionRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (249, 24, 1, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsListaNegra.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org"><soapenv:Header/><soapenv:Body><tem:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (250, 24, 2, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsConsultaServicios.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org"><soapenv:Header/><soapenv:Body><tem:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (251, 24, 3, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsBajaServicios.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org"><soapenv:Header/><soapenv:Body><tem:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (243, 90, 1, NULL, NULL, 
    'http://172.17.72.244:9091/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:deleteFromBlacklistRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:deleteFromBlacklistRequest></soapenv:Body></soapenv:Envelope>', 'crm:deleteFromBlacklistRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (245, 91, 1, NULL, NULL, 
    'http://172.17.72.245:9094/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:deleteFromBlacklistRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:deleteFromBlacklistRequest></soapenv:Body></soapenv:Envelope>', 'crm:deleteFromBlacklistRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (246, 91, 3, NULL, NULL, 
    'http://172.17.72.245:9094/cdc-service/services/CRMService/', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:crm="http://type.ws.cdc.tecnotree.com/CRMType"><soapenv:Header/><soapenv:Body><crm:cleanupSubscriptionRequest><crm:msisdnList><crm:msisdn>_*movil_*</crm:msisdn></crm:msisdnList></crm:cleanupSubscriptionRequest></soapenv:Body></soapenv:Envelope>', 'crm:cleanupSubscriptionRequest', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (171, 59, 3, NULL, 'cl4r0_n1c4r4gu4', 
    'http://reports.smsamericas.net/ws_claro/Service.php', 0, '<soapenv:Envelope soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:sms="SMSACwsdl"><soapenv:Header/><soapenv:Body><sms:bajaServicios><movil xsi:type="xsd:string">_*movil_*</movil><servicio xsi:type="xsd:string">_*servicio_*</servicio><mcorta xsi:type="xsd:string">_*mcorta_*</mcorta><pass xsi:type="xsd:string">_*pass_*</pass></sms:bajaServicios></soapenv:Body></soapenv:Envelope>', 'sms:bajaServicios', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (209, 73, 2, NULL, '1234', 
    'http://208.109.106.202/clarows/Service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (211, 74, 1, NULL, 'h0d4rp', 
    'http://mobilemedios.com/wsmedios/clarohn/wsclahn.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:listaNegra><mob:movil>_*movil_*</mob:movil><mob:accion>_*accion_*</mob:accion><mob:pass>_*pass_*</mob:pass></mob:listaNegra></soapenv:Body></soapenv:Envelope>', 'mob:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (212, 74, 2, NULL, 'h0d4rp', 
    'http://mobilemedios.com/wsmedios/clarohn/wsclahn.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:consultaServicios><mob:movil>_*movil_*</mob:movil><mob:pass>_*pass_*</mob:pass></mob:consultaServicios></soapenv:Body></soapenv:Envelope>', 'mob:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (213, 74, 3, NULL, 'h0d4rp', 
    'http://mobilemedios.com/wsmedios/clarohn/wsclahn.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:bajaServicios><mob:movil>_*movil_*</mob:movil><mob:servicio>_*servicio_*</mob:servicio><mob:mcorta>_*mcorta_*</mob:mcorta><mob:pass>_*pass_*</mob:pass></mob:bajaServicios></soapenv:Body></soapenv:Envelope>', 'mob:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (216, 75, 3, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsBajaServicios.asmx', 0, '<soapenv:Envelope xmlns:tem="http://tempuri.org" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (196, 69, 1, NULL, '1234', 
    'http://vpsapp01.bitepublicidad.com:8080/claro-ws/ClaroWS', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:smpp="http://smpp.lucidwise.com/"><soapenv:Header/><soapenv:Body><smpp:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></smpp:listaNegra></soapenv:Body></soapenv:Envelope>', 'smpp:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (197, 69, 2, NULL, '1234', 
    'http://vpsapp01.bitepublicidad.com:8080/claro-ws/ClaroWS', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:smpp="http://smpp.lucidwise.com/"><soapenv:Header/><soapenv:Body><smpp:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></smpp:consultaServicios></soapenv:Body></soapenv:Envelope>', 'smpp:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (199, 70, 1, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (200, 70, 2, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (201, 70, 3, NULL, 'qwio2012;', 
    'http://146.82.89.83/WSSuscripcionesClaroRegional/WebService.asmx', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (202, 71, 1, '7182818284', '7182818284', 
    'http://callcenter4.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><operacion>_*accion_*</operacion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (203, 71, 2, NULL, '7182818284', 
    'http://callcenter4.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (204, 71, 3, NULL, '7182818284', 
    'http://callcenter4.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (205, 72, 1, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (207, 72, 3, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (208, 73, 1, NULL, '1234', 
    'http://208.109.106.202/clarows/Service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (210, 73, 3, NULL, '1234', 
    'http://208.109.106.202/clarows/Service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (226, 83, 1, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:listaNegra><tem:movil>_*movil_*</tem:movil><tem:accion>_*accion_*</tem:accion><tem:pass>_*pass_*</tem:pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (227, 83, 2, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (228, 83, 3, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:bajaServicios><tem:movil>_*movil_*</tem:movil><tem:servicio>_*servicio_*</tem:servicio><tem:mcorta>_*mcorta_*</tem:mcorta><tem:pass>_*pass_*</tem:pass></tem:bajaServicios></soapenv:Body></soapenv:Envelope>', 'tem:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (231, 84, 3, NULL, '38Wd$q', 
    'http://190.86.192.177/wsmedios/clarocr/wsclacr.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:bajaServicios><mob:movil>_*movil_*</mob:movil><mob:servicio>_*servicio_*</mob:servicio><mob:mcorta>_*mcorta_*</mob:mcorta><mob:pass>_*pass_*</mob:pass></mob:bajaServicios></soapenv:Body></soapenv:Envelope>', 'mob:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (234, 85, 3, NULL, 'cl4r0C0st4R1c4', 
    'http://www.opratel.com/testing/ws_claro_costarica/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (236, 86, 2, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (237, 86, 3, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (238, 87, 1, 'PA00000737', 'Admin111', 
    'https://hub.americamovil.com/sag/services/blackgrayService', 1, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://www.csapi.org/schema/parlayx/blackgray/v1_0/local"><soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"><wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:Username>_*user_*</wsse:Username><wsse:Password Type="...#PasswordDigest">_*passSMT_*</wsse:Password><wsse:Nonce>_*nonce_*</wsse:Nonce><wsse:Created>_*dateSMT_*</wsse:Created></wsse:UsernameToken></wsse:Security><tns:RequestSOAPHeader xmlns:tns="http://www.huawei.com.cn/schema/common/v2_1"><tns:AppId>35000001000001</tns:AppId><tns:TransId>2014011716010012345</tns:TransId><tns:OA>_*movil_*</tns:OA><tns:FA>_*movil_*</tns:FA></tns:RequestSOAPHeader></soapenv:Header><soapenv:Body><loc:deleteGrayList><loc:version>_*version_*</loc:version><loc:grayList><grayee><msisdn>_*movil_*</msisdn>    </grayee></loc:grayList></loc:deleteGrayList></soapenv:Body></soapenv:Envelope>', 'loc:deleteGrayList', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (229, 84, 1, NULL, '38Wd$q', 
    'http://190.86.192.177/wsmedios/clarocr/wsclacr.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:listaNegra><mob:movil>_*movil_*</mob:movil><mob:accion>_*accion_*</mob:accion><mob:pass>_*pass_*</mob:pass></mob:listaNegra></soapenv:Body></soapenv:Envelope>', 'mob:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (230, 84, 2, NULL, '38Wd$q', 
    'http://190.86.192.177/wsmedios/clarocr/wsclacr.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:mob="http://mobilemedios.com/"><soapenv:Header/><soapenv:Body><mob:consultaServicios><mob:movil>_*movil_*</mob:movil><mob:pass>_*pass_*</mob:pass></mob:consultaServicios></soapenv:Body></soapenv:Envelope>', 'mob:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (232, 85, 1, NULL, 'cl4r0C0st4R1c4', 
    'http://www.opratel.com/testing/ws_claro_costarica/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (233, 85, 2, NULL, 'cl4r0C0st4R1c4', 
    'http://www.opratel.com/testing/ws_claro_costarica/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (235, 86, 1, NULL, 'Pa55w0rd', 
    'http://190.111.8.113/appclaro/webService/appclaro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:appclaro"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (225, 81, 3, NULL, '7182818284', 
    'http://callcenter32.contentamobile.com/server.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:AltaServiciowsdl"><soapenv:Header/><soapenv:Body><urn:altaServicio><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><marcacion>_*mcorta_*</marcacion><pass>_*pass_*</pass></urn:altaServicio></soapenv:Body></soapenv:Envelope>', 'urn:altaServicio', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (214, 75, 1, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsListaNegra.asmx', 0, '<soapenv:Envelope xmlns:tem="http://tempuri.org" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><tem:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></tem:listaNegra></soapenv:Body></soapenv:Envelope>', 'tem:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (215, 75, 2, NULL, 'Neomobile', 
    'http://wsce.neomobile.net/ws_claro_services/WsConsultaServicios.asmx', 0, '<soapenv:Envelope xmlns:tem="http://tempuri.org" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (198, 69, 3, NULL, '1234', 
    'http://vpsapp01.bitepublicidad.com:8080/claro-ws/ClaroWS', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:smpp="http://smpp.lucidwise.com/"><soapenv:Header/><soapenv:Body><smpp:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></smpp:bajaServicios></soapenv:Body></soapenv:Envelope>', 'smpp:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (206, 72, 2, NULL, 'clrPsshxq678', 
    'http://ws.intertronmobile.com/Unlimited/WS.Claro.SuscripcionesSMS/service.asmx', 0, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:tem="http://tempuri.org/"><soapenv:Header/><soapenv:Body><tem:consultaServicios><tem:movil>_*movil_*</tem:movil><tem:pass>_*pass_*</tem:pass></tem:consultaServicios></soapenv:Body></soapenv:Envelope>', 'tem:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (219, 77, 3, NULL, 'cl4r0H0ndUr4s', 
    'http://www.opratel.com/testing/ws_claro_honduras/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:BajaServicioswsdl"><soapenv:Header/><soapenv:Body><urn:bajaServicios><movil>_*movil_*</movil><servicio>_*servicio_*</servicio><mcorta>_*mcorta_*</mcorta><pass>_*pass_*</pass></urn:bajaServicios></soapenv:Body></soapenv:Envelope>', 'urn:bajaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (217, 77, 1, NULL, 'cl4r0H0ndUr4s', 
    'http://www.opratel.com/testing/ws_claro_honduras/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:ListaNegrawsdl"><soapenv:Header/><soapenv:Body><urn:listaNegra><movil>_*movil_*</movil><accion>_*accion_*</accion><pass>_*pass_*</pass></urn:listaNegra></soapenv:Body></soapenv:Envelope>', 'urn:listaNegra', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (218, 77, 2, NULL, 'cl4r0H0ndUr4s', 
    'http://www.opratel.com/testing/ws_claro_honduras/ws_claro.php', 0, '<soapenv:Envelope xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:consultaservicioswsdl"><soapenv:Header/><soapenv:Body><urn:consultaServicios><movil>_*movil_*</movil><pass>_*pass_*</pass></urn:consultaServicios></soapenv:Body></soapenv:Envelope>', 'urn:consultaServicios', 'text/xml;charset=UTF-8');
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (220, 78, 1, 'PA00000737', 'Admin111', 
    'https://hub.americamovil.com/sag/services/blackgrayService', 1, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://www.csapi.org/schema/parlayx/blackgray/v1_0/local"><soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"><wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:Username>_*user_*</wsse:Username><wsse:Password Type="...#PasswordDigest">_*passSMT_*</wsse:Password><wsse:Nonce>_*nonce_*</wsse:Nonce><wsse:Created>_*dateSMT_*</wsse:Created></wsse:UsernameToken></wsse:Security><tns:RequestSOAPHeader xmlns:tns="http://www.huawei.com.cn/schema/common/v2_1"><tns:AppId>35000001000001</tns:AppId><tns:TransId>2014011716010012345</tns:TransId><tns:OA>_*movil_*</tns:OA><tns:FA>_*movil_*</tns:FA></tns:RequestSOAPHeader></soapenv:Header><soapenv:Body><loc:deleteGrayList><loc:version>_*version_*</loc:version><loc:grayList><grayee><msisdn>_*movil_*</msisdn>    </grayee></loc:grayList></loc:deleteGrayList></soapenv:Body></soapenv:Envelope>', 'loc:deleteGrayList', NULL);
Insert into SDA_METODOS
   (ID, ID_AGREGADOR, METODO, USUARIO, CONTRASENIA, 
    END_POINT, SEGURIDAD, INPUTMESSAGETEXT, SOAPACTIONURI, CONTENT_TYPE)
 Values
   (221, 79, 1, 'PA00000737', 'Admin111', 
    'https://hub.americamovil.com/sag/services/blackgrayService', 1, '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:loc="http://www.csapi.org/schema/parlayx/blackgray/v1_0/local"><soapenv:Header><wsse:Security xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"><wsse:UsernameToken xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><wsse:Username>_*user_*</wsse:Username><wsse:Password Type="...#PasswordDigest">_*passSMT_*</wsse:Password><wsse:Nonce>_*nonce_*</wsse:Nonce><wsse:Created>_*dateSMT_*</wsse:Created></wsse:UsernameToken></wsse:Security><tns:RequestSOAPHeader xmlns:tns="http://www.huawei.com.cn/schema/common/v2_1"><tns:AppId>35000001000001</tns:AppId><tns:TransId>2014011716010012345</tns:TransId><tns:OA>_*movil_*</tns:OA><tns:FA>_*movil_*</tns:FA></tns:RequestSOAPHeader></soapenv:Header><soapenv:Body><loc:deleteGrayList><loc:version>_*version_*</loc:version><loc:grayList><grayee><msisdn>_*movil_*</msisdn>    </grayee></loc:grayList></loc:deleteGrayList></soapenv:Body></soapenv:Envelope>', 'loc:deleteGrayList', NULL);
COMMIT;


SET DEFINE OFF;
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (666, 'movil', 229);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (667, 'accion', 229);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (668, 'pass', 229);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (669, 'movil', 230);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (670, 'pass', 230);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (674, 'pass', 231);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (675, 'movil', 232);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (676, 'accion', 232);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (677, 'pass', 232);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (678, 'movil', 233);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (679, 'pass', 233);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (681, 'servicio', 234);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (682, 'mcorta', 234);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (684, 'movil', 235);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (685, 'accion', 235);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (686, 'pass', 235);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (690, 'servicio', 237);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (420, 'movil', 153);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (421, 'accion', 153);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (422, 'pass', 153);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (423, 'movil', 154);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (424, 'pass', 154);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (425, 'movil', 155);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (426, 'servicio', 155);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (427, 'mcorta', 155);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (428, 'pass', 155);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (429, 'movil', 156);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (430, 'accion', 156);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (431, 'pass', 156);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (432, 'movil', 157);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (433, 'pass', 157);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (434, 'movil', 158);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (435, 'servicio', 158);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (436, 'mcorta', 158);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (437, 'pass', 158);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (438, 'movil', 159);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (439, 'accion', 159);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (440, 'pass', 159);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (441, 'movil', 160);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (442, 'pass', 160);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (443, 'movil', 161);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (444, 'servicio', 161);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (445, 'mcorta', 161);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (446, 'pass', 161);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (447, 'movil', 162);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (448, 'accion', 162);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (449, 'pass', 162);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (450, 'movil', 163);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (451, 'pass', 163);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (452, 'movil', 164);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (453, 'servicio', 164);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (454, 'mcorta', 164);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (455, 'pass', 164);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (456, 'movil', 166);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (457, 'accion', 166);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (458, 'pass', 166);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (459, 'movil', 167);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (460, 'pass', 167);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (461, 'movil', 168);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (462, 'servicio', 168);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (463, 'mcorta', 168);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (464, 'pass', 168);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (465, 'movil', 169);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (466, 'accion', 169);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (467, 'pass', 169);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (468, 'movil', 170);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (469, 'pass', 170);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (470, 'movil', 171);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (471, 'servicio', 171);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (472, 'mcorta', 171);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (473, 'pass', 171);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (474, 'movil', 172);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (475, 'accion', 172);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (476, 'pass', 172);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (477, 'movil', 173);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (478, 'pass', 173);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (479, 'movil', 174);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (480, 'servicio', 174);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (481, 'mcorta', 174);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (482, 'pass', 174);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (483, 'movil', 175);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (484, 'accion', 175);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (485, 'pass', 175);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (486, 'movil', 176);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (487, 'pass', 176);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (488, 'movil', 177);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (489, 'servicio', 177);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (490, 'mcorta', 177);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (491, 'pass', 177);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (492, 'movil', 178);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (493, 'accion', 178);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (494, 'pass', 178);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (495, 'movil', 179);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (496, 'pass', 179);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (497, 'movil', 180);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (498, 'servicio', 180);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (499, 'mcorta', 180);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (500, 'pass', 180);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (501, 'movil', 181);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (502, 'accion', 181);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (503, 'pass', 181);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (504, 'movil', 182);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (509, 'mcorta', 183);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (506, 'pass', 182);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (507, 'movil', 183);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (508, 'servicio', 183);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (510, 'pass', 183);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (511, 'movil', 184);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (512, 'accion', 184);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (513, 'pass', 184);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (514, 'movil', 185);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (515, 'pass', 185);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (516, 'movil', 186);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (517, 'servicio', 186);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (518, 'mcorta', 186);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (519, 'pass', 186);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (520, 'movil', 187);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (521, 'accion', 187);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (522, 'pass', 187);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (523, 'movil', 188);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (524, 'pass', 188);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (525, 'movil', 189);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (526, 'servicio', 189);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (527, 'mcorta', 189);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (528, 'pass', 189);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (529, 'movil', 190);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (530, 'accion', 190);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (531, 'pass', 190);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (532, 'movil', 191);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (533, 'pass', 191);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (534, 'movil', 192);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (535, 'servicio', 192);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (536, 'mcorta', 192);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (537, 'pass', 192);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (538, 'movil', 193);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (539, 'pass', 193);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (540, 'movil', 194);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (541, 'pass', 194);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (542, 'movil', 195);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (543, 'servicio', 195);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (544, 'mcorta', 195);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (545, 'pass', 195);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (546, 'accion', 193);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (547, 'pass', 76);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (548, 'movil', 76);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (549, 'accion', 76);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (550, 'movil', 77);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (551, 'pass', 77);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (552, 'pass', 78);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (553, 'movil', 78);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (554, 'mcorta', 78);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (555, 'servicio', 78);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (595, 'movil', 209);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (596, 'pass', 209);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (601, 'movil', 211);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (603, 'pass', 211);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (604, 'movil', 212);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (605, 'pass', 212);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (606, 'movil', 213);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (607, 'servicio', 213);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (615, 'movil', 216);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (624, 'movil', 219);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (625, 'servicio', 219);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (626, 'mcorta', 219);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (627, 'pass', 219);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (619, 'movil', 217);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (620, 'accion', 217);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (621, 'pass', 217);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (622, 'movil', 218);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (623, 'pass', 218);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (556, 'movil', 196);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (557, 'accion', 196);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (558, 'pass', 196);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (559, 'movil', 197);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (563, 'mcorta', 198);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (564, 'pass', 198);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (565, 'movil', 199);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (566, 'accion', 199);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (567, 'pass', 199);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (568, 'movil', 200);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (569, 'pass', 200);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (570, 'movil', 201);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (572, 'mcorta', 201);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (573, 'pass', 201);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (574, 'movil', 202);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (576, 'accion', 202);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (579, 'movil', 204);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (580, 'servicio', 204);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (581, 'mcorta', 204);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (582, 'pass', 204);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (583, 'movil', 205);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (584, 'accion', 205);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (585, 'pass', 205);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (588, 'movil', 207);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (592, 'movil', 208);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (593, 'accion', 208);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (594, 'pass', 208);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (597, 'movil', 210);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (598, 'servicio', 210);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (599, 'mcorta', 210);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (600, 'pass', 210);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (602, 'accion', 211);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (608, 'mcorta', 213);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (609, 'pass', 213);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (610, 'movil', 214);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (611, 'accion', 214);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (612, 'pass', 214);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (613, 'movil', 215);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (614, 'pass', 215);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (616, 'servicio', 216);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (617, 'mcorta', 216);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (618, 'pass', 216);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (560, 'pass', 197);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (561, 'movil', 198);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (562, 'servicio', 198);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (571, 'servicio', 201);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (575, 'pass', 202);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (577, 'movil', 203);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (578, 'pass', 203);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (586, 'movil', 206);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (587, 'pass', 206);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (589, 'servicio', 207);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (590, 'mcorta', 207);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (591, 'pass', 207);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (218, 'pass', 81);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (228, 'movil', 86);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (235, 'servicio', 87);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (230, 'pass', 86);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (231, 'movil', 85);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (232, 'accion', 85);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (233, 'pass', 85);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (234, 'movil', 87);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (236, 'mcorta', 87);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (251, 'pass', 92);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (254, 'mcorta', 93);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (255, 'pass', 93);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (258, 'pass', 95);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (261, 'pass', 94);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (263, 'servicio', 96);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (265, 'pass', 96);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (268, 'pass', 97);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (269, 'movil', 98);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (274, 'pass', 99);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (275, 'movil', 100);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (279, 'pass', 101);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (282, 'mcorta', 102);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (303, 'accion', 109);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (305, 'movil', 110);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (306, 'pass', 110);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (309, 'mcorta', 111);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (310, 'pass', 111);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (314, 'movil', 113);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (316, 'movil', 114);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (317, 'servicio', 114);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (318, 'mcorta', 114);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (319, 'pass', 114);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (320, 'movil', 115);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (321, 'accion', 115);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (324, 'pass', 116);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (327, 'servicio', 117);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (195, 'movil', 71);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (196, 'pass', 71);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (203, 'pass', 73);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (208, 'mcorta', 75);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (209, 'pass', 75);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (210, 'movil', 79);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (211, 'accion', 79);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (212, 'pass', 79);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (213, 'movil', 80);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (214, 'pass', 80);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (215, 'movil', 81);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (216, 'servicio', 81);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (217, 'mcorta', 81);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (237, 'pass', 87);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (247, 'movil', 91);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (248, 'accion', 91);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (249, 'pass', 91);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (250, 'movil', 92);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (252, 'movil', 93);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (253, 'servicio', 93);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (256, 'movil', 95);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (264, 'mcorta', 96);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (259, 'movil', 94);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (260, 'accion', 94);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (262, 'movil', 96);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (266, 'movil', 97);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (267, 'accion', 97);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (270, 'pass', 98);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (271, 'movil', 99);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (272, 'servicio', 99);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (273, 'mcorta', 99);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (276, 'accion', 100);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (277, 'pass', 100);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (278, 'movil', 101);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (280, 'movil', 102);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (281, 'servicio', 102);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (283, 'pass', 102);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (302, 'movil', 109);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (304, 'pass', 109);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (307, 'movil', 111);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (308, 'servicio', 111);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (311, 'movil', 112);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (312, 'accion', 112);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (313, 'pass', 112);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (315, 'pass', 113);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (322, 'pass', 115);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (323, 'movil', 116);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (329, 'pass', 117);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (326, 'movil', 117);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (328, 'mcorta', 117);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (1, 'user', 1);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (2, 'passSMT', 1);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (3, 'nonce', 1);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (4, 'dateSMT', 1);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (5, 'movil', 1);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (6, 'version', 1);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (7, 'movil', 2);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (8, 'accion', 2);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (9, 'pass', 2);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (10, 'movil', 3);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (11, 'pass', 3);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (12, 'movil', 4);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (13, 'servicio', 4);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (14, 'marcacion', 4);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (15, 'pass', 4);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (16, 'movil', 5);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (17, 'accion', 5);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (18, 'pass', 5);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (19, 'movil', 6);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (20, 'pass', 6);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (21, 'movil', 7);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (22, 'servicio', 7);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (23, 'mcorta', 7);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (24, 'pass', 7);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (25, 'movil', 8);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (26, 'operacion', 8);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (27, 'pass', 8);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (28, 'movil', 9);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (29, 'pass', 9);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (30, 'movil', 10);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (31, 'servicio', 10);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (32, 'mcorta', 10);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (33, 'pass', 10);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (34, 'movil', 12);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (35, 'accion', 12);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (36, 'pass', 12);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (37, 'movil', 13);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (38, 'pass', 13);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (39, 'movil', 14);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (40, 'servicio', 14);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (41, 'mcorta', 14);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (42, 'pass', 14);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (52, 'movil', 18);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (53, 'accion', 18);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (54, 'pass', 18);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (55, 'movil', 19);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (56, 'pass', 19);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (57, 'movil', 20);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (58, 'servicio', 20);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (59, 'mcorta', 20);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (60, 'pass', 20);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (61, 'movil', 21);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (62, 'accion', 21);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (63, 'pass', 21);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (64, 'movil', 22);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (65, 'pass', 22);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (66, 'movil', 23);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (67, 'servicio', 23);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (68, 'pass', 23);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (69, 'mcorta', 23);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (70, 'movil', 24);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (71, 'accion', 24);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (72, 'pass', 24);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (73, 'movil', 25);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (74, 'pass', 25);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (75, 'movil', 26);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (76, 'servicio', 26);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (77, 'mcorta', 26);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (78, 'pass', 26);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (89, 'movil', 30);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (90, 'accion', 30);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (91, 'pass', 30);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (92, 'movil', 31);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (93, 'pass', 31);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (94, 'movil', 32);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (95, 'servicio', 32);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (96, 'mcorta', 32);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (97, 'pass', 32);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (98, 'movil', 34);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (99, 'accion', 34);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (100, 'pass', 34);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (101, 'movil', 35);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (102, 'pass', 35);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (103, 'movil', 36);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (104, 'servicio', 36);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (105, 'mcorta', 36);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (106, 'pass', 36);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (107, 'movil', 37);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (108, 'accion', 37);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (109, 'pass', 37);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (110, 'movil', 40);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (111, 'accion', 40);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (112, 'pass', 40);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (113, 'item', 41);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (114, 'movil', 42);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (115, 'servicio', 42);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (116, 'mcorta', 42);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (117, 'pass', 42);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (118, 'movil', 43);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (119, 'accion', 43);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (120, 'pass', 43);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (121, 'movil', 44);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (122, 'pass', 44);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (123, 'movil', 45);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (124, 'servicio', 45);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (125, 'mcorta', 45);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (126, 'pass', 45);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (127, 'movil', 46);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (128, 'accion', 46);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (129, 'pass', 46);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (130, 'movil', 47);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (131, 'pass', 47);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (132, 'movil', 48);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (133, 'servicio', 48);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (134, 'mcorta', 48);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (135, 'pass', 48);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (136, 'movil', 49);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (137, 'accion', 49);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (138, 'pass', 49);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (139, 'movil', 50);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (140, 'pass', 50);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (144, 'mcorta', 51);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (142, 'movil', 51);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (143, 'servicio', 51);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (145, 'pass', 51);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (146, 'movil', 52);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (147, 'accion', 52);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (148, 'pass', 52);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (149, 'movil', 53);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (150, 'pass', 53);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (151, 'movil', 54);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (152, 'servicio', 54);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (153, 'mcorta', 54);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (154, 'pass', 54);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (155, 'movil', 55);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (156, 'accion', 55);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (157, 'pass', 55);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (158, 'movil', 56);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (159, 'pass', 56);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (160, 'movil', 57);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (161, 'servicio', 57);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (162, 'mcorta', 57);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (163, 'pass', 57);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (164, 'movil', 58);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (165, 'accion', 58);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (166, 'pass', 58);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (167, 'movil', 59);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (168, 'pass', 59);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (169, 'movil', 60);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (170, 'servicio', 60);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (171, 'mcorta', 60);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (172, 'pass', 60);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (173, 'movil', 61);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (174, 'accion', 61);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (175, 'pass', 61);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (176, 'movil', 62);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (177, 'pass', 62);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (178, 'movil', 63);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (179, 'servicio', 63);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (180, 'mcorta', 63);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (181, 'pass', 63);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (182, 'movil', 64);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (183, 'accion', 64);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (184, 'pass', 64);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (185, 'movil', 65);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (186, 'pass', 65);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (187, 'movil', 66);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (188, 'servicio', 66);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (190, 'mcorta', 66);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (191, 'pass', 66);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (192, 'movil', 70);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (193, 'accion', 70);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (194, 'pass', 70);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (197, 'movil', 72);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (198, 'servicio', 72);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (199, 'mcorta', 72);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (200, 'pass', 72);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (201, 'movil', 73);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (202, 'accion', 73);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (204, 'movil', 74);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (205, 'pass', 74);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (206, 'movil', 75);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (207, 'servicio', 75);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (331, 'pass', 120);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (332, 'movil', 119);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (334, 'pass', 119);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (336, 'servicio', 125);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (337, 'mcorta', 125);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (330, 'movil', 120);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (333, 'accion', 119);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (335, 'movil', 125);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (338, 'pass', 125);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (375, 'movil', 138);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (376, 'accion', 138);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (377, 'pass', 138);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (378, 'movil', 139);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (379, 'pass', 139);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (380, 'movil', 140);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (381, 'servicio', 140);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (382, 'mcorta', 140);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (383, 'pass', 140);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (384, 'movil', 141);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (385, 'accion', 141);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (386, 'pass', 141);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (387, 'movil', 142);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (388, 'pass', 142);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (389, 'movil', 143);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (390, 'servicio', 143);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (391, 'mcorta', 143);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (392, 'pass', 143);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (393, 'movil', 144);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (394, 'accion', 144);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (395, 'pass', 144);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (396, 'movil', 145);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (397, 'pass', 145);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (398, 'movil', 146);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (399, 'servicio', 146);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (400, 'mcorta', 146);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (401, 'pass', 146);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (402, 'movil', 147);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (403, 'accion', 147);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (404, 'pass', 147);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (405, 'movil', 148);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (406, 'pass', 148);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (407, 'movil', 149);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (408, 'servicio', 149);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (409, 'mcorta', 149);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (410, 'pass', 149);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (411, 'movil', 150);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (412, 'accion', 150);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (413, 'pass', 150);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (414, 'movil', 151);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (415, 'pass', 151);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (416, 'movil', 152);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (417, 'servicio', 152);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (418, 'mcorta', 152);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (419, 'pass', 152);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (628, 'version', 220);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (629, 'user', 220);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (630, 'passSMT', 220);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (631, 'nonce', 220);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (632, 'dateSMT', 220);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (633, 'movil', 220);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (637, 'user', 221);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (635, 'version', 221);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (640, 'dateSMT', 221);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (638, 'passSMT', 221);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (639, 'nonce', 221);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (641, 'movil', 221);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (642, 'version', 222);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (643, 'movil', 222);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (644, 'dateSMT', 222);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (645, 'nonce', 222);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (646, 'passSMT', 222);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (647, 'user', 222);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (653, 'movil', 225);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (654, 'servicio', 225);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (655, 'pass', 225);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (656, 'mcorta', 225);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (648, 'movil', 223);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (649, 'pass', 223);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (650, 'accion', 223);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (651, 'movil', 224);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (652, 'pass', 224);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (657, 'movil', 226);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (658, 'accion', 226);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (659, 'pass', 226);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (660, 'movil', 227);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (661, 'pass', 227);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (662, 'movil', 228);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (663, 'servicio', 228);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (664, 'mcorta', 228);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (665, 'pass', 228);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (671, 'movil', 231);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (672, 'servicio', 231);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (673, 'mcorta', 231);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (680, 'movil', 234);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (683, 'pass', 234);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (687, 'movil', 236);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (688, 'pass', 236);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (689, 'movil', 237);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (691, 'mcorta', 237);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (692, 'pass', 237);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (693, 'version', 238);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (694, 'user', 238);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (695, 'passSMT', 238);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (696, 'nonce', 238);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (697, 'dateSMT', 238);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (698, 'movil', 238);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (702, 'movil', 242);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (704, 'movil', 244);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (699, 'movil', 239);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (700, 'movil', 240);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (701, 'movil', 241);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (703, 'movil', 243);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (705, 'movil', 245);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (706, 'movil', 246);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (707, 'movil', 247);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (708, 'movil', 248);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (709, 'movil', 249);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (710, 'accion', 249);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (711, 'pass', 249);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (712, 'movil', 250);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (713, 'pass', 250);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (714, 'movil', 251);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (715, 'servicio', 251);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (716, 'mcorta', 251);
Insert into SDA_PARAMETROS
   (ID, NOMBRE, ID_METODO)
 Values
   (717, 'pass', 251);
COMMIT;



SET DEFINE OFF;
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (241, 'item', 1, 5);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (242, 'item', 1, 6);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (218, 'string', 6, 229);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (219, 'item', 1, 230);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (220, 'string', 6, 231);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (221, 'Value', 4, 232);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (222, 'item', 1, 233);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (223, 'Value', 4, 234);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (224, 'Resp', 3, 235);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (225, 'item', 1, 236);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (227, 'ns1:resultCode', 2, 238);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (207, 'Value', 4, 217);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (208, 'item', 1, 218);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (186, 'Return', 5, 196);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (190, 'item', 1, 200);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (192, 'Resp', 3, 202);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (194, 'item', 1, 204);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (195, 'Resp', 3, 205);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (196, 'item', 1, 206);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (198, 'anyType', 7, 208);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (199, 'item', 1, 209);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (200, 'anyType', 7, 210);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (203, 'string', 6, 213);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (204, 'item', 1, 214);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (206, 'item', 1, 216);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (187, 'item', 1, 197);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (188, 'Return', 5, 198);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (189, 'item', 1, 199);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (191, 'item', 1, 201);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (193, 'item', 1, 203);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (197, 'Resp', 3, 207);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (66, 'item', 1, 81);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (70, 'item', 1, 86);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (71, 'Value', 4, 85);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (77, 'item', 1, 92);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (78, 'Resp', 3, 93);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (83, 'item', 1, 98);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (86, 'item', 1, 101);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (94, 'Resp', 3, 109);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (95, 'item', 1, 110);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (96, 'Resp', 3, 111);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (101, 'Return', 5, 116);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (59, 'item', 1, 71);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (61, 'Value', 4, 73);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (63, 'Value', 4, 75);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (64, 'Resp', 3, 79);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (65, 'item', 1, 80);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (72, 'Value', 4, 87);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (80, 'string', 6, 94);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (76, 'Resp', 3, 91);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (79, 'string', 6, 95);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (81, 'string', 6, 96);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (82, 'Resp', 3, 97);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (84, 'Resp', 3, 99);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (85, 'Value', 4, 100);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (87, 'Value', 4, 102);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (97, 'Resp', 3, 112);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (98, 'item', 1, 113);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (99, 'Resp', 3, 114);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (100, 'Resp', 3, 115);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (102, 'Resp', 3, 117);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (1, 'ns1:resultCode', 2, 1);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (2, 'Value', 4, 2);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (3, 'item', 1, 3);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (4, 'Value', 4, 4);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (7, 'item', 1, 7);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (8, 'Resp', 3, 8);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (9, 'item', 1, 9);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (10, 'item', 1, 10);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (11, 'Value', 4, 12);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (12, 'item', 1, 13);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (13, 'Value', 4, 14);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (14, 'Resp', 3, 18);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (15, 'item', 1, 19);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (16, 'Resp', 3, 20);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (17, 'string', 6, 21);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (18, 'item', 1, 22);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (19, 'string', 6, 23);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (20, 'item', 1, 24);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (21, 'item', 1, 25);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (22, 'Resp', 3, 26);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (27, 'Value', 4, 30);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (28, 'item', 1, 31);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (29, 'Value', 4, 32);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (30, 'Value', 4, 34);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (31, 'item', 1, 35);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (32, 'Value', 4, 36);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (33, 'Resp', 3, 37);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (34, 'Value', 4, 40);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (35, 'Value', 4, 42);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (36, 'Resp', 3, 43);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (37, 'item', 1, 44);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (38, 'Resp', 3, 45);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (39, 'Resp', 3, 46);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (40, 'Return', 5, 47);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (41, 'Resp', 3, 48);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (42, 'Resp', 3, 49);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (43, 'item', 1, 50);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (44, 'Resp', 3, 51);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (45, 'Value', 4, 52);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (46, 'item', 1, 53);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (50, 'item', 1, 56);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (48, 'Value', 4, 54);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (49, 'Resp', 3, 55);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (51, 'Resp', 3, 57);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (52, 'item', 1, 58);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (53, 'item', 1, 59);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (54, 'item', 1, 60);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (55, 'Resp', 3, 64);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (56, 'item', 1, 65);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (57, 'Resp', 3, 66);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (58, 'Value', 4, 70);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (60, 'Value', 4, 72);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (62, 'item', 1, 74);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (105, 'item', 1, 120);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (106, 'Resp', 3, 119);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (107, 'Resp', 3, 125);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (123, 'item', 1, 139);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (122, 'item', 1, 138);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (124, 'item', 1, 140);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (125, 'Resp', 3, 141);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (126, 'item', 1, 142);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (127, 'item', 1, 143);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (128, 'Value', 4, 144);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (129, 'item', 1, 145);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (130, 'Value', 4, 146);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (131, 'Resp', 3, 147);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (132, 'item', 1, 148);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (133, 'Resp', 3, 149);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (134, 'string', 6, 150);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (135, 'item', 1, 151);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (142, 'string', 6, 155);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (137, 'string', 6, 152);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (138, 'string', 6, 153);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (140, 'item', 1, 154);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (144, 'item', 1, 157);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (143, 'Resp', 3, 156);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (145, 'Resp', 3, 158);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (146, 'item', 1, 159);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (147, 'item', 1, 160);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (148, 'item', 1, 161);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (149, 'string', 6, 162);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (150, 'item', 1, 163);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (151, 'string', 6, 164);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (152, 'Value', 4, 166);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (153, 'item', 1, 167);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (157, 'item', 1, 170);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (155, 'Value', 4, 168);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (156, 'Resp', 3, 169);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (158, 'Resp', 3, 171);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (159, 'Resp', 3, 172);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (160, 'item', 1, 173);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (161, 'Resp', 3, 174);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (162, 'Resp', 3, 175);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (163, 'item', 1, 176);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (164, 'Resp', 3, 177);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (165, 'Resp', 3, 178);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (166, 'item', 1, 179);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (167, 'Resp', 3, 180);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (168, 'Resp', 3, 181);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (169, 'item', 1, 182);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (170, 'Resp', 3, 183);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (171, 'Resp', 3, 184);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (172, 'item', 1, 185);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (173, 'Resp', 3, 186);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (174, 'Value', 4, 187);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (175, 'item', 1, 188);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (176, 'Value', 4, 189);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (177, 'Resp', 3, 190);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (178, 'item', 1, 191);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (179, 'Resp', 3, 192);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (180, 'Resp', 3, 193);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (181, 'item', 1, 194);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (182, 'Resp', 3, 195);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (183, 'item', 1, 76);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (184, 'item', 1, 77);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (185, 'item', 1, 78);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (201, 'string', 6, 211);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (202, 'item', 1, 212);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (205, 'item', 1, 215);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (209, 'ns1:resultCode', 2, 220);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (210, 'ns1:resultCode', 2, 221);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (211, 'ns1:resultCode', 2, 222);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (212, 'Resp', 3, 223);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (213, 'item', 1, 224);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (214, 'item', 1, 225);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (215, 'Resp', 3, 226);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (216, 'item', 1, 227);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (217, 'Resp', 3, 228);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (226, 'Resp', 3, 237);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (231, 'ns1:statusCode', 8, 242);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (233, 'ns1:statusCode', 8, 244);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (228, 'ns1:statusCode', 8, 239);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (229, 'ns1:statusCode', 8, 240);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (230, 'ns1:statusCode', 8, 241);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (232, 'ns1:statusCode', 8, 243);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (234, 'ns1:statusCode', 8, 245);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (235, 'ns1:statusCode', 8, 246);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (236, 'ns1:statusCode', 8, 247);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (237, 'ns1:statusCode', 8, 248);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (238, 'item', 1, 249);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (239, 'item', 1, 250);
Insert into SDA_RESPUESTAS
   (ID, NOMBRE, ID_RESPUESTA, ID_METODO)
 Values
   (240, 'item', 1, 251);
COMMIT;



SET DEFINE OFF;
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (360, 241, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (361, 241, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (362, 7, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (363, 7, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (306, 218, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (307, 218, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (308, 220, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (309, 220, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (310, 221, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (311, 221, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (312, 223, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (313, 223, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (318, 227, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (319, 227, 'the msisdn has already existed', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (320, 227, 'the msisdn format is wrong', '2', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (321, 227, 'the msisdn is not existed (for delete black list)', '3', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (322, 227, 'the ASPID is not existed', '4', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (324, 227, 'system SMT error', '9', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (275, 207, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (276, 207, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (247, 186, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (248, 186, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (249, 188, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (250, 188, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (252, 189, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (255, 192, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (256, 192, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (257, 194, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (258, 194, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (263, 198, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (265, 200, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (269, 203, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (271, 204, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (272, 204, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (251, 189, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (253, 191, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (254, 191, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (259, 195, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (260, 195, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (261, 197, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (262, 197, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (97, 66, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (98, 66, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (111, 78, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (121, 84, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (105, 71, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (106, 71, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (118, 81, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (120, 82, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (123, 85, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (124, 85, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (125, 87, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (126, 87, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (138, 96, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (139, 97, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (140, 97, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (142, 99, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (243, 183, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (91, 61, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (93, 63, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (94, 63, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (95, 64, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (96, 64, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (107, 72, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (108, 72, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (109, 76, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (110, 76, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (112, 78, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (119, 82, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (115, 80, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (116, 80, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (117, 81, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (122, 84, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (135, 94, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (136, 94, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (137, 96, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (141, 99, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (143, 100, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (144, 100, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (145, 102, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (146, 102, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (1, 2, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (3, 4, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (164, 4, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (5, 1, 'Exito', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (6, 1, 'the msisdn has already existed', '1', 6);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (7, 1, 'the msisdn format is wrong', '2', 3);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (8, 1, 'the msisdn is not existed (for delete black list)', '3', 4);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (9, 1, 'the ASPID is not existed', '4', 5);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (10, 1, 'the serviceID is not existed', '5', 7);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (11, 1, 'system SMT error', '9', 8);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (12, 2, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (17, 8, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (18, 8, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (19, 10, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (20, 10, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (21, 11, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (22, 11, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (25, 13, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (27, 14, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (26, 13, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (28, 14, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (29, 16, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (30, 16, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (31, 17, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (32, 17, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (33, 19, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (34, 19, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (35, 20, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (36, 20, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (37, 22, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (38, 22, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (39, 21, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (40, 21, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (45, 27, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (46, 27, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (47, 29, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (48, 29, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (49, 30, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (50, 30, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (51, 32, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (52, 32, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (53, 33, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (54, 33, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (55, 34, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (56, 34, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (57, 35, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (58, 35, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (59, 36, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (60, 36, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (61, 38, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (62, 38, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (63, 39, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (64, 39, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (65, 41, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (66, 41, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (67, 42, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (68, 42, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (69, 44, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (70, 44, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (71, 45, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (72, 45, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (73, 48, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (74, 48, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (75, 49, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (76, 49, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (77, 51, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (78, 51, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (79, 52, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (80, 52, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (81, 54, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (82, 54, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (83, 55, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (84, 55, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (85, 57, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (86, 57, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (87, 58, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (89, 60, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (90, 60, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (92, 61, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (150, 106, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (151, 106, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (152, 107, 'Exito', '1', 2);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (153, 107, 'Fallo', '0', 1);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (165, 122, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (166, 122, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (170, 124, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (171, 125, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (169, 124, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (172, 125, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (173, 127, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (174, 127, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (175, 128, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (176, 128, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (177, 130, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (178, 130, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (179, 131, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (180, 131, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (181, 133, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (182, 133, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (183, 134, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (184, 134, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (185, 137, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (186, 137, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (187, 138, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (188, 138, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (189, 142, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (190, 142, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (191, 143, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (192, 143, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (193, 145, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (194, 145, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (195, 146, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (196, 146, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (197, 148, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (198, 148, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (199, 149, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (200, 149, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (201, 151, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (202, 151, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (203, 152, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (204, 152, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (205, 155, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (206, 155, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (207, 156, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (208, 156, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (209, 158, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (210, 158, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (211, 159, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (212, 159, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (213, 161, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (214, 161, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (215, 162, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (216, 162, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (217, 164, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (218, 164, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (219, 165, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (220, 165, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (221, 167, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (222, 167, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (223, 168, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (224, 168, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (225, 170, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (226, 170, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (227, 171, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (228, 171, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (229, 173, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (230, 173, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (231, 174, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (232, 174, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (233, 176, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (234, 176, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (235, 177, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (236, 177, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (237, 179, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (238, 179, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (239, 180, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (240, 180, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (241, 182, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (242, 182, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (244, 183, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (245, 185, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (246, 185, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (264, 198, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (266, 200, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (267, 201, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (268, 201, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (270, 203, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (273, 206, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (274, 206, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (277, 209, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (278, 209, 'the msisdn has already existed', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (279, 209, 'the msisdn format is wrong', '2', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (280, 209, 'the msisdn is not existed (for delete black list)', '3', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (281, 209, 'the ASPID is not existed', '4', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (282, 209, 'the serviceID is not existed', '5', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (283, 209, 'system SMT error', '9', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (284, 210, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (285, 210, 'the msisdn has already existed', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (286, 210, 'the msisdn format is wrong', '2', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (287, 210, 'the msisdn is not existed (for delete black list)', '3', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (288, 210, 'the ASPID is not existed', '4', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (289, 210, 'the serviceID is not existed', '5', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (290, 210, 'system SMT error', '9', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (291, 211, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (292, 211, 'the msisdn has already existed', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (293, 211, 'the msisdn format is wrong', '2', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (294, 211, 'the msisdn is not existed (for delete black list)', '3', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (295, 211, 'the ASPID is not existed', '4', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (296, 211, 'the serviceID is not existed', '5', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (297, 211, 'system SMT error', '9', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (298, 212, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (299, 212, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (300, 214, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (301, 214, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (302, 215, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (303, 215, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (304, 217, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (305, 217, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (314, 224, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (315, 224, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (316, 226, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (317, 226, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (323, 227, 'the serviceID is not existed', '5', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (332, 230, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (333, 230, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (334, 231, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (335, 231, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (336, 231, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (340, 233, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (341, 233, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (342, 233, 'Numero erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (325, 228, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (326, 228, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (327, 228, 'Numero Invalido', '1107', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (328, 229, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (329, 229, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (330, 229, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (331, 230, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (337, 232, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (338, 232, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (339, 232, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (343, 234, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (344, 234, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (345, 234, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (346, 235, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (347, 235, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (348, 235, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (349, 236, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (350, 236, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (351, 236, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (352, 237, 'Exito', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (353, 237, 'Exito', '1000', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (354, 237, 'Numero Erroneo', '1007', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (355, 58, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (356, 238, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (357, 238, 'Fallo', '0', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (358, 240, 'Exito', '1', NULL);
Insert into SDA_RESULTADOS_RESPUESTA
   (ID, ID_RESPUESTA, VALOR, DATO, ID_RESULTADO)
 Values
   (359, 240, 'Fallo', '0', NULL);
COMMIT;
