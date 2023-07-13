# 6장 일반함수 / ORCLE 함수
# UPPER -> 대문자 LOWER -> 소문자 INITCAP -> 첫 글자만 대문자
SELECT ENAME, UPPER (ENAME), LOWER (ENAME), INITCAP (ENAME) FROM EMP;

# 6-2
SELECT * FROM EMP
WHERE UPPER (ENAME) LIKE UPPER('jones');

# 6-3
SELECT * FROM EMP
WHERE UPPER (ENAME) LIKE UPPER('%fo%');

# 문자열의 길이
SELECT ENAME, LENGTH (ENAME) FROM EMP;

# 사원 이름의 길이가 6 이상인 행 출력하기
SELECT ENAME, LENGTH (ENAME) FROM EMP
WHERE LENGTH (ENAME) >= 6;

# 한글 바이트 수
#LENGTH -> 글자 길이 LENGTHB -> 바이트 수
# DUAL -> TABLE이 없을 때 사용
SELECT LENGTH ('한글'), LENGTHB ('한글') FROM DUAL;


# SUBSTR (SUBstring) SUBSTR(,,) SUBSTR(,)
# DB는 0이 아닌 1 부터 시작
# SUBSTR(가져올 데이터, 시작위치, 시작위치 부터 해당 숫자 만큼)
SELECT JOB, SUBSTR(JOB, 1,2), SUBSTR(JOB, 3, 2) FROM EMP;  

# 주민 번호 앞자리 데이터
SELECT SUBSTR('991111-1234567',1,6) FROM DUAL;

# 주민 번호 뒷자리 데이터
SELECT SUBSTR('991111-1234567',8,7) FROM DUAL;

# 태어난 연도와 날짜 데이터
SELECT SUBSTR('991111',1,2), SUBSTR('991111',3,4) FROM DUAL;

# SUBSTR -(minus)
# 끝 문자에서 부터 -1, -2 ... -N
SELECT JOB, SUBSTR(JOB, -3) FROM EMP;

SELECT SUBSTR('홍길동', -2) FROM DUAL;

# 문자열에서 특정 문자 위치를 찾는 INSTR 함수
SELECT INSTR ('안녕하세요', '안') AS 위치 FROM DUAL;
SELECT INSTR ('안녕하세요', '녕') AS 위치 FROM DUAL;
SELECT INSTR ('안녕하세요', '하') AS 위치 FROM DUAL;
SELECT INSTR ('안녕하세요', '세') AS 위치 FROM DUAL;
SELECT INSTR ('안녕하세요', '요') AS 위치 FROM DUAL;

# 검색 위치 변경
#('데이터', '검색할 데이터', ' N번째 부터')
# 두번째 글자 E 부터 시작해서 두번 째 L을 찾음
SELECT INSTR ('HELLO, ORACLE!' , 'L'), 
       INSTR ('HELLO, ORACLE!' , 'L', 5),
       INSTR ('HELLO, ORACLE!' , 'L', 2, 2)
FROM DUAL;

# REPLACE
SELECT '010-1234-5678' AS ORIGIN, 
REPLACE('010-1234-5678', '-', ' ') AS RP1,
REPLACE('010-1234-5678', '-') AS RP2
FROM DUAL;
