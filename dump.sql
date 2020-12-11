--------------------------------------------------------
--  File created - Friday-December-11-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table ALERTS
--------------------------------------------------------

  CREATE TABLE "SPRKFLX"."ALERTS" 
   (	"ID" NUMBER, 
	"CHANGED_AT" TIMESTAMP (6)
   ) SEGMENT CREATION DEFERRED 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  TABLESPACE "USERS" ;
REM INSERTING into SPRKFLX.ALERTS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index ALERTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "SPRKFLX"."ALERTS_PK" ON "SPRKFLX"."ALERTS" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table ALERTS
--------------------------------------------------------

  ALTER TABLE "SPRKFLX"."ALERTS" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "SPRKFLX"."ALERTS" MODIFY ("CHANGED_AT" NOT NULL ENABLE);
  ALTER TABLE "SPRKFLX"."ALERTS" ADD CONSTRAINT "ALERTS_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  TABLESPACE "USERS"  ENABLE;
