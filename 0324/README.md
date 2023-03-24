# 230324 DB
데이터 무결성을 위한 제약조건
not null, unique


## 테이블 생성
---
> 테이블은 데이터베이스에서 데이터를 저장하는 기본단위이며,   
  사용하기 위해서는 sql문을 통해 생성을 해야 함.
```sql
/*
테이블 생성 예문
CREATE TABLE TABLE_NAME(
        COLUMN_NAME DATA_TYPE(LENGTH)
*/

CREATE TABLE EMP_DDL(
    EMPNO NUMBER(4),
    ENAME VARCHAR2(10),
    JOB VARCHAR(9),
    MGR NUMBER(4),
    HIREDATE DATE,
    SAL NUMBER(7),
    COMM NUMBER(7),
    DEPINO NUMBER(2)
    );
```
## DDL : Data defined Language
---
> DDL 이란 테이블 내의 데이터 구조를 정의하고 생성, 변경, 삭제할 때 사용하는 데이터 구조와 관련된 명령어

<br>


ALTER : 테이블 내 열(COLUMN)을 추가,삭제,수정을 할 수 있도록 하는 명령어
```SQL
/*ALTER TABLE TABLE_NAME
  1.ADD <COLNAME> <DATATYPE>; //추가
  2.DROP <COLNAME>; //삭제
  3.MODIFY <COLNAME> <DATATYPE>; //수정
  4.RENAME COLUMN <OLD_COLNAME> TO <NEW_COLNAME> //컬럼 이름변경
 */
```
COMMENT : 테이블이나 테이블의 컬럼의 의미가 무엇인지에 대한 주석을 추가
```SQL
/*
COMMENT ON TABLE <TABLE_NAME> IS <COMMENT>;
COMMENT ON COLUMN <TABLE_NAME>.<COLNAME> IS <COMMENT>;
*/
```

## DML : Data Manipulation Language
---
> DML 이란 데이터베이스의 테이블 내의 데이터를 변형(추가 수정 삭제)할 때 사용하는 명령어

INSERT : 테이블의 데이터를 추가할 때 사용하는 명령어
```sql
/* 1대1 매칭
INSERT INTO <TABLE NAME>(COL1,COL2,COL3,...) VALUES(VAL1,VAL2,VAL3,...);
*/
/* 순차적 매칭
INSERT INTO <TABLE NAME> VALUES(VAL1,VAL2,VAL3,...);
*/
```

