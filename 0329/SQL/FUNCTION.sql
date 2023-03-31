/* FUNCTION �Լ�
TO_CHAR, TO_DATE, SYSDATE => �����Լ�
�츮�� �Ϸ��� ���� ����� ���� �Լ�(User Defined Function)
Ư���� ����� ���ȭ�Ͽ� ������ �����ϰ� �������� �����ϰ� ����.
CREATE OR REPLACE FUNCTIION �Լ��� [ (ARGUMENT. . .) ]
RETURN ������ Ÿ��(��ȯ��)
IS[AS] �����
BEGIN �����
[EXCEPTION]
RETURN ����/��; �ʼ�
END;
*/
CREATE OR REPLACE FUNCTION FN_GET_DEPT_NAME(P_DEPTNO IN NUMBER)
RETURN VARCHAR2
IS
    V_DEPTNAME DEPT.DNAME%TYPE;
BEGIN
    SELECT DNAME INTO V_DEPTNAME
    FROM DEPT
    WHERE DEPTNO=P_DEPTNO;
    RETURN V_DEPTNAME;
END;

-- DEPT ���̺��� �ִ� DNAME �� DEPTNO�� P_DEPTNO�� ���� ���ǿ� �´� ���� �������� �� ���� V_DEPTNAME�� �ִ´�.