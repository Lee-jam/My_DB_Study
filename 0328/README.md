# 230328 DB
후 한번에 너무 많은 양이 들어왔다...
## 교체
---
REPLACE : 문자열의 교체, 치환하는 함수이며, 치환 문자에 아무값도 넣지 않을 경우 빈공간으로 치환됨
```SQL
REPLACE('문자열','치환하려는 문자','치환 문자')
```
## 문자,문자열 찾기
---
INSTR : 문자열에서 원하는 문자나 문자열을 찾는 함수
```SQL
INSTR('문자열','찾는 문자,문자열',시작인덱스 숫자)

--찾고자 하는 문자나 문자열이 처음이 아닌 후에 있는 것을 찾을 때
INSTR('문자열','찾는 문자,문자열',시작인덱스 숫자, 몇번째)
```

## 공백 채우기, 없애기
---
PAD(LPAD, RPAD) : 전체길이를 정해주고 공백이 남으면 어떤 내용으로 채울 껀지를 정해줌.   
정해주지 않으면 공백으로 채워짐
```SQL
--SYNTAX
LPAD('내용',전체길이,채울문자)

LPAD('ORACLE',10,'#')
-- ####ORACLE
RPAD('HELLO',5,'@')
-- HELLO@@@@@
```

TRIM : 양쪽의 공백이나 정해진 문자를 다른 문자에 걸리기 전까지 없애줌  
LEADING FROM : 왼쪽의 공백이나 정해진 문자를 다른 문자에 걸리기 전까지 없애줌  
LTRIM : 왼쪽의 공백이나 정해진 문자열을 다른 문자에 걸리기 전까지 없애줌  
TRAILING FROM : 오른쪽의 공백이나 정해진 문자를 다른 문자에 걸리기 전까지 없애줌
RTRIM : 오른쪽의 공백이나 정해진 문자열을 다른 문자나에 걸리기 전까지 없애줌  
BOTH FROM : 양쪽의 공백을 없애줌
```SQL
SELECT '['||TRIM('^' FROM '^^     ^ ORA CLE ^     ^^')||']' AS TRIM
        ,'['||TRIM(LEADING '^' FROM'^^ ^^      ORA CLE      ')||']' AS TLEAD
        ,'['||TRIM(TRAILING FROM'     ORA CLE      ')||']' AS TRAING
        ,'['||TRIM(BOTH FROM'     ORA CLE     ')||']' AS TBOTH
FROM DUAL;

SELECT '['||TRIM('  ^ORACLE^ ')||']' AS TRIM
    ,'['||LTRIM('  ^ORACLE^ ')||']' AS LTRIM
    ,'['||LTRIM('  <^ORACLE^> ','^< ')||']' AS LTRIM2
    ,'['||RTRIM('  ^ORACLE^ ')||']' AS RTRIM
    ,'['||RTRIM('  <^ORACLE^> ','> ^')||']' AS RTRIM2
    FROM DUAL;
```


## NUMBER FUNCTION
---
ROUND : 반올림  
```SQL
ROUND(3.14)
--3
ROUND(3.15,1)
--3.2
ROUND(555,-2)
--600
```
TRUNC : 자르기  
```SQL
TRUNC(3.14)
--3
TRUNC(3.14,1)
--3.1
```
CEIL : 올림  
FLOOR : 버림  
MOD : 나머지 연산
```SQL
CEIL(1234.51)
--1235
FLOOR(1234.51)
--1234
MOD(5,2)
--1
```

> 문자열 합에는 CONCAT이나 ||(세로줄, 버티컬 바 등...)을 사용

