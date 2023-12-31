# EMP, DEPT를 이용한 JOIN 테이블 생성
SELECT EMPNO, ENAME, E.DEPTNO, LOC FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;

# 급여가 2000 초과인 사원들의 부서 정보, 사원정보 출력
SELECT E.DEPTNO, DNAME, EMPNO, ENAME, SAL
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO AND SAL >= 2000;

# 급여 범위를 지정하는 조건식으로 조인
SELECT * FROM SALGRADE;
SELECT * FROM EMP;

# 비등가 JOIN
SELECT * FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;

# 자체 JOIN
SELECT * FROM EMP E, EMP C
WHERE E.MGR = C.EMPNO;

# 8-8
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
 WHERE E1.MGR = E2.MGR;
 
# 외부 JOIN OUTTER JOIN
SELECT * FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT * FROM EMP WHERE ENAME = 'KING';

# 일반적 등가 조인
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

# LEFT OUTTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

#RIGHT OUTTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

# ANSI 표준
# SQL-99

SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR,
        E.HIREDATE, E.SAL, E.COMM,
        DEPTNO, D.DNAME, D.LOC
FROM EMP E NATURAL JOIN DEPT D
ORDER BY DEPTNO, E.EMPNO;

# P.234 JOIN ~ ON
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR,
        E.HIREDATE, E.SAL, E.COMM,
        D.DEPTNO, D.DNAME, D.LOC
FROM EMP E JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
ORDER BY E.DEPTNO, EMPNO;

# 8-14 LEFT OUTER JOIN
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 
     ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;

# 8-15 RIGHT OUTER JOIN 으로 위 QUERY를 작성
SELECT E1.EMPNO, E1.ENAME, E1.MGR,
       E2.EMPNO AS MGR_EMPNO,
       E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 
     ON (E1.MGR = E2.EMPNO)
ORDER BY E1.EMPNO;
