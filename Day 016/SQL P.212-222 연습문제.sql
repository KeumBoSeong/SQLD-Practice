# EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여 AVG(SAL)
# 최고급여(MAX_SAL) 최저급여 (MIN_SAL) 사원수 (CNT)를 출력합니다.
# 단 평균 급여를 출력 할 때 소수점을 제외하고 각 부서 번호 별로 출력
SELECT DEPTNO, TRUNC(AVG(SAL),0), MAX(SAL), 
MIN(SAL), COUNT(ENAME) AS CNT FROM EMP
GROUP BY DEPTNO;

# 같은 직책(JOB)에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하세요
SELECT JOB, COUNT(*) FROM EMP
GROUP BY JOB
HAVING COUNT(*) >= 3
ORDER BY COUNT(*);

# 사원들의 입사 연도를 기준으로 부서별로 몇명이 입사 했는지 출력하세요.
SELECT TO_CHAR(HIREDATE, 'YYYY') AS HIRE_YEAR, DEPTNO,COUNT(*) FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY HIRE_YEAR;

# 추가수당을 받는 사원 수와 받지 않는 사원 수를 출력하세요.
SELECT NVL2(COMM, 'O', 'X'), COUNT(*)
FROM EMP
GROUP BY NVL2(COMM, 'O', 'X');
