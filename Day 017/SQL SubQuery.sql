# SUB CUERY
# 사원 이름이 'JONES'인 사원 급여 출력
SELECT SAL FROM EMP
WHERE ENAME = 'JONES';



# 급여가 2975보다 높은 사원 정보 출력
SELECT * FROM EMP
WHERE SAL > 2975;

# 급여가 'JOENS' 보다 높은 사원의 정보 출력
# SUB CUERY 로 작성
SELECT ENAME, SAL FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'JONES');


# 'KING' 보다 급여가 많은 사람
SELECT ENAME, SAL FROM EMP
WHERE SAL > (SELECT SAL FROM EMP WHERE ENAME = 'KING');


# EMP TABLE의 사원 정보 중에서 사원 이름이 ALLEN인 사원의 추가 수당(COMM)보다
# 많이 받는 사원 정보를 출력
SELECT * FROM EMP
WHERE COMM > (SELECT COMM FROM EMP WHERE ENAME = 'ALLEN');


# SUBQUERY 의 결과값이 날짜형의 경우 'ALLEN' 보다 입사일이 빠른 직원?
SELECT * FROM EMP
WHERE HIREDATE <(SELECT HIREDATE 
                        FROM EMP 
                        WHERE ENAME = 'TURNER');
                        
                        
# JOIN 구문에서도 SUBQUERY 가 동작?
SELECT E.EMPNO, E.ENAME, E.JOB, E.SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE D.DEPTNO = E.DEPTNO AND D.DEPTNO = 20 AND E.SAL > (SELECT AVG(SAL) FROM EMP);


# 평균 급여보다 많이 받는 직원들의 정보
SELECT * FROM EMP
WHERE SAL > (SELECT AVG(SAL) 
                        FROM EMP );
                        
                    
                    
