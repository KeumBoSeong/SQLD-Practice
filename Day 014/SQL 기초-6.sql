# 자신의 주민등록번호를 넣고 년도, 생일을 뽑아냅니다.
SELECT '991111-1234567', SUBSTR('991111-1234567', 1, 2) AS 년도,
SUBSTR('991111-1234567',3,4) AS 생일 
FROM DUAL;

# LPAD , RPAD 데이터의 빈 공간을 채워넣는 함수
SELECT 'ORACLE',
        LPAD('ORACLE', 10, '#'), 
        RPAD('ORACLE', 10, '*'), 
        LPAD('ORACLE', 10),
        RPAD('ORACLE', 10)
FROM DUAL;


# LPAD, RPAD 응용
# RPAD를 이용하여 주민번호 뒷자리를 *로 표시하기
SELECT RPAD('991111-', 14, '*'),
       RPAD('010-1234-', 13, '#')
FROM DUAL;

# 문자열 두개를 붙여주세요. '7788' 'SCOTT'
SELECT CONCAT('7788', 'SCOTT') FROM DUAL;

SELECT CONCAT(EMPNO, ENAME) FROM EMP;

# 문자열 붙이기 (가장 많이 사용하는 표현)
SELECT '7788' || ':' || 'SCOTT' FROM DUAL;

# TRIM 공백제거
SELECT TRIM ('     HELLO       ') FROM DUAL;


# P.146 ROUND 반올림 해주는 함수
SELECT ROUND (3.141592),
       ROUND (3.141592, 2),
       ROUND (3.141592, 3)
FROM DUAL;


# 버림함수 TRUNC
SELECT TRUNC (1234.5678),
       TRUNC (1234.5678, 1),
       TRUNC (1234.5678, 2),
       TRUNC (1234.5678, 3)
FROM DUAL;


# 지정한 숫자와 가장 근접한 정수를 찾는 함수 CEIL, FLOOR
SELECT CEIL (3.14), FLOOR(3.14),
       CEIL (-3.14), FLOOR(-3.14)
FROM DUAL;


# 나머지 구하는 연산자 MOD 
SELECT MOD(15,6), MOD(10,2), MOD(11,2)
FROM DUAL;
