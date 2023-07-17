# NVL 함수 사용하기 NULL 변환
SELECT EMPNO, ENAME, SAL,
        NVL(COMM, 0), SAL+NVL(COMM, 0)
FROM EMP;

# NVL2 함수
SELECT EMPNO, ENAME, COMM, 
        NVL2 (COMM, 'O', 'X'),
        NVL2(COMM, SAL*12+COMM, SAL*12) AS 연봉
FROM EMP;

# DECODE 상황에 따라 다른 데이터를 반환하는 함수.
# P.170 6-47
SELECT EMPNO, ENAME, JOB, SAL,
        DECODE(JOB, 'MANAGER', SAL*1.1,
                    'SALESMAN', SAL*1.05, SAL*1) AS UPSAL
FROM EMP;

# JOB이 'PRESIDENT' 일 때 MGR 8000
SELECT EMPNO, JOB,
        DECODE(JOB, 'PRESIDENT', 8000, 0)
FROM EMP;

# CASE문
SELECT EMPNO, ENAME, JOB, SAL,
        CASE JOB
            WHEN 'MANAGE' THEN SAL*1.1
            WHEN 'SALESMAN' THEN SAL *1.05
            ELSE SAL *1.03
        END AS UPSAL
FROM EMP;

# 기준 데이터 없이 조건식만으로 CASE 문 사용하기
# 열 값에 따라서 출력이 달라지는 CASE
SELECT EMPNO, ENAME, COMM,
    CASE
        WHEN COMM IS NULL THEN '해당사항 없음'
        WHEN COMM = 0 THEN '수당없음'
        WHEN COMM > 0 THEN '수당 : ' || COMM
    END AS COMM_TEXT
FROM EMP;
