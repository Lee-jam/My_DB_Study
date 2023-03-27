# 230327

DDL - CREATE, ALTER, DROP, TRUNCATE   
DML - INSERT, UPDATE, DELETE, SELECT   
```
DROP과 TRUNCATE의 차이  
DROP은 테이블 자체를 삭제시키는 명령어이고, TRUNCATE는 테이블은 남겨두고 데이터만 전부 삭제하는 명령어임.
```

------▲복습▲------   
## VIEW SELECT
---
일시적인 VIEW TABLE을 생성하여 하나의 테이블처럼 사용함.
```SQL
VIEW WITH <별칭> AS SELECT ...

SELECT ...
FROM <별칭>
```
## DCL (Data Control Language)
---
Grant : 사용자에게 권한을 부여하는 명령어

Revoke : 사용자에게 부여한 권한을 삭제하는 명령어
```
권한을 주거나 삭제할 때는 sys권한이 있거나 그에 준하는 권한이 있어야 가능함.
```
ROLE : 정해진 룰(권한)을 정하여 하나씩 권한부여하지 않고 한번에 할 수 있도록 하는 권한의 묶음
```SQL
--Role 생성
CREATE ROLE <ROLE_NAME>;
GRANT CONNECT,RESOURCE,CREATE VIEW TO <ROLE_NAME>;

--Role 부여
GRANT <ROLE_NAME> TO <USER_NAME>
```

> CONNECT : 접속에 관련된 권한  
> RESOURCE : 객체의 생성,수정,삭제나 데이터의 입력,수정,조회,삭제의 권한
## TCL (Transaction Control Language)
---
Commit : DML로 변경된 내용을 최종 반영하는 명령어   

Rollback : DML로 변경된 내용은 마지막 Commit 상태로 돌리는 명령어

```
DML로 변경된 내용은 커밋을 해야 내가 작성한 SQL문이 반영이 완료가 됨.   
커밋을 완료하면 트랜잭션이 완전히 끝나기 때문에 ROLLBACK으로 되돌릴 수 없음.   
```
권한을 주기 위한 Role

## 유저 생성
---
```SQL
 CREATE USER [USER NAME] IDENTIFIED BY [PASSWORD]
```


## INDEX
---
> INDEX 란 테이블이나 클러스트에 쓰여지는 선택적인 <B>객체</B>로 테이블 내의 원하는 데이터를 빠르게 찾아갈 수 있도록 만들어진 데이터 구조이며, 일종의 색인 기술로써 테이블에 INDEX를 생성하게 되면 INDEX TABLE 을 생성해 관리함. IDEX 생성시 아무 옵션 없이 DEFAULT로 생성하면 B-Tree INDEX가 생성 됨.
>> 색인이란 효율적인 검색을 위해 문서의 집합을 미리 가공해두는 과정을 의미

### INDEX 생성 기준
<br>

1. 카디널리티(컬럼의 중복 수치)가 높을 때
2. 선택도가 낮을 때
3. 조회 활요도가 높을 때
4. 수정빈도가 낮을 때

```SQL
--INDEX 생성--

CREATE INDEX <INDEX_NAME> ON <TABLE_NAME>(COL1,COL2....)

--INDEX 삭제--
DROP INDEX <INDEX_NAME>
```

## DICTIONARY
---
읽기전용으로 제공되는 테이블 및 뷰들의 집합으로 데이터베이스 전반에 대한 정보를 제공함.
```
USER_?? : 사용자 관련 객체 정보
ALL_?? : 사용자 사용가능한 객체 정보
DBA_?? : DB관련 정보 (SYSTEM SYS)
V$_?? : VIEW 관련
OBJ : 객체 관련 정보
```

## VIEW TABLE
---
VIEW SELECT의 임시적인 테이블 형성이 아닌 테이블들을 결합하여 입맛대로 만들어서 사용할 수 있는 가상의 테이블
```SQL
--VIEW 생성

CREATE VIEW <VIEW_NAME>
AS (SELECT ...
     FROM <TABLE1>, <TABLE2>...
     WHERE <조건문>);
```

## SEQUENCE
---
```SQL
--시퀀스 생성--

CREATE SEQUENCE [SEQUCENCE NAME] //무슨 이름으로 만들고
    INCREMENT BY [NUM] //얼마씩 커질건지
    START WITH [START NUM] // 몇 부터 시작하고
    NOMINVALUE OR MINVALUE [MIN NUM] 최소값
    NOMINVALUE OR MAXVALUE [MAX NUM] 최대값
    CYCLE OR NOCYCLE // CYCLE이면 값이 증가하다가 최대값에 도달하면 다시 최소값으로
    CACHE OR NOCACHE // CACHE 면 메모리 상에 임시로 저장할지 말지
```