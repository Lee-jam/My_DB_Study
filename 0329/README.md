# 230329 DB
PL/SQL (PRODEDURAL LANGUAGE EXTENTION TO SQL) : SQL 확장 절차 언어  
DBMS_OUTPUT.PUT_LINE(출력내용) : 자바의 콘솔로그와 비슷하게 로깅 메세지에 해당 출력 내용을 출력
## Procedure
```
선언부
    DECLARE
        변수 상수 커서 값 선언 부분 // 선택
    실행부
    BEGIN
        절차적 언어 제어문, 반복문, 함수 로직이 기술 // 필수
    예외 처리부
    EXCEPTION
        예외사항 처리하는 부분//선택
    실행문 종료부
    END 끝//필수

CREATE OR REPLACE PROCEDURE 프로시져명
IS OR AS //선택
    변수 상수 커서 값 선언
BEGIN //필수
    절차적 언어 제어문, 반복문, 함수 로직이 기술 // 필수
EXCEPTION //선택
    예외사항 처리
END//필수

```
## Function
TO_CHAR, TO_DATE, SYSDATE => 내장함수  
사용자 정의 함수(User Defined Function) : 특정한 기능을 모듈화하여 재사용이 용이하고 쿼리문을 간결하게 해줌.
```
CREATE OR REPLACE FUNCTIION 함수명 [ (ARGUMENT. . .) ]
RETURN 데이터 타입(반환값)
IS[AS] 선언부
BEGIN 실행부
[EXCEPTION]
RETURN 변수/값; 필수
END;
```
## Trigger
Trigger는 데이터베이스 특정 동작(이벤트)에 반응하여 실행되는 개체이며 무결성, 자동화 목적임
```
CREATE OR REPLACE TRIGGER 트리거명
{BEFORE|AFTER} 이벤트명 {INSERT|UPDATE|DELETE}
[OF 특정 컬럼]
ON 테이블명
[REFERENCING OLD AS OLD|NEW AS NEW]
[FOR EACH ROW WHEN 조건절]
[FOLLOWS]
[ENABLE|DISABLE]
선언부
실행부
END 트리거명;
```
## 변수 지정
```SQL
IDENTIFIER [CONSTANT] DATATYPE [:= | DEFAULT EXPRESSION ]
ex) PASSWORD CONSTANT VARCHAR2 :='23412';
     PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';
```
## 반복문
```SQL
FOR INDEX IN 시작값...끝값 LOOP 
      실행문
      . . .
END LOOP;

LOOP
    실행문
    EXIT [WHEN CONDITION]
END LOOP;
```
## 