#DATABASE 연습문제

# Q1. EMP TABLE에서 사원이름이 S로 끝나는 사원 데이터 출력
SELECT * FROM EMP
WHERE ENAME LIKE '%S';

# Q2. EMP TABLE에서 30번 부서에서 근무하고 있는 사원 중에
# 직책이 SALESMAN인 사원의 번호, 이름, 직책, 급여, 부서 번호를 출력
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO = 30;

# Q3. EMP TABLE 에서 20번 30번 부서에 근무하고 있는 사원 중
# 급여가 2000 초과인 사원

# 집합 연산자를 사용하지 않은 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO BETWEEN 20 AND 30 AND SAL >= 2000;
# 집합 연산자를 사용한 방식
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE DEPTNO BETWEEN 20 AND 30
INTERSECT
SELECT EMPNO, ENAME, JOB, SAL, DEPTNO FROM EMP
WHERE SAL >= 2000;

# Q4. NOT BETWEEN A AND B 연산자를 사용하지 않고 급여 값이 2000이상 3000이하 범위 이외의 값을 가진 데이터만 출력
SELECT * FROM EMP
WHERE SAL <= 2000 OR SAL >= 3000;

# Q5. 사원이름에 E가 포함되어 있는 30 번 부서의 사운 중
# 급여가 1000 ~ 2000 사이가 아닌 사원 이름, 사원 번호, 급여, 부서번호 출력
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP
WHERE ENAME LIKE '%E%' AND DEPTNO = 30
INTERSECT
SELECT ENAME, EMPNO, SAL, DEPTNO FROM EMP
WHERE SAL <= 1000 OR SAL >= 2000;

# Q6. 추가 수당이 존재하지 않고 상급자가 있고 직책이 MANAGER, CLERK 인 사원 중에서
# 사원 이름의 두 번째 글자가 L이 아닌 사원의 정보를 출력
SELECT * FROM EMP
WHERE COMM IS NULL AND MGR IS NOT NULL AND JOB IN ('MANAGER', 'CLERK') AND ENAME NOT LIKE '_L%';
