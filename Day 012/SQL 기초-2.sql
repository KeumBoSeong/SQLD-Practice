SELECT * FROM EMP;

# ENAME과 JOB, SAL를 출력하되 SAL 을 기준으로 오름차순 정렬
SELECT ENAME, JOB, SAL FROM EMP
ORDER BY SAL DESC;

# 부서 테이블을 조회해 주세요
SELECT * FROM DEPT;
SELECT * FROM DEPARTMENTS;


# MGR 값 중 고유한 값만 출력 하려면?
SELECT MGR FROM EMP;
SELECT DISTINCT MGR FROM EMP;

#월급(SAL) 에 12를 곱하여 '연봉' 컬럼 만들기
# TABLE = EMP # ENAME, SAL, SAL * 12 AS 연봉 AS는 생략이 가능함.
# NULL 을 제거하는 일반함수 NVL

SELECT ENAME 이름, SAL * 12 AS 연봉 FROM EMP;
