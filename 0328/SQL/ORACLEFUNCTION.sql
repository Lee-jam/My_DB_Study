/* CHAR FUNCTION
    UPPER LOWER INITCAP
*/
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

SELECT * FROM EMP WHERE LOWER(ENAME)='james';
--LENGTHB �� ����Ʈ�� ���� ���� ��ȯ��.
SELECT ENAME, LENGTH(ENAME), SAL,LENGTH(SAL),LENGTH('�ѱ�'),LENGTHB('�ѱ�')
FROM EMP;

SELECT JOB, SUBSTR(JOB,1,2),SUBSTR(JOB,3,2),SUBSTR(JOB,5),SUBSTR(JOB,-LENGTH(JOB)),SUBSTR(JOB,-LENGTH(JOB),2),SUBSTR(JOB,-3) FROM EMP;

SELECT INSTR('HELLO, ORACLE','L') INS1,
          INSTR('HELLO, ORACLE','L',5) INS2,
          INSTR('HELLO, ORACLE','L',2,2) INS3 FROM DUAL;
          
SELECT JOB, INSTR(JOB,'A',1,2)
FROM EMP
WHERE INSTR(JOB,'A')>0;

SELECT JOB, INSTR(JOB,'A',1,2)
FROM EMP
WHERE JOB LIKE '%A%';

SELECT '010-1234-1234' AS ORIGIN
    ,REPLACE('010-1234-1234','-',' ') AS RE1
    ,REPLACE('010-1234-1234','-') AS RE2
    from dual;
    
SELECT 'Oracle'
    ,LPAD('Oracle',10,'#') AS LPAD1
    ,RPAD('Oracle',10,'#') AS RPAD1
    ,LPAD('Oracle',10) AS LPAD2
    ,RPAD('Oracle',10) AS RPAD2
    from dual;
    

SELECT '011230-3122332' AS ORI
    ,RPAD(SUBSTR('011230-3122332',1,7),14,'*') AS BLOCK
    ,CONCAT(SUBSTR('011230-3122332',1,7),'*******') AS CON
    , 'SDFASDF'||'SDASKHDJKL'||'WQEWQEWQ'||'XCSADAF' AS EN
    FROM DUAL;
    
    
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

/*NUMBER FUNCTION*/
SELECT ROUND(1234.5648) AS R
        ,ROUND(1234.4567,-3) AS R1
FROM DUAL;

SELECT TRUNC(1234.5345) AS R
        ,TRUNC(1234.5678,1) AS R1
        FROM DUAL;
    
SELECT CEIL(1234.53)
        ,FLOOR(1234.56)
        ,CEIL(-1234.53)
        ,FLOOR(-1234.56)
        FROM DUAL;    
    
SELECT MOD(15,6),MOD(10,2),MOD(11,2) FROM DUAL;--% ������ ����

/*DATE FUNCTION*/
SELECT SYSDATE AS NOW
    ,SYSDATE-1 AS YESTERDAY
    ,SYSDATE+1 AS TOMORROW
    ,(SELECT HIREDATE FROM EMP WHERE EMPNO=7934)
    -(SELECT HIREDATE FROM EMP WHERE EMPNO=7902) AS DIFF
    FROM DUAL;
    
SELECT SYSDATE,ADD_MONTHS(SYSDATE,3) FROM DUAL;
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE,120) AS WORK10 FROM EMP;

--ȸ�翡�� 32�� �̻� ���ѻ�� ã��

SELECT ENAME,HIREDATE FROM EMP WHERE ADD_MONTHS(HIREDATE,384)< SYSDATE;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE
        ,MONTHS_BETWEEN(HIREDATE,SYSDATE) AS MONTHS1
        ,MONTHS_BETWEEN(SYSDATE,HIREDATE) AS MONTHS2
        ,TRUNC(MONTHS_BETWEEN(SYSDATE,HIREDATE)) AS MONTHS3
        FROM EMP;
        
SELECT SYSDATE,NEXT_DAY(SYSDATE,'������'),LAST_DAY(SYSDATE) FROM DUAL;

SELECT SYSDATE, 
          ROUND(SYSDATE,'CC') AS FROMAT_CC,
          ROUND(SYSDATE,'YYYY') AS FROMAT_YYYY,
          ROUND(SYSDATE,'Q') AS FROMAT_Q,
          ROUND(SYSDATE,'DDD') AS FROMAT_DDD,
          ROUND(SYSDATE,'HH') AS FROMAT_HH,
          ROUND(SYSDATE,'MM') AS FROMAT_MM,
          TRUNC(SYSDATE,'MM') AS FROMAT_MM2
          FROM DUAL;
          
/* TYPE CONVERSION */
DESC EMP;
SELECT EMPNO, ENAME
        ,EMPNO+'500'
        --,EMPNO+'ABCD'
        ,ENAME||500
        ,ENAME||'SDKJF'
        FROM EMP;
        
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') AS NOW
FROM DUAL;

SELECT SYSDATE, TO_CHAR(SYSDATE,  'MM') AS MM FROM DUAL;

SELECT SYSDATE
          ,TO_CHAR(SYSDATE, 'MM') AS MM
          ,TO_CHAR(SYSDATE,  'MON','NLS_DATE_LANGUAGE=KOREAN') AS MON_KOR
          ,TO_CHAR(SYSDATE,  'MON','NLS_DATE_LANGUAGE=ENGLISH') AS MON_ENG
          ,TO_CHAR(SYSDATE,  'MONTH','NLS_DATE_LANGUAGE=KOREAN') AS MONTH_KOR
          ,TO_CHAR(SYSDATE,  'MONTH','NLS_DATE_LANGUAGE=ENGLISH') AS MONTH_ENG
          ,TO_CHAR(SYSDATE,  'DAY') AS DAY
          ,TO_CHAR(SYSDATE,  'DAY','NLS_DATE_LANGUAGE=ENGLISH') AS DAY_ENG
FROM DUAL;


/*���� ǥ�� ��� 9 ���� ���ڸ� 0 ���ڸ��� ä�� L��������*/
SELECT SAL,
          TO_CHAR(SAL,  '$999,999') AS SAL_$,
          TO_CHAR(SAL,  'L999,999') AS SAL_L,
          TO_CHAR(SAL,  '999,999.00') AS SAL_1,
          TO_CHAR(SAL,  '000,999,999.00') AS SAL_2,
          TO_CHAR(SAL,  '00099999.99') AS SAL_3,
          TO_CHAR(SAL,  '999,999,00') AS SAL_4
FROM EMP;


SELECT TO_NUMBER('1,300','999,999')-TO_NUMBER('1,500','999,999')
FROM DUAL;

SELECT TO_DATE('2018-07-14','YYYY-MM-DD') AS TODATE 
        ,TO_DATE('20180714','YYYY-MM-DD') AS TODATE2
        ,TO_DATE('180714','YY-MM-DD') AS TODATE3
        ,TO_DATE('2018/07/14','YYYY-MM-DD') AS TODATE4
        ,TO_DATE('2018@07@14','YYYY-MM-DD') AS TODATE5
FROM DUAL;

SELECT * FROM EMP WHERE HIREDATE > '81@06@01'; --TYPE�������� �Ͼ�� ó������

SELECT * FROM EMP WHERE HIREDATE > TO_DATE('06/01/1981','MM-DD-YYYY'); -- �Ͼ�� ���� ��� ���� ������ �����־�� ��.

/*NULL FUNCTION
NVL NVL2 COALESCE
*/
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM AS PAY
         ,NVL(COMM,0),SAL+NVL(COMM,0)
         ,SAL+NVL(COMM,0)
         ,NVL2(COMM,'O','X')
         ,NVL2(COMM,SAL*12+COMM,SAL*12) AS ANNSAL
FROM EMP;

/*������ CASE WHEN <����> THEN <��ȯ>
                   WHEN <����> THEN <��ȯ>
                   WHEN <����> THEN <��ȯ>
                   ..
                   ELSE <��ȯ>
                   END*/
SELECT EMPNO, ENAME, JOB, SAL,COMM,CASE
    WHEN JOB='MANAGER' THEN SAL*1.1
    WHEN JOB='SALESAMAN' THEN SAL*1.05
    WHEN JOB='ANALYST' THEN SAL
    ELSE SAL*1.03
    END AS UPSAL
    , CASE
    WHEN COMM IS NULL THEN '�ش����'
    WHEN COMM=0 THEN '�������'
    WHEN COMM>0 THEN '���� : '||COMM
    END AS COMM_TEXT
    FROM EMP;

