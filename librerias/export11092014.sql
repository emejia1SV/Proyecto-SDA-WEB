--------------------------------------------------------
-- Archivo creado  - jueves-septiembre-11-2014   
--------------------------------------------------------
--DROP TABLE "CLIENTE_TEL" cascade constraints;
--DROP TABLE "SDA_AGREGADORES" cascade constraints;
--DROP TABLE "SDA_INSUMOS" cascade constraints;
--DROP TABLE "SDA_LOG_DEPURACION" cascade constraints;
--DROP TABLE "SDA_METODOS" cascade constraints;
--DROP TABLE "SDA_PAISES" cascade constraints;
--DROP TABLE "SDA_PARAMETROS" cascade constraints;
--DROP TABLE "SDA_PARAMETROS_SISTEMA" cascade constraints;
--DROP TABLE "SDA_RESPUESTAS" cascade constraints;
--DROP SEQUENCE "SQ_SDA_AGREGADORES";
--DROP SEQUENCE "SQ_SDA_DEPURACION_LOG";
--DROP SEQUENCE "SQ_SDA_METODOS";
--DROP SEQUENCE "SQ_SDA_PAIS";
--DROP SEQUENCE "SQ_SDA_PARAMETROS";
--DROP SEQUENCE "SQ_SDA_RESPUESTAS";
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_AGREGADORES
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_AGREGADORES"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 101 CACHE 100 ORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SQ_SDA_DEPURACION_LOG
--------------------------------------------------------

   CREATE SEQUENCE  "SQ_SDA_DEPURACION_LOG"  MINVALUE 1 MAXVALUE 100000000 INCREMENT BY 1 START WITH 1 NOCACHE  ORDER  NOCYCLE ;
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
--  DDL for Table CLIENTE_TEL
--------------------------------------------------------

  CREATE TABLE "CLIENTE_TEL" 
   (    "ID" NUMBER, 
    "NUMERO" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table SDA_AGREGADORES
--------------------------------------------------------

  CREATE TABLE "SDA_AGREGADORES" 
   (    "ID" NUMBER, 
    "NOMBRE_AGREGADOR" VARCHAR2(255 BYTE), 
    "ESTADO" NUMBER, 
    "ID_PAIS" NUMBER
   )  ;
--------------------------------------------------------
--  DDL for Table SDA_INSUMOS
--------------------------------------------------------

  CREATE TABLE "SDA_INSUMOS" 
   (    "ID" NUMBER, 
    "DESCRIPCION" VARCHAR2(255 BYTE), 
    "QUERY" VARCHAR2(500 BYTE), 
    "IDENTIFICADOR" VARCHAR2(10 BYTE)
   )  ;
--------------------------------------------------------
--  DDL for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  CREATE TABLE "SDA_LOG_DEPURACION" 
   (    "ID" NUMBER, 
    "NUMERO" VARCHAR2(50 BYTE), 
    "ID_ERROR" NUMBER, 
    "FECHA_PROCESAMIENTO" TIMESTAMP (6), 
    "ID_METODO_PROCESADO" NUMBER
   )  ;
--------------------------------------------------------
--  DDL for Table SDA_METODOS
--------------------------------------------------------

  CREATE TABLE "SDA_METODOS" 
   (    "ID" NUMBER, 
    "ID_AGREGADOR" NUMBER, 
    "NOMBRE" VARCHAR2(255 BYTE), 
    "INPUTMESSAGENAME" VARCHAR2(255 BYTE), 
    "INPUTMESSAGETEXT" VARCHAR2(4000 BYTE), 
    "NAMESPACEURI" VARCHAR2(255 BYTE), 
    "STYLE" VARCHAR2(255 BYTE), 
    "TARGETMETHODNAME" VARCHAR2(255 BYTE), 
    "TARGETOBJECTURI" VARCHAR2(255 BYTE), 
    "TARGETURL" VARCHAR2(255 BYTE), 
    "WSDL_AGREGADOR" VARCHAR2(255 BYTE), 
    "USUARIO" VARCHAR2(255 BYTE), 
    "CONTRASENIA" VARCHAR2(255 BYTE), 
    "SERVICE_NAME" VARCHAR2(20 BYTE), 
    "SOAPACTIONURI" VARCHAR2(255 BYTE), 
    "END_POINT" VARCHAR2(1000 BYTE),
    "SEGURIDAD" NUMBER
   )  ;
 

   COMMENT ON COLUMN "SDA_METODOS"."ID" IS 'pk de la tabla metodos de los servicios';
 
   COMMENT ON COLUMN "SDA_METODOS"."ID_AGREGADOR" IS 'fk relacion con la tabla de servicios';
 
   COMMENT ON COLUMN "SDA_METODOS"."NOMBRE" IS 'nombre del metodo del servicio';
--------------------------------------------------------
--  DDL for Table SDA_PAISES
--------------------------------------------------------

  CREATE TABLE "SDA_PAISES" 
   (    "ID" NUMBER, 
    "PAIS" VARCHAR2(100 BYTE), 
    "CODIGO" VARCHAR2(10 BYTE), 
    "STATUS" NUMBER(*,0)
   )   ;
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS" 
   (    "ID" NUMBER, 
    "NOMBRE" VARCHAR2(255 BYTE), 
    "ID_METODO" NUMBER, 
    "TIPO" VARCHAR2(255 BYTE)
   )   ;
 

   COMMENT ON COLUMN "SDA_PARAMETROS"."ID" IS 'pk de la tabla de parametros';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."NOMBRE" IS 'nombre del parametro a recibir el servicio web de los agregadores';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."ID_METODO" IS 'fk con la tabla de metodos';
 
   COMMENT ON COLUMN "SDA_PARAMETROS"."TIPO" IS 'el tipo de dato que debe ser este parametro';
--------------------------------------------------------
--  DDL for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  CREATE TABLE "SDA_PARAMETROS_SISTEMA" 
   (    "ID" NUMBER, 
    "KEY" VARCHAR2(255 BYTE), 
    "VALUE" VARCHAR2(255 BYTE)
   )   ;
--------------------------------------------------------
--  DDL for Table SDA_RESPUESTAS
--------------------------------------------------------

  CREATE TABLE "SDA_RESPUESTAS" 
   (    "ID" NUMBER, 
    "NOMBRE" VARCHAR2(255 BYTE), 
    "TIPO" VARCHAR2(255 BYTE), 
    "ID_METODO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Index AGR_AGREGADORES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGR_AGREGADORES_PK" ON "SDA_AGREGADORES" ("ID")  ;
--------------------------------------------------------
--  DDL for Index AGR_DEPURACION_BCK_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGR_DEPURACION_BCK_PK" ON "SDA_LOG_DEPURACION" ("ID");
--------------------------------------------------------
--  DDL for Index AGR_INSUMOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGR_INSUMOS_PK" ON "SDA_INSUMOS" ("ID") ;
--------------------------------------------------------
--  DDL for Index AGR_PARAMETROS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGR_PARAMETROS_PK" ON "SDA_PARAMETROS" ("ID");
--------------------------------------------------------
--  DDL for Index AGR_PARAMETROS_SISTEMA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGR_PARAMETROS_SISTEMA_PK" ON "SDA_PARAMETROS_SISTEMA" ("ID");
--------------------------------------------------------
--  DDL for Index AGR_RESPUESTA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "AGR_RESPUESTA_PK" ON "SDA_RESPUESTAS" ("ID")  ;
--------------------------------------------------------
--  DDL for Index METODOS_SERVICIOS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "METODOS_SERVICIOS_PK" ON "SDA_METODOS" ("ID") ;
--------------------------------------------------------
--  DDL for Index PAISES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "PAISES_PK" ON "SDA_PAISES" ("ID") ;
--------------------------------------------------------
--  DDL for Index USUARIOS_TEL_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "USUARIOS_TEL_PK" ON "CLIENTE_TEL" ("ID");
--------------------------------------------------------
--  Constraints for Table CLIENTE_TEL
--------------------------------------------------------

  ALTER TABLE "CLIENTE_TEL" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "CLIENTE_TEL" ADD CONSTRAINT "USUARIOS_TEL_PK" PRIMARY KEY ("ID")  ENABLE;
--------------------------------------------------------
--  Constraints for Table SDA_AGREGADORES
--------------------------------------------------------

  ALTER TABLE "SDA_AGREGADORES" ADD CONSTRAINT "AGR_AGREGADORES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("NOMBRE_AGREGADOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ESTADO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_AGREGADORES" MODIFY ("ID_PAIS" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_INSUMOS
--------------------------------------------------------

  ALTER TABLE "SDA_INSUMOS" ADD CONSTRAINT "AGR_INSUMOS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_INSUMOS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_INSUMOS" MODIFY ("QUERY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" ADD CONSTRAINT "AGR_DEPURACION_BCK_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_LOG_DEPURACION" MODIFY ("NUMERO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_METODOS
--------------------------------------------------------

  ALTER TABLE "SDA_METODOS" ADD CONSTRAINT "METODOS_SERVICIOS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_METODOS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("ID_AGREGADOR" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("END_POINT" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_METODOS" MODIFY ("INPUTMESSAGETEXT" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_PAISES
--------------------------------------------------------

  ALTER TABLE "SDA_PAISES" ADD CONSTRAINT "PAISES_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_PAISES" MODIFY ("ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_PARAMETROS
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS" ADD CONSTRAINT "AGR_PARAMETROS_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS" MODIFY ("ID_METODO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_PARAMETROS_SISTEMA
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS_SISTEMA" ADD CONSTRAINT "AGR_PARAMETROS_SISTEMA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("KEY" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_PARAMETROS_SISTEMA" MODIFY ("VALUE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SDA_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_RESPUESTAS" ADD CONSTRAINT "AGR_RESPUESTA_PK" PRIMARY KEY ("ID") ENABLE;
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("NOMBRE" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("TIPO" NOT NULL ENABLE);
 
  ALTER TABLE "SDA_RESPUESTAS" MODIFY ("ID_METODO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table SDA_AGREGADORES
--------------------------------------------------------

  ALTER TABLE "SDA_AGREGADORES" ADD CONSTRAINT "AGR_AGREGADORES_FK1" FOREIGN KEY ("ID_PAIS")
      REFERENCES "SDA_PAISES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_LOG_DEPURACION
--------------------------------------------------------

  ALTER TABLE "SDA_LOG_DEPURACION" ADD CONSTRAINT "AGR_DEPURACION_BCK_FK1" FOREIGN KEY ("ID_METODO_PROCESADO")
      REFERENCES "SDA_METODOS" ("ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_METODOS
--------------------------------------------------------

  ALTER TABLE "SDA_METODOS" ADD CONSTRAINT "METODOS_SERVICIOS_FK" FOREIGN KEY ("ID_AGREGADOR")
      REFERENCES "SDA_AGREGADORES" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_PARAMETROS
--------------------------------------------------------

  ALTER TABLE "SDA_PARAMETROS" ADD CONSTRAINT "PARAMETROS_METODOS" FOREIGN KEY ("ID_METODO")
      REFERENCES "SDA_METODOS" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table SDA_RESPUESTAS
--------------------------------------------------------

  ALTER TABLE "SDA_RESPUESTAS" ADD CONSTRAINT "AGR_RESPUESTAS_FK1" FOREIGN KEY ("ID_METODO")
      REFERENCES "SDA_METODOS" ("ID") ON DELETE CASCADE ENABLE;