## DATE FUNCTION
---
SYSDATE : 시스템의 현재 시간과 날짜를 표시해주는 함수  
```SQL
SELECT SYSDATE FROM DUAL;
```
MONTHS_BETWEEN : 입력한 두 날짜의 년월일 차이를 월단위 수치로 반환
```SQL
MONTHS_BETWEEN('DATE1','DATE2');
-- DATE1-DATE2
```
NEXT_DAY : 입력한 날짜의 다음 요일까지의 날짜를 반환  
```SQL
--SYNTAX
NEXT_DAY(SYSDATE,'요일');
```
LAST_DAY : 입력한 날짜의 마지막 요일(한달의 마지막 요일)을 반환  
```SQL
LAST_DAY(SYSDATE);
```
ADD_MONTHS : 입력한 날짜에 ±월을 한 날짜를 반환
```SQL
ADD_MONTHS(SYSDATE,-10);
-- SYSDATE 에서 나오는 날짜 : 23/03/28
-- ADD_MONTHS 한 날짜 : 22/07/28
```
## TYPE CONVERSION
---
TO_CHAR : 타입을 문자열로 변환  
```SQL
SELECT
    TO_CHAR(SAL,  '$999,999') AS SAL_$,
    TO_CHAR(SAL,  'L999,999') AS SAL_L,
    TO_CHAR(SAL,  '999,999.00') AS SAL_1,
    TO_CHAR(SAL,  '000,999,999.00') AS SAL_2,
    TO_CHAR(SAL,  '00099999.99') AS SAL_3,
    TO_CHAR(SAL,  '999,999,00') AS SAL_4
FROM DUAL;
```
TO_NUMBER : 타입을 숫자로 변환  
```SQL
SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999') FROM DUAL;
```
TO_DATE : 숫자형태의 문자열이나 숫자타입을 날짜 포맷으로 변환
```SQL
SELECT 
    TO_DATE('2018-07-14','YYYY-MM-DD') AS TODATE 
    ,TO_DATE('20180714','YYYY-MM-DD') AS TODATE2
    ,TO_DATE(180714,'YY-MM-DD') AS TODATE3
    ,TO_DATE('2018/07/14','YYYY-MM-DD') AS TODATE4
    ,TO_DATE('2018@07@14','YYYY-MM-DD') AS TODATE5
FROM DUAL;
```
## NULL FUNCTION
---
NULL값이 있을 경우 NULL을 대신하는 데이터로 대체하고자 하는 함수  
종류 : NVL, NVL2  
COALESCE는 요새 잘 안쓴다고 함.
```SQL
--SYNTAX
NVL(VALUE1,VALUE2)
-- VALUE1이 NULL일 경우 VALUE2로 대체
NVL2(COLUMN,A,B)
-- COLUMN 값 안에 NULL이 있을 경우 B, 아니면 A
```

## CONDITION FUNCTION
---
CASE
```SQL
/*CASE WHEN <조건> THEN <반환>
       WHEN <조건> THEN <반환>
       WHEN <조건> THEN <반환>
       ..
       ELSE <반환>
       END*/
```
DECODE
```SQL
/*DECODE(COL_NAME,
    <COL_NAME_VALUE>,<반환>
    <COL_NAME_VALUE>,<반환>
    <COL_NAME_VALUE>,<반환>
    ...
    <반환>*/
```
### CASE와 DECODE의 차이  
<table style='border:1px solid black; text-align:center;'>
    <tr>
    <td>CASE</td>
    <td>DECODE</td>
    </tr>
    <tr>
    <td>SQL문과 PL/SQL문에 모두 사용가능</td>
    <td>SQL문에만 사용 가능</td>
    </tr>
        <tr>
    <td>WHEN 이후 조건문 작성 가능(비교연산)</td>
    <td>단순 조건 값(등가연산)</td>
    </tr>
        <tr>
    <td>NULL = NULL? 일때 FALSE 반환 </td>
    <td>NULL = NULL? 일때 TRUE 반환</td>
    </tr>
        <tr>
    <td>SQL문과 PL/SQL문에 모두 사용가능</td>
    <td>SQL문에만 사용 가능</td>
    </tr>
</table>

<BR>

## PL/SQL
---
> (PRODEDURAL LANGUAGE EXTENTION TO SQL) SQL 확장 절차 언어로 PROCEDURE(프로시져), FUCNTION(함수), TRIGGER(트리거), PACKAGE(패키지)가 있음.

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
    END
        끝//필수
```
    DBMS_OUTPUT.PUT_LINE(출력내용) : 자바의 PRINT 처럼 내용을 출력할 때 사용
    
내일 FUNCTION,TRIGGER와 하나로 작성할 것.