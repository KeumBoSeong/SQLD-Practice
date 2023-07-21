# 다중행 연산자
# IN 메인쿼리의 데이터가 서브쿼리의 결과 중 하나라도 일치한 데이터가 있다면 TRUE
# ANY, SOME 메인쿼리의 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 TRUE
# ALL 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 TRUE
# EXISTS 서브쿼리의 결과가 존재하면 (즉, 행이 1개 이상일 경우) TRUE
# 실행 결과가 여러개인 쿼리를 확인

# IN 연산자
SELECT * FROM EMP
WHERE DEPTNO IN (20, 30);

# 각 부서별 최고 급여와 동일한 급여를 받는 사원 정보 출력
SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO;

SELECT * FROM EMP
WHERE SAL = IN (SELECT MAX(SAL) FROM EMP 
                GROUP BY DEPTNO)
ORDER BY DEPTNO;
                
#ANY
SELECT * FROM EMP
WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP 
                GROUP BY DEPTNO)
ORDER BY DEPTNO;

# SOME
SELECT * FROM EMP
WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP 
                GROUP BY DEPTNO)
ORDER BY DEPTNO;

#ANY 30 번 부서 사원들의 최대 급여보다 적은 급여를 받는 사원정보
SELECT SAL FROM EMP WHERE DEPTNO = 30;

SELECT * FROM EMP
WHERE SAL < ANY (SELECT SAL FROM EMP WHERE DEPTNO = 30)
ORDER BY SAL, EMPNO;

# 9-14 ALL
# 30번 부서번호 인 사원들의 최소 급여 보다 더 적은 급여를 받는 사원 정보
SELECT SAL FROM EMP WHERE DEPTNO = 30;

SELECT * FROM EMP
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO = 30);

# EXISTS 연산자
# 서브쿼리에 값이 존재하는 경우
SELECT DNAME FROM DEPT WHERE DEPTNO = 10;
# EMP 테이블에 회계부서가 존재하는가?

SELECT * FROM EMP
        WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO = 10);

#비교할 열이 여러개인 다중열 서브쿼리
SELECT DEPTNO, MAX(SAL) FROM EMP
GROUP BY DEPTNO;

SELECT * FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) 
                                        FROM EMP
                                        GROUP BY DEPTNO);
                                        
                                        
# P.262 
# Q1. 전체 사원 중 ALLEN과 같은 직책인 사원들의 사원정보, 부서정보를 출력
SELECT JOB FROM EMP
    WHERE ENAME = 'ALLEN';
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');


# SQL-99
SELECT E.JOB, E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D ON(E.DEPTNO = D.DEPTNO)
AND E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');


# Q2.전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사운정보, 부서정보, 급여등급 정보를 출력

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E 
JOIN DEPT D ON (E.DEPTNO = D.DEPTNO)
JOIN SALGRADE S ON (E.SAL BETWEEN S.LOSAL AND S.HISAL)
WHERE E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO DESC;
