-- ���� �����⸦ �õ��ϴ� DBMS_METADATA�� ONIGAWARA.SKILL ��ü�� ���� TABLE DDL�� �������� �� �����ϴ�.
CREATE TABLE SKILL 
(
  SK_CODE NUMBER(4, 0) 
, SK_NAME VARCHAR2(100 BYTE) 
, SK_ATK NUMBER(4, 0) 
, SK_DEF NUMBER(4, 0) 
, SK_SUB VARCHAR2(1000 BYTE) 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  NEXT 1048576 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL