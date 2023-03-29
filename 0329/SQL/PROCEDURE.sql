/*PL/SQL (PRODEDURAL LANGUAGE EXTENTION TO SQL) SQL Ȯ�� ���� ���
    Procedure : ���� ���� �ϳ� �̻��� ���
    Function : ������ �ݵ�� �ִ� ���(input/output)
    Trigger : Ư���� �̺�Ʈ �߻� �ڵ����� ����
    
    Package: ���ν���, �Լ�, ���� ���� ���� ���� ��
    
    �����
    DECLARE
        ���� ��� Ŀ�� �� ���� �κ� // ����
    �����
    BEGIN
        ������ ��� ���, �ݺ���, �Լ� ������ ��� // �ʼ�
    ���� ó����
    EXCEPTION
        ���ܻ��� ó���ϴ� �κ�//����
    ���๮ �����
    END
        ��//�ʼ�
    ========================================================
    DBMS_OUTPUT.PUT_LINE(��³���)
    
������ ������� ������Ÿ�� ���ͷ�,����,ǥ����(�Լ�, ������)
IDENTIFIER [CONSTANT] DATATYPE [:= | DEFAULT EXPRESSION ]
ex) PASSWORD CONSTANT VARCHAR2 :='23412';
     PASSWORD CONSTANT VARCHAR2 DEFAULT '1234';
     
�ݺ���
FOR INDEX IN ���۰�...���� LOOP 
      ���๮
      . . .
END LOOP;


LOOP
    ���๮
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
    -- �ش��ϴ� ���̺�(EMP)�� ROW(�� ��ü)�� �޾ƿ��ڴ�.
    V_ENAME EMP.ENAME%TYPE;
    --�ش��ϴ� ���̺�
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
            THEN DBMS_OUTPUT.PUT_LINE('¦��');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Ȧ��');
        END IF;
    END LOOP;
    FOR LIST IN (SELECT EMPNO FROM EMP)
    LOOP
        IF MOD(LIST.EMPNO,2)=0
            THEN DBMS_OUTPUT.PUT_LINE(LIST.EMPNO||'¦��');
        ELSE
            DBMS_OUTPUT.PUT_LINE(LIST.EMPNO||'Ȧ��');
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