/*������ DECODE(COL_NAME,
                    <COL_NAME_VALUE>,<��ȯ>
                    <COL_NAME_VALUE>,<��ȯ>
                    <COL_NAME_VALUE>,<��ȯ>
                    ...
                    <��ȯ>*/
SELECT EMPNO,ENAME, JOB,SAL,COMM
        ,DECODE(JOB,
                'MANAGER',SAL*1.1,
                'SLAESMAN',SAL*1.05,
                'ANALYST',SAL,
                SAL*1.03) AS UPSAL
FROM EMP;

--Q1. EMP ���̺����� ���, ����� ���ڸ� �ڿ��� *�� ����ŷ
--�̸�, �̸� ù�ڸ� �ڷδ� *�� ����ŷ
SELECT DEPTNO, RPAD(SUBSTR(DEPTNO,1,2),4,'*'),ENAME,SUBSTR(ENAME,1,1)||TRANSLATE(SUBSTR(ENAME,2),'ABCDEFGHIJKLMNOPQRSTUVWXYZ','**************************') AS ENA
FROM EMP;

SELECT DEPTNO, RPAD(SUBSTR(DEPTNO,1,2),4,'*'),ENAME, RPAD(SUBSTR(ENAME,1,1),LENGTH(ENAME),'*')
FROM EMP WHERE LENGTH(ENAME)=5;

--Q2. EMP ���̺����� ���, �����, ����, �ϴ�(�� �ٹ��ϼ��� 20.5�Ϸ� ���)
-- ,�ñ�(�Ϸ� �ٹ��ð��� 8�ð����� ���)
SELECT DEPTNO, ENAME, SAL,TRUNC(SAL/20.5,2),ROUND(SAL/20.5/8,1)
FROM EMP;

SELECT * FROM EMP;

-- Q3. EMP ���̺����� ���, �����, �Ի���(����(4�ڸ�)/��/�Ϸ� ǥ��)
-- ,�Ի��Ϸκ��� ���� �� ���� �������� ��¥(����(4�ڸ�)-��-�Ϸ� ǥ��)
-- ,����(COMM�� ���� ����� N/A�� ǥ��)

SELECT EMPNO,ENAME,
          TO_CHAR(HIREDATE,'YYYY-MM-DD') AS �Ի�⵵,
          TO_CHAR(NEXT_DAY(ADD_MONTHS(HIREDATE,3),'������'),'YYYY-MM-DD') AS ���޵�,
          NVL2(COMM,TO_CHAR(COMM),'N/A')
FROM EMP
ORDER BY �Ի�⵵;

-- Q4. EMP ���̺����� ���, �����, �����ڻ��(������ ' '���� ǥ��)
--    , ��ü ������(������ ����� ù ���ڸ� ���� ������ '0000', '75'�̸� '5555', '76'�̸� '6666','77'�̸�'7777',78'�̸� '8888', �׿ܿ��� ���� ������ ������� ǥ��)
SELECT EMPNO, ENAME, NVL2(MGR,TO_CHAR(MGR),' ') AS ������,
         CASE
            WHEN MGR IS NULL THEN '0000'
            WHEN SUBSTR(MGR,1,2)=75 THEN '5555'
            WHEN SUBSTR(MGR,1,2)=76 THEN '6666'
            WHEN SUBSTR(MGR,1,2)=77 THEN '7777'
            WHEN SUBSTR(MGR,1,2)=78 THEN '8888'
            ELSE TO_CHAR(MGR)
            END AS ��ü������
FROM EMP
ORDER BY EMPNO;

SELECT EMPNO, ENAME, NVL2(MGR,TO_CHAR(MGR),' ') AS ������,
         DECODE(
         SUBSTR(MGR,1,2),NULL,'0000'
                               ,75, '5555'
                               ,76, '6666'
                               ,77, '7777'
                               ,78, '8888'
                               ,TO_CHAR(MGR)
        ) AS ��ü������
FROM EMP
ORDER BY EMPNO;

CREATE TABLE DEPT_CONST(
        DEPTNO NUMBER(2) NOT NULL,
        DNAME VARCHAR2(14),
        LOC VARCHAR2(13)
        );
DROP TABLE DEPT_CONST;

CREATE TABLE DEPT_CONST AS
SELECT * FROM DEPT
WHERE 1<>1;