/*PL/SQL (PRODEDURAL LANGUAGE EXTENTION TO SQL) SQL 확장 절차 언어
    Procedure : 리턴 값이 하나 이상인 경우
    Function : 리턴이 반드시 있는 경우(input/output)
    Trigger : 특정한 이벤트 발생 자동으로 실행
    
    Package: 프로시저, 함수, 변수 등을 묶어 놓은 것
    
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
    ========================================================
    DBMS_OUTPUT.PUT_LINE(출력내용)
    
변수명 상수지정 데이터타입 리터럴,변수,표현식(함수, 연산자)
IDENTIFIER [CONSTANT] DATATYPE [:= | DEFAULT EXPRESSION ]
ex) PASSWORD CONSTANT VARCHAR2 :='23412';
     PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';
     
반복문
FOR INDEX IN 시작값...끝값 LOOP 
      실행문
      . . .
END LOOP;


LOOP
    실행문
    EXIT [WHEN CONDITION]
END LOOP;
    
*/

CREATE OR REPLACE PROCEDURE PROCTEST1
AS
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO WORLD');
END;

CREATE OR REPLACE PROCEDURE PROCTEST2(NUM IN NUMBER)
IS
    V_EMPNO CONSTANT NUMBER(4) := 7788;
    V_ENAME VARCHAR(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_ENAME:='||V_ENAME);
    DBMS_OUTPUT.PUT_LINE('V_ENAME:='||V_EMPNO);
END;

CREATE OR REPLACE PROCEDURE PROCTEST3
IS 
    DATA EMP%ROWTYPE;
    -- 해당하는 테이블(EMP)의 ROW(행 전체)를 받아오겠다.
    V_ENAME EMP.ENAME%TYPE;
    --해당하는 테이블
    V_DEPTNO EMP.DEPTNO%TYPE;
BEGIN
    SELECT * INTO DATA
    FROM EMP
    WHERE EMPNO='7369';
    SELECT ENAME, DEPTNO INTO V_ENAME, V_DEPTNO
    FROM EMP
    WHERE EMPNO='7499';
    DBMS_OUTPUT.PUT_LINE(DATA.ENAME||','||DATA.DEPTNO);
    DBMS_OUTPUT.PUT_LINE(V_ENAME||','||V_DEPTNO);
END;

CREATE OR REPLACE PROCEDURE PROCTEST4 AS
BEGIN
    FOR I IN 1..4
    LOOP
        IF MOD(I,2)=0
            THEN DBMS_OUTPUT.PUT_LINE('짝수');
        ELSE
            DBMS_OUTPUT.PUT_LINE('홀수');
        END IF;
    END LOOP;
    FOR LIST IN (SELECT EMPNO FROM EMP)
    LOOP
        IF MOD(LIST.EMPNO,2)=0
            THEN DBMS_OUTPUT.PUT_LINE(LIST.EMPNO||'짝수');
        ELSE
            DBMS_OUTPUT.PUT_LINE(LIST.EMPNO||'홀수');
        END IF;
    END LOOP;
END;

CREATE OR REPLACE PROCEDURE PROCTEST5
IS
    V_NUM NUMBER := 1;
    V_SUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('NOW'||V_NUM);
        V_NUM:=V_NUM+1;
        V_SUM:=V_SUM+V_NUM;
        EXIT WHEN V_NUM >10;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('SUM :'||V_SUM);
    V_NUM :=1;
    V_SUM :=0;
    FOR I IN 1..10
    LOOP
    DBMS_OUTPUT.PUT_LINE('NOW'||V_NUM);
    V_NUM:=V_NUM+1;
    V_SUM:=V_SUM+V_NUM;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('SUM :'||V_SUM);
END PROCTEST5;


