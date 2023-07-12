# 부서 번호가 30번인 부서원의 모든 정보
SELECT * FROM EMP
WHERE DEPTNO = 30;

# 사원 번호가 7782인 사원의 정보를 출력해 주세요.
SELECT * FROM EMP
WHERE EMPNO = 7782;

# 부서 번호가 30번 이면서 직업이 'SALESMAN' 인 직원들은?
SELECT * FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN'; # 대소문자의 구분이 있음 <주의!!>

# 사원 번호가 7499, 부서번호 30 번인 사원 정보는?
SELECT * FROM EMP
WHERE EMPNO = 7499 AND DEPTNO = 30;

# 부서 번호 30 또는 직원이 'CLERK'인 사원 정보는?
SELECT * FROM EMP
WHERE JOB = 'CLERK' OR DEPTNO = 30;

# 급여가 2000$ 이상인 사원 정보는?
SELECT * FROM EMP
WHERE SAL >= 2000;

# 급여가 2500 이상이고 직업이 'ANALYST' 인 사원 정보는?
SELECT * FROM EMP
WHERE SAL >= 2500 AND JOB = 'ANALYST';

# 문자 대소 비교
SELECT * FROM EMP
WHERE ENAME >= 'F';

# 급여가 3000이 아닌 > 표현 방법
SELECT * FROM EMP WHERE SAL != 3000;
SELECT * FROM EMP WHERE SAL <> 3000;
SELECT * FROM EMP WHERE SAL ^= 3000;
SELECT * FROM EMP WHERE NOT SAL = 3000;
