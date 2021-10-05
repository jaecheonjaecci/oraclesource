--scott 계정에 존재하는 모든 테이블 조회
-- 대소문자 구별을 하지 않음
SELECT
    *
FROM
    tab;

--조회(select) : 행 단위로 조회, 열 단위로 조회
--emp 테이블의 내용 전체조회
SELECT
    *
FROM
    emp;

--emp 테이블의 empno,ename,job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

--emp 테이블의 empno,deptno만 조회
SELECT
    empno,
    deptno
FROM
    emp;

--중복 제거 후 조회 : distinct
SELECT DISTINCT
    deptno
FROM
    emp;

--별칭을 붙여서 조회 : AS(alais)
--보여줄 때만 바꿔서 보여주고 원본은 변하지 않음
SELECT
    empno AS 사원번호
FROM
    emp;

-- 계산식이 바로 필드명이 되서 출력됨 
SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm 연봉
FROM
    emp;

--정렬 : order by 컬럼명 기준(오름차순 asc, 내림차순 desc) 
--ename,sal 조회할 때, sal에 내림차순으로 정렬
--오름차순은 생략가능함, 기본값이기 때문
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;

--emp 테이블의 전체내용조회, 사원번호 내림차순
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

--전체 내용 조회(부서 번호의 오름차순, 부서 번호가 같은 경우 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp
ORDER BY
    deptno DESC,
    ename ASC;

--where : 특정 조건을 기준으로 원하는 데이터 조회
--전체 데이터 조회, 단 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

--사원번호가 7782 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

--부서번호가 30번이고, 사원직책이 salesman인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

--대소문자 구별은 없고, 대소문자 구별하는 경우는 비밀번호
--문자열 표현 시 홑따옴표 사용하여 표현
--커리문에 대한 대소문자 구별은 없으나, 검색시에는 대소문자 구별 필요
--사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

--부서번호가 30이거나 사원직책이 clerk인 사원조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

--연산자를 사용한 where
--연봉이 36000인 사원을 조회
SELECT
    *
FROM
    emp
WHERE
    sal * 12 = 36000;

--월급이 3000보다 큰 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal > 3000;

--월급이 3000이상인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal >= 3000;

--이름의 첫글자가  f 이후인 사람
SELECT
    *
FROM
    emp
WHERE
    ename >= 'F';

--급여가 2500이상이고, 직업이 ANALYST인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2500
    AND job = 'ANALYST';

--직무가 SALESMAN이거나, CLERK 이거나, MANAGER인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    job = 'SALESMAN'
    OR job = 'CLERK'
    OR job = 'MANAGER';

--급여가 3000이 아닌 사원 조회
--등가비교연산자(=,!=,<>,^=(세 개다 같지 않음을 의미))
SELECT
    *
FROM
    emp
WHERE
    sal != 3000;

SELECT
    *
FROM
    emp
WHERE
    sal <> 3000;

SELECT
    *
FROM
    emp
WHERE
    sal^= 3000;

SELECT
    *
FROM
    emp
WHERE
    NOT sal = 3000;

--in (가로안에 들어간 것은 조건)
SELECT
    *
FROM
    emp
WHERE
    job IN ( 'MANAGER', 'SALESMAN''CLERK' );

SELECT
    *
FROM
    emp
WHERE
    job NOT IN ( 'MANAGER', 'SALESMAN''CLERK' );

--부서번호가 10,20번 사원 조회
SELECT
    *
FROM
    emp
WHERE
    deptno IN ( 10, 20 );

-- between a and b
--급여가 2000-3000사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

--급여가 2000-3000사이가 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;

--like연산자, 와일드 카드
--일부 문자열이 포함된 데이터 조회 시 사용
--와일드카드 : (%)길이와 상관없이 모든 문자 데이터를 의미
    --       (_)어떤 값이던 상관없이 한 개의 문자 데이터를 의미
--사원명이 s로 시작하는 사원들을 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

--사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

--사원명의 AM 문자가 포함되어 있는 사원 조회
--어디들어와도 상관없는 경우 양쪽을 %로 감쌈
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

--사원명에 am이 포함되어 있지 않은 사람
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

--is null
--null은 0이 아니고 완전히 비어있는 상태를 의미
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

--mgr이 null이거나 아닌 사원을 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

--집합 연산자 : 합집합 - union(중복값은 제거함)
--                    union all(중복값을 제거하지 않음)
-- 필드 개수가 맞고, 자료형이 맞다면 합집합이 가능함
--            교집합 - intersect
--            차집합 - minus
--empno,ename,sal,depno 조회(부서번호가 10이거나 20번)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

--차집합
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--교집합
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

--oracle 함수(메소드랑 같은 개념)
SELECT
    ename,
    upper(ename),
    lower(ename),
    initcap(ename)
FROM
    emp;

--ename이 scott인것 찾기
SELECT
    *
FROM
    emp
WHERE
    lower(ename) = lower('scott');

SELECT
    *
FROM
    emp
WHERE
    lower(ename) LIKE lower('%scott%');
--사용자에게 입력을 받을 경우 소문자 혹은 대문자로 입력할 수 있기 때문에
--일괄적으로 소/대문자로 바꿔서 테이블 중에 자료를 찾을 수 있도록 할 수 있음

--문자길이 구하기
SELECT
    ename,
    length(ename)
FROM
    emp;
--dual : DB 관리자가 소유한 테이블
--     : 임시 연산이나 함수의 결과값을 확인하는 용도로 사용
SELECT
    length('한글'),
    lengthb('한글')
FROM
    dual;

--job이 여섯글자이상인 사원들을 조회
SELECT
    *
FROM
    emp
WHERE
    length(job) >= 6;

SELECT
    job,
    substr(job, 1, 2),
    substr(job, 3, 2),
    substr(job, 5)
FROM
    emp;

--emp테이블의 모든 사원이름을 세번째 글자부터 끝까지 출력하기
SELECT
    ename,
    substr(ename, 3)
FROM
    emp;

SELECT
    instr('HELLO, ORACLE!', 'L'),
    instr('HELLO, ORACLE!', 'L', 5),
    instr('HELLO, ORACLE!', 'L', 2, 2)
FROM
    dual;

--원본 문자열 : 이것이 Oracle이다. 이것도 오라클이다.
--찾을 문자열 : 이것

--제일 처음에 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것')
FROM
    dual;

-- 시작 위치를 3으로 지정한 후 나오는 이것의 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 3)
FROM
    dual;

--이것이 두번째로 나오는 위치 찾기
SELECT
    instr('이것이 Oracle이다. 이것도 오라클이다.', '이것', 1, 2)
FROM
    dual;

--사원이름에 문자 S가 있는 사원 구하기
SELECT
    *
FROM
    emp
WHERE
    instr(ename, 'S') > 0;

SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%S%';

--010-1234-5678 => 010 1234 5678, 01012345678
SELECT
    '010-1234-5678'                    AS 원본,
    replace('010-1234-5678', '-', ' ') AS replace1,
    replace('010-1234-5678', '-')      AS replace2
FROM
    dual;

--empno,ename 합쳐서 조회
SELECT
    empno,
    ename,
    concat(empno, ename)
FROM
    emp
WHERE
    ename = 'SCOTT';

SELECT
    empno,
    ename,
    concat(empno, concat(':', ename))
FROM
    emp
WHERE
    ename = 'SCOTT';

SELECT
    empno || ename,
    empno
    || ':'
    || ename
FROM
    emp
WHERE
    ename = 'SCOTT';

SELECT
    '   이것이   ',
    TRIM('   이것이   ')
FROM
    dual;
--공백제거함수
SELECT
    '['
    || TRIM('_' FROM '__oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__oracle__')
    || ']' AS trim_both
FROM
    dual;
    
  --숫자함수  

SELECT
    round(1234.5678)      AS round,
    round(1234.5678, 0)   AS round0,
    --소수점 0번째 자리에 해달라는 뜻이기 때문에 .5를 올림해줌
    round(1234.5678, 1)   AS round1,
    round(1234.5678, 2)   AS round2,
    round(1277.5678, - 1) AS round_minus1,
    round(1277.5678, - 2) AS round_minus2
FROM
    dual;

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    --소수점 0번째 자리에 해달라는 뜻이기 때문에 .5를 올림해줌
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;

--날짜함수
SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;
    
    
--입사 20주년 되는 날짜 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;
    
--현재 날짜를 기준으로 입사 38년 미만인 사원 조회
SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate;

SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(sysdate, hiredate)        AS month1,
    months_between(hiredate, sysdate)        AS montn2,
    trunc(months_between(sysdate, hiredate)) AS montn2
FROM
    emp;

SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
--돌아오는 월요일과, 이번달에 마지막 날
FROM
    dual;

--형변환 함수
--문자데이터 형식을 지정가능함
SELECT
    sysdate,
    to_char(sysdate, 'yyyy/mm/dd') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'mm') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'mon') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'hh:mi:ss') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'hh12:mi:ss am') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'hh24:mi:ss') AS 현재시간
FROM
    dual;

SELECT
-- L : locale, 지역화폐단위를 붙여서 출력
-- 9,0은 숫자의 한자리를 의미 (9는 빈자리를 채우지 않음, 0은 빈자리를 채우는 개념)

    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, '$000,000') AS sal_$2,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;
--숫자를 줘도 문자의 개념으로 사용할 수 있음
--콤마를 사용하려면 숫자를 지정해줘야함 

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021-09-12', 'yyyy-mm-dd') AS todate1,
    TO_DATE('20210912', 'yyyy-mm-dd')   AS todate2
FROM
    dual;
      
--날짜 데이터는 연산이 가능
-- 1981/06/01 이후 입사자 조회
SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('1981/06/01', 'yyyy-mm-dd');

--널 처리함수
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm
FROM
    emp;

SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;

--nvl2(데이터, 널이 아닐 경우 반환할 값, 널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'o', 'x'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;

SELECT
    *
FROM
    emp
WHERE
    empno = 7369;

-- DECODE 함수
--      DECODE([검사 대상이 될 열 또는 데이터], 
--             [조건1], [데이터가 조건1과 일치할 때 반환할 결과],
--             [조건2], [데이터가 조건2와 일치할 때 반환할 결과],
--             ...
--             [위 조건들 중에서 일치한 경우가 없을 대 반환할 결과])

-- job_id에 따라 급여의 비율 설정
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;

-- CASE : DECODE문으로 작성할 수 있는 것들은 모두 변환 가능
--        =의 의미로 사용되지만 다른 조건도 가능하다.

SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;

-- =의 의미가 아닌 것    
-- comm이 널이면 '해당사항 없음', 0이면 '수당없음', 0보다 크면 '수당 : 2500' 출력
SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;
        
-- [실습1] emp 테이블에서 사원들의 월 평균 근무일수는 21.5일이다.
-- 하루 근무시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 시급을(PART_TIME)를 
-- 계산하여 결과를 출력한다.
-- 단, 하루 급여는 소수점 셋짜라리에서 버리고, 지금은 두번째 소수점에서 반올림 하세요.

SELECT
    empno,
    ename,
    sal,
    trunc(sal / 21.5)        AS day_pay,
    round(sal / 21.5 / 8, 1) AS time_pay
FROM
    emp;

-- [실습2] emp 테이블에서 사원들은 입사일을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다.
-- 사원들이 정직원이 되는 날짜(r_job)를 YYYY_XX-DD 형식으로 출력하시오.
-- ,단, 추가수당(comm)이 없는 인원의 추가 수당은 N/A  출력로하시오.
SELECT
    comm,
    nvl(comm, 0)
FROM
    emp;

SELECT
    comm,
    nvl(comm, '0')
FROM
    emp;

SELECT
    comm,
    nvl(comm, 'n/a')
FROM
    emp; -- 에러 발생 : 타입이 맞지 않아서 발생
SELECT
    comm,
    nvl(to_char(comm), 'n/a')
FROM
    emp; -- 데이터 타입을 맞추면 에러가 발생하지 않는다

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate, 3), '월요일') AS r_job,
    nvl(to_char(comm), 'N/A')                AS comm
FROM
    emp;

-- [실습3]emp테이블의 모든 사원을 대상으로 직송 상관의 사원번호(mgr)을
-- 다음과 같은 조건을 기준으로 변환해서 chg_mgr열에 출력
-- 직속상관의 사원번호가 존재하지 않을 경우 : 0000
-- 직속상관의 사원번호 앞 두자리가 75일 경우 : 5555
-- 직속상관의 사원번호 앞 두자리가 76일 경우 : 6666
-- 직속상관의 사원번호 앞 두자리가 77일 경우 : 7777
-- 직속상관의 사원번호 앞 두자리가 78일 경우 : 8888
-- 그 외 직송 상관 사원번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력
SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr), 1, 2), NULL, '0000', '75', '5555',
           '76', '6666', '77', '7777', '78',
           '8888', substr(to_char(mgr), 1)) AS chg_mgr
FROM
    emp;

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN mgr IS NULL THEN
            '0000'
        WHEN substr(to_char(mgr), 1, 2) = '75' THEN
            '5555' -- WHEN MGR LIKE '75%' THEN '5555'
        WHEN substr(to_char(mgr), 1, 2) = '76' THEN
            '6666'
        WHEN substr(to_char(mgr), 1, 2) = '77' THEN
            '7777'
        WHEN substr(to_char(mgr), 1, 2) = '78' THEN
            '8888'
        ELSE
            to_char(mgr)
    END AS chg_mgr
FROM
    emp;

--다중행 함수 : sum(), count(), max(), min(), avg()
SELECT
    SUM(sal)
FROM
    emp;
-- select sum(sal),ename from emp; 단일 그룹 함수가 아닙니다.

--emp 테이블의 데이터 개수 조회
SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(empno)
FROM
    emp;

SELECT
    COUNT(DISTINCT sal)
FROM
    emp;

--부서번호가 10번인 사원의 최대 급여
SELECT
    MAX(sal)
FROM
    emp
WHERE
    deptno = 10;
--부서번호 10번인 사원의 최소 급여
SELECT
    MIN(sal)
FROM
    emp
WHERE
    deptno = 10;

--부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT
    MIN(hiredate)
FROM
    emp
WHERE
    deptno = 20;

--부서번호가 30번인 사원들의 평균 급여 조회
SELECT
    AVG(sal)
FROM
    emp
WHERE
    deptno = 30;

SELECT
    avg(DISTINCT sal)
FROM
    emp
WHERE
    deptno = 30;

--group by 그룹화 할 열 지정(여러개 지정 가능)
--부서별 급여의 합 조회
SELECT
    SUM(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

--부서벌 급여 평균 조회
SELECT
    AVG(sal),
    deptno
FROM
    emp
GROUP BY
    deptno
ORDER BY
    deptno;

--부서별, 직무별 급여 평균 조회
SELECT
    AVG(sal),
    deptno,
    job
FROM
    emp
GROUP BY
    deptno,
    job
ORDER BY
    deptno,
    job;

--group by ~ having 조건식
--부서별, 직무별 급여 평균 조회(단, 급여의 평균이 2000이상)
SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
WHERE
    sal <= 3000 -- 1. 출력 대상이 되는 행 제한
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000 -- 2. 그룹화한 행 제한
ORDER BY
    deptno,
    job;

SELECT
    deptno,
    job,
    AVG(sal)
FROM
    emp
GROUP BY
    deptno,
    job
HAVING
    AVG(sal) >= 2000
ORDER BY
    deptno,
    job;

--as는 생략이 가능함
SELECT
    deptno,
    floor(AVG(sal)) AS avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)
FROM
    emp
GROUP BY
    deptno;


--같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는
--SQL문을 작성
SELECT
    job,
    COUNT(*)
FROM
    emp
GROUP BY
    job
HAVING
    COUNT(job) >= 3;

--사원들의 입사년도(hire_year)를 기준으로 부서별로 몇 명이 입사했는지
-- 출력하는 SQL문을 작성
SELECT
    to_char(hiredate, 'yyyy') AS hire_year,
    deptno,
    COUNT(*)                  AS cnt
FROM
    emp
GROUP BY
    to_char(hiredate, 'yyyy'),
    deptno
ORDER BY
    hire_year DESC,
    deptno ASC;

--데이터 삽입,  삭제, 수정 : 결과는 실행된 행의 개수로 넘어옴
-- 실습용 테이블 생성
CREATE TABLE dept_temp
    AS
        SELECT
            *
        FROM
            dept;

SELECT
    *
FROM
    dept_temp;

--insert : 데이터삽입
--insert into 테이블명(필드명....) values(값1,값2...)
--insert into 테이블명 values(값1,값2...)

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    50,
    'DATABASE',
    'SEOUL'
);

INSERT INTO dept_temp VALUES (
    60,
    'NETWORK',
    'BUSAN'
);

--필드명을 안써도 삽입은 가능함, 안쓰는 경우 원래의 테이블의 순서를 지켜서 넣어야 함
INSERT INTO dept_temp (
    dname,
    loc,
    deptno
) VALUES (
    'NETWORK',
    'BUSAN',
    70
);

--현재 deptno에 두자리만 들어갈 수 있도록 설정해놨기 때문에 오류 발생
INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    500,
    'DATABASE',
    'SEOUL'
);

--부분삽입이 가능함, 비어있는 경우 null값으로 기본 설정됨
--null값을 지정해서 넣을 수도 있고, 공백을 넣을 수도 있음 (null값으로 표시됨)
--테이블 생성시 널이 가능하도록 열이 설정되어 있는 경우만 사용가능
INSERT INTO dept_temp (
    deptno,
    dname
) VALUES (
    90,
    'DATABASE'
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    91,
    'WEB',
    NULL
);

INSERT INTO dept_temp (
    deptno,
    dname,
    loc
) VALUES (
    92,
    'MOBILE',
    ''
);

COMMIT;

-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때 사용
CREATE TABLE emp_temp
    AS
        SELECT
            *
        FROM
            emp
        WHERE
            1 <> 1;

SELECT
    *
FROM
    emp_temp;

DESC emp_temp;

INSERT INTO emp_temp (
    empno,
    ename,
    job,
    mgr,
    hiredate,
    sal,
    comm,
    deptno
) VALUES (
    1111,
    '홍길동',
    'MANAGER',
    NULL,
    '2021-09-27',
    4000,
    NULL,
    10
);

INSERT INTO emp_temp VALUES (
    2222,
    '성춘향',
    'ANALYST',
    NULL,
    '2021-09-27',
    5000,
    NULL,
    10
);

INSERT INTO emp_temp VALUES (
    3333,
    '박보검',
    'ANALYST',
    NULL,
    sysdate,
    5000,
    NULL,
    10
);

COMMIT;

--update : 수정, 변경
--조건을 잘 못 설정하거나 설정하지 않을 경우 모든 데이터의 변화가 일어나기 때문에
--where절에 조건을 잘 설정해야 함

--update 테이블명 set 변경할 열 = 변경할 값,변경할 값,변경할 열 = 변경할 값...
--update 테이블명 set 변경할 열 = 변경할 값,변경할 값,변경할 열 = 변경할 값...where 수정할 조건

SELECT
    *
FROM
    dept_temp;

--90번 deptno에 loc를 서울로 변경
UPDATE dept_temp
SET
    loc = 'SEOUL'
WHERE
    deptno = 90;

UPDATE dept_temp
SET
    loc = 'BUSAN'
WHERE
    deptno = 91;

COMMIT;

SELECT
    *
FROM
    emp_temp;

--sal이 4000이하인 사원만 추가 수당을 50으로 변경
UPDATE emp_temp
SET
    comm = 50
WHERE
    sal <= 4000;

COMMIT;

UPDATE emp_temp
SET
    sal = 1500
WHERE
    empno = 입력값;

UPDATE emp_temp
SET
    comm = 100;

ROLLBACK;
--되돌리는 개념

--delete : 삭제
--delete 테이블이름 where 삭제할 데이터 조건
--delete from 테이블이름 where 삭제할 데이터 조건 (from은 옵션)

CREATE TABLE emp_temp2
    AS
        SELECT
            *
        FROM
            emp;

SELECT
    *
FROM
    emp_temp2;

--job이 manager인 사원 삭제
DELETE emp_temp2
WHERE
    job = 'MANAGER';

--전체 사원 삭제
DELETE emp_temp2;

ROLLBACK;

--조인 
SELECT
    COUNT(*)
FROM
    emp;

SELECT
    COUNT(*)
FROM
    dept;

--카테시안 조인 : 나올 수 있는 모든 조합(14행 *4행 = 56행)
SELECT
    *
FROM
    emp,
    dept;

--내부조인(inner join)
--등가조인 : 일치하는 데이터를 추출
--비등가조인 : 특정 범위에 있는 데이터 추출

SELECT
    *
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
--두 테이블의 deptno가 일치하는 결과만 추출, 연결해서 한꺼번에 출력하는 개념

SELECT
    empno,
    ename,
    dept.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
--오류 발생 : 두 테이블에 모두 deptno가 있기 때문의 열의 정의가 애매하다고 뜸

--order by 사용가능
SELECT
    empno,
    ename,
    dept.deptno,
    dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno
ORDER BY
    dname;

--테이블 별칭 설정
SELECT
    empno,
    ename,
    e.deptno,
    dname
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
ORDER BY
    dname;

--sal 3000이상인 사원들의 사번, 이름, 부서번호, 부서명, 급여
SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal >= 3000;

--급여가 2500이하이고, 사원번호가 9999이하인 사원의 
--사번, 이름, 급여, 부서명,부서 위치 조회
SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal <= 2500
    AND empno <= 9999;

--emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
SELECT
    *
FROM
    salgrade;

SELECT
    *
FROM
    emp;

SELECT
    *
FROM
    emp      e,
    salgrade s
WHERE
    e.sal BETWEEN s.losal AND s.hisal;

--자체 조인(셀프 조인) : 본인 테이블과 조인
SELECT
    e1.empno,
    e1.hiredate,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno;

--외부조인(outer join)
--왼쪽 외부 조인(left outer join)
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr = e2.empno (+);

--오른쪽 외부 조인(right outer join)
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1,
    emp e2
WHERE
    e1.mgr (+) = e2.empno;

--양쪽 외부조인(+기호는 제공 안함)
--outer join된 테이블은 1개만 지정할 수 있음
--모든 데이터 베이스에서 사용가능한 표준 조인 구문 
--join_on
-- on에는 조건을 설정
SELECT
    empno,
    ename,
    emp.deptno,
    dname
FROM
         emp
    JOIN dept ON emp.deptno = dept.deptno
ORDER BY
    dname;

SELECT
    empno,
    ename,
    d.deptno,
    dname,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal >= 3000;

SELECT
    empno,
    ename,
    sal,
    dname,
    loc
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
        sal <= 2500
    AND empno <= 9999;

SELECT
    *
FROM
         emp e
    JOIN salgrade s ON e.sal BETWEEN s.losal AND s.hisal;

--outer 표준 구문
SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    LEFT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    RIGHT OUTER JOIN emp e2 ON e1.mgr = e2.empno;

SELECT
    e1.empno,
    e1.ename,
    e1.mgr,
    e2.empno,
    e2.ename
FROM
    emp e1
    FULL OUTER JOIN emp e2 ON e1.mgr = e2.empno;

--실습 1
--급여가 2000초과인사원들의 부서 정보, 사원 정보를 아래와 같이 출력
SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
    emp  e,
    dept d
WHERE
        e.deptno = d.deptno
    AND sal > 2000
ORDER BY
    d.deptno;

SELECT
    d.deptno,
    dname,
    empno,
    ename,
    sal
FROM
         emp e
    JOIN dept d ON e.deptno = d.deptno
WHERE
    sal > 2000
ORDER BY
    d.deptno;

-- 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력
SELECT
    d.deptno,
    dname,
    floor(AVG(sal)) avg_sal,
    MAX(sal)        max_sal,
    MIN(sal)        min_sal,
    COUNT(*)        cnt
FROM
    emp  e,
    dept d
WHERE
    e.deptno = d.deptno
GROUP BY
    d.deptno,
    dname;

--모든 부서정보와 사원정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력
SELECT
    d.deptno,
    dname,
    empno,
    ename,
    job,
    sal
FROM
    dept d
    LEFT OUTER JOIN emp  e ON e.deptno = d.deptno
ORDER BY
    d.deptno,
    e.empno;

--테이블 세 개 조인
SELECT
    *
FROM
         emp e1
    JOIN emp e2 ON e1.empno = e2.empno
    JOIN emp e3 ON e1.empno = e3.empno;


--emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept 내용 전부 나와야 함)
select * from emp e1, dept d1
where e1.deptno(+) = d1.deptno;
--첫번째 연결 결과랑 salgrade 조인
select * from emp e1, dept d1, salgrade s1
where e1.deptno(+) = d1.deptno and e1.sal between s1.losal(+) and s1.hisal(+);
--두번째 결과의 mgr과 emp e2 테이블의 empno랑 조인


SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e1.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp      e1,
    dept d,
    salgrade s,
    emp      e2
WHERE
        e1.deptno (+) = d.deptno
    AND e1.sal BETWEEN s.losal(+) AND s.hisal(+)
    and e1.mgr = e2.empno(+)
    order by d.deptno,e1.ename;
    
 --표준 구문으로 변경   
    SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e1.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1 right outer join dept d on e1.deptno = d.deptno
    left outer join salgrade s on e1.sal BETWEEN s.losal AND s.hisal
    left outer join emp e2 on e1.mgr = e2.empno
    order by d.deptno,e1.ename;
    
    
--서브 쿼리 : sql문을 실행하는데 필요한 데이터를 추가로 조회하기 위해 
--          sql문 내부에서 사용하는 select 문을 말함
--          연산자와 같은 비교 또는 조회 대상으로 오른쪽에 놓여서 괄호로 묶어서 사용
--          서브쿼리의 셀렉트절에 명시한 열은 메인 쿼리에 비교 대상과 같은 자료형과
--          같은 개수로 지정
--단일행 서브 쿼리 : 서브쿼리에 결과가 단 하나만의 행으로 나오는 경우
--                >,>=,=,<=,<>,^=,!= 사용가능

--2975보다 큰 사원 조회
select * from emp where sal >(select sal from emp where ename = 'JONES');
-- ALLEN 사원의 추가 수당보다 많은 추가수당을 받는 사원 조회
select * from emp where comm>(select comm from emp where ename = 'ALLEN');
--WARD 사원의 입사일보다 빨리 입사한 사원 목록
select * from emp where hiredate <(select hiredate from emp where ename='WARD'); 

--20번부서에 속한 사원 중 전체 사원의 평균 급여보다 높은 급여를 받는 사원정보
--(사원번호,사원명,직업,급여)와 소속부서정보(부서번호,부서명,부서위치)를 조회
select empno,ename,job,sal,d.deptno,dname,loc
from emp e,dept d
where e.deptno = d.deptno and d.deptno=20 and e.sal 
> (select avg(sal) from emp);

--다중행 서브쿼리
--서브쿼리 실행결과가 여러개로 나오는 걸 의미
--in: 메인쿼리에 데이터가 서브쿼리의 결과 중 하나라도 일치하면 true
--any(some): 메인쿼리에 조건식을 만족하는 서브쿼리의 결과가 하나 이상이면 true
--all : 메인쿼리의 조건식을 서브쿼리의 결과 모두가 만족하면 true
--exists: 서브 쿼리의 결과가 존재하면(행 1개 이상 존재) true

--단일 행 하위 질의에 2개 이상의 행이 리턴되었습니다.
--부서별 최고 급여와 같은 사원 조회
--select * from emp where sal >
--(select max(sal) from emp group by deptno);    
select * from emp where sal 
in (select max(sal) from emp group by deptno);

--any(some)
select * from emp where sal = 
any (select max(sal) from emp group by deptno);

--30번 부서 사원들의 최고 급여보다 적은 사원 조회
select * from emp where sal < 
any(select sal from emp where deptno=30);

--30번 부서 사원들의 최저 급여보다 많은 사원 조회
select * from emp where sal >
any(select sal from emp where deptno=30);

--all
--30번 부서 사원들의 급여보다 적은 사원 조회
select * from emp where sal <
all (select sal from emp where deptno=30);

select * from emp where sal >
all (select sal from emp where deptno=30);

--exists
-- 서브 커리문이 true여부에 따라 메인 쿼리를 출력할지 결정됨
select * from emp where exists
(select dname from dept where deptno = 10);

--문제] 전체 사원 중 allen과 같은 직책인 사원들의 사원정보, 부서정보 출력하기
--ename, empno,job,sal,deptno,dname 출력
select ename, empno,job,sal,d.deptno,dname 
from emp e, dept d
where e.deptno=d.deptno and e.job 
in (select job from emp where ename = 'ALLEN');

--문제] 전체 사원의 평균 급여보다 높은 급여를 받는 사원들의 사원정보,부서정보,
--급여등급 출력(급여가 많은 순으로 정렬하되 급여가 같은 경우에는 사원번호를 오름차순으로 정렬)

select ename, empno,job,sal,d.deptno,dname, grade
from emp e, dept d, salgrade s
where e.deptno=d.deptno and sal between losal and hisal and sal 
> (select avg(sal) from emp)
order by sal desc, empno asc;

--비교할 열이 여러개인 다중형 서브쿼리
select * from emp where (deptno,sal) 
in (select deptno,max(sal) from emp group by deptno);

--from 서브쿼리(인라인 뷰)
select empno,ename,d.deptno,dname,loc
from (select * from emp where deptno=10) e10,(select * from dept) d
where e10.deptno = d.deptno;

--insert 사용하는 서브쿼리
--values 절은 사용하지 않음
--데이터가 추가되는 테이블의 열 개수와 서브쿼리의 열 개수가 일치해야함
--데이터가 추가되는 테이블의 자료형과 서브쿼리의 자료형이 일치해야함
--emp 테이블에서 salgrade를 참조해서 급여 등급이 1인 사원만을 emp_temp에 추가

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
select e.empno,e.ename,e.job,e.mgr,e.hiredate,e.sal,e.comm,e.deptno
from emp e, salgrade s
where e.sal between s.losal and s.hisal and s.grade =1;

--update 서브 쿼리
select * from dept_temp;
--40번 부서의 부서이름과 지역 수정(dept 테이블의 deptno = 30인 지역명, 부서명 추출
update dept_temp
set (dname,loc) = (select dname,loc from dept where deptno = 30)
where deptno = 40; 

update dept_temp
set loc = 'SEOUL'
where deptno = 
(select deptno from dept_temp where dname='ACCOUNTING');

--delete 서브 쿼리
select * from emp_temp;

--급여 등급이 3등급이고 부서가 30번 부서인 사원들만 삭제
delete emp_temp
where empno in (select empno from emp_temp e, salgrade s
where e.sal between s.losal and s.hisal 
and s.grade=3 and deptno = 30);

--실습1
CREATE TABLE exam_emp AS SELECT * FROM emp;
CREATE TABLE exam_dept AS SELECT * FROM dept;
CREATE TABLE exam_salgrade AS SELECT * FROM salgrade;

select * from exam_emp;

INSERT INTO exam_emp VALUES (7201,'TEST_USER1','MANAGER','7788','2016-01-02','4500','','50');
INSERT INTO exam_emp VALUES (7202,'TEST_USER2','CLERK','7201','2016-02-21','1800','','50');
INSERT INTO exam_emp VALUES (7203,'TEST_USER3','ANALST','7201','2016-04-11','3400','','60');
INSERT INTO exam_emp VALUES (7204,'TEST_USER4','SALESMAN','7201','2016-05-31','2700','300','60');
INSERT INTO exam_emp VALUES (7205,'TEST_USER5','CLERK','7201','2016-07-20','2600','','70');
INSERT INTO exam_emp VALUES (7206,'TEST_USER6','CLERK','7201','2016-09-08','2600','','70');
INSERT INTO exam_emp VALUES (7207,'TEST_USER7','LECTURER','7201','2016-10-28','2300','','80');
INSERT INTO exam_emp VALUES (7208,'TEST_USER8','STUDENT','7201','2018-03-09','1200','','80');
commit;

--exam_emp에 속한 사원 중 50번 부서에 근무하는 사원들의 평균 급여보다 많은 급여를 
-- 받고 있는 사원들을 70번 부서로 옮기는 sql 문
update exam_emp 
set deptno = 70
where sal > (select avg(sal) from exam_emp where deptno=50);

--exam_emp에 속한 사원 중 60번 부서의 사원 중에서 입사일이 가장 빠른 사원보다
--늦게 입사한 사원의 급여를 10% 인상하고 80번 부서로 옮기기
update exam_emp 
set sal = sal *1.1, deptno = 80
where hiredate > (select min(hiredate) from exam_emp where deptno=60);

--exam_emp에 속한 사원 중, 급여 등급이 5인 사원을 삭제
delete exam_emp
where empno in 
(select empno from exam_emp e, salgrade 
where sal between losal and hisal and grade = 5);

--트랜젝션
--하나의 단위로 데이터를 처리
create table dept_tcl as select * from dept;
select * from dept_tcl;

--트랜젝션과 관련있는 명령어 실행
insert into dept_tcl values(50,'DATABASE','SEOUL');
update dept_tcl set loc = 'BUSAN' where deptno = 40;
delete from dept_tcl where dname='RESEARCH';

--수행된 명령 취소
rollback;

--수행된 명령 최종 반영
commit;

--세션: 어떤 활동을 위한 시간이나 기간을 말함, 
--     데이터베이스 접속을 시작으로 여러 데이터베이스 관련 작업을 수행한 후,
--     접속을 종료하기까지의 전체 기간

delete from dept_tcl where deptno=50;
select * from dept_tcl; 

commit;

update dept_tcl set loc='SEOUL' where deptno = 30;

commit;

--DDL(데이터 정의어)
--객체를 생성, 변경, 삭제
--실행하면 반영됨

--create(생성), alter(변경), drop(삭제)
--create table 테이블이름(
--      필드명1 자료형, 
--      필드명2 자료형,
--)
--테이블 이름 규칙
--문자로 시작
--같은 사용자 안에서 동일한 테이블 명 사용불가
--SQL 키워드는 테이블 이름으로 사용할 수 없음

--필드명 생성 규칙
--문자로 시작
--열 이름은 중복될 수 없음
--SQL 키워드는 사용불가

--자료형 : 숫자 NUMBER, 가변문자 VARCHAR2, 날짜 DATE
--      : 고정문자 char2

create table EMP_DDL(
    empno NUMBER(4), --숫자로 4자리 허용
    ename VARCHAR2(10),
    job VARCHAR2(9),
    mgr NUMBER(4),
    hiredate date,
    sal NUMBER(7,2), --숫자로 7자리까지 허용(소수점은 2자리 허용)
    comm NUMBER(7,2),
    deptno NUMBER(2)
);

desc emp_ddl;

drop table emp_ddl;

--구조,데이터 이용하여 생성
create table dept_ddl as select * from dept;
create table dept_ddl_30 as select * from dept where deptno=30;

--다른 테이블의 구조만 복사해서 새 테이블 생성
create table dept_dd2 as select * from dept where 1<>1;
select * from dept_dd2;

--alter
--이미 생성된 객체를 변경
create table emp_alter as select * from emp;

--새로운 컬럼(열) 추가 : add
desc emp_alter;

alter table emp_alter add hp varchar2(20);
select * from emp_alter;

--rename : 열 이름을 변경
alter table emp_alter rename column hp to tel;

--modify : 열의 자료형을 변경
alter table emp_alter modify empno number(5);

--drop :열 삭제
alter table emp_alter drop column tel;

--테이블 이름 변경
rename emp_alter to emp_rename;
desc emp_rename;

--테이블 데이터를 삭제 truncate
--테이블 안에 모든 데이터를 삭제
truncate table emp_rename;

--멤버 테이블 작성
create table member (
    id CHAR(8),
    name VARCHAR2(10),
    addr VARCHAR2(50),
    nation char(4),
    email VARCHAR2(50),
    age NUMBER(7,2)
);

desc member;
alter table member add bigo VARCHAR2(20);
alter table member modify bigo varchar2(30);
alter table member rename column bigo to remark;

select * from member;

--뷰(view) : 가상테이블
--목적 : 편리함(select 문의 복잡도를 완화), 보안성(테이블의 특정 열을 노출하고 싶지 않을 경우)

--create [or replace] view 뷰이름 (열이름,열이름2...)
--as (저장할 select문)

--뷰 생성
create view vm_emp20 as (select empno,ename,job,deptno from
emp where deptno=20);

select * from vm_emp20;

--emp 테이블의 전체 내용을 이용해 view를 생성
create view vm_empall as select * from emp;

--vm_empall에 있는 특정 사원 정보를 수정(원본도 같이 수정됨)
--특정 제약조건을 부여하지 않았기 때문에 원본도 같이 수정됨
select * from vm_empall;
update vm_empall set job = 'SALESMAN' where empno = 7369;

select * from emp;
insert into vm_empall values(6666,'KIM','MANAGER',NULL,'20/10/05',2650,NULL,20);

--뷰생성 (원본 데이터 수정 불가)
create view vm_emp30read as select empno,ename,job 
from emp where empno=30 with read only;

--뷰 삭제
drop view vm_empall;

--sequence
--오라클 데이터베이스에서 특정 규칙에 맞는 연속 숫자 생성
--ex. 글번호, 상품번호 입력 시 사용
--테이블과 따로 있는 객체, 테이블과 상관이 없음
create sequence seq_dept_sequence
increment by 10 --[옵션] 10씩 증가, 기본값 1
start with 10 --[옵션] 기본값 1
maxvalue 90 --[옵션] 최대값, 기본값 10의 27승
minvalue 0 --[옵션] 최소값, 기본값 1
nocycle cache 2; --[옵션] cycle or nocycle, 값을 계속 돌리는지 아닌지, cache 미리 발급해 놓을 수

--dept 테이블에서 부서 번호를 10으로 시작해서 90까지 넣고 싶을 때
create table dept_sequence as select * from dept where 1<>1;

insert into dept_sequence(deptno,dname,loc)
values (seq_dept_sequence.nextval, 'DATABASE','SEOUL'); 
--seq_dept_sequence.nextval 호출해서 사용하면 됨
select * from dept_sequence;

--시퀀스 수정
alter sequence seq_dept_sequence
increment by 3
maxvalue 99
cycle;

--시퀀스 삭제
drop sequence seq_dept_sequence;

--index : 빠른 검색이 가능
--데이터 검색 : table full scan or index scan

create index idx_emp_sal on emp(sal);
drop index idx_emp_sal;

--제약조건을 사용한 테이블 생성
create table userTBL(
userid char(8) not null primary key,
username varchar(10) not null);

--[실습1]
--EMP테이블과 같은 구조의 데이터를 저장하는 EMPIDX 테이블을 생성하시오.
--생성한 EMPIDX 테이블의 EMPNO 열에 IDX_EMPIDX_EMPNO 인덱스를 생성하시오.
--인덱스가 잘 생성되었는지 데이터 사전 뷰를 통해 확인하시오.
create table empidx as select * from emp; 
create index idx_empidx_empno on empidx(empno);

--[실습2]
--실습1에서 생성한 EMPIDX 테이블의 데이터 중 
--급여가 1500 초과인 사원들만 출력하는 EMPIDX_OVER15K 뷰를 생성하시오. 
--(사원번호, 사원이름, 직책,부서번호,급여,추가수당 열을 가지고 있다)
create view EMPIDX_OVER15K as (select empno,ename,job,deptno,sal,comm
from empidx where sal>1500);
select * from EMPIDX_OVER15K;

--[실습3]
--DEPT 테이블과 같은 열과 행 구성을 가지는 DEPTSEQ 테이블을 작성하시오
create table DEPTSEQ as select * from dept; 
--생성한 DEPTSEQ 테이블의 DEPTNO 열에 사용할 시퀀스를 아래에 제시된 
--특성에 맞춰 생성해 보시오.
--부서 번호의 시작값 : 1
--부서 번호의 증가 : 1
--부서 번호의 최댓값 : 99
--부서 번호의 최소값 : 1
--부서 번호 최댓값에서 생성 중단
--캐시 없음
create sequence deptsql_sequence 
start with 1 
increment by 1 
maxvalue 99 
minvalue 1 
nocycle nocache;

--생성된 시퀀스를 조회해 보시오.

--마지막으로 생성한 DEPTSEQ를 사용하여 아래쪽과 같이 세 개 부서를 차례대로 추가한다.
-- 부서이름(DNAME) 부서위치(LOC) 
--  DATABASE       SEOUL
--    WEB          BUSAN
--   MOBILE        ILSAN
insert into deptseq values(deptsql_sequence.nextval,'DATABASE','SEOUL');
insert into deptseq values(deptsql_sequence.nextval,'WEB','BUSAN');
insert into deptseq values(deptsql_sequence.nextval,'MOBILE','ILSAN');

select * from deptseq;

--제약조건
--데이터 무결성을 유지하기 위함
--1) not null : null의 저장을 허용하지 않음
create table table_notnull(
login_id varchar2(20) not null,
login_pwd varchar2(20) not null,
tel varchar2(20));

insert into table_notnull values('test_01',null,'010-1234-5678');

--tel열은 null을 허용
insert into table_notnull(login_id,login_pwd) values('test_01','test_01');

update table_notnull set login_pwd = null where login_id='test_01';

create table table_notnull2(
login_id varchar2(20) constraint TBLNN2_lgnid not null,
login_pwd varchar2(20) constraint TBLNN2_lgnpwd not null,
tel varchar2(20));

--제약조건 확인
--c##scott가 가지고 있는 모든 제약조건 확인
--현재 DB에 접속한 사용자가 소유한 객체 정보 : user_로 시작

select owner,constraint_name, constraint_type, table_name
from user_constraints
where table_name='table_notnull2';

--이미 생성한 테이블의 제약 조건 지정
--table_notnull에 tel 컬럼의 not null 추가
--오류보고 : 처음부터 제약조건을 설정하지 않아도 나중에 조건을 설정할 수 있으나,
--         기존에 들어있는 데이터가 있다면 수정이 어려움
alter table table_notnull modify(tel not null);
select * from table_notnull;

--update를 통해 기존의 null 칼럼을 제거
update table_notnull set tel='010-1234-5365'
where login_id='test_01';

select * from table_notnull2;
alter table table_notnull2 modify(tel constraint tblnn_tel_nn not null);

select owner,constraint_name, constraint_type, table_name
from user_constraints
where table_name='table_notnull2';

--제약조건 이름 변경
alter table table_notnull2 rename constraint tblnn_tel_nn to tblnn2_tel_nn;

--제약조건 삭제
alter table table_notnull2 drop constraint tblnn2_tel_nn;

--2) unique : 중복되지 않는 값 
create table table_unique(
login_id varchar2(20) unique,
login_pwd varchar2(20) not null,
tel varchar2(20));

select owner,constraint_name, constraint_type, table_name
from user_constraints
where table_name='table_unique';

INSERT INTO TABLE_UNIQUE
VALUES('TEST_ID_01','PWD081','010-1234-5678');

--무결성 제약 조건의 위배
INSERT INTO TABLE_UNIQUE
VALUES('TEST_ID_01','PWD082','010-1234-5679');

--UNIQUE 제약조건의 NULL 삽입 가능
INSERT INTO TABLE_UNIQUE
VALUES(NULL,'PWD082','010-1234-5679');

create table table_unique2(
login_id varchar2(20) constraint TBLUNQ2_LGNID_UNQ unique,
login_pwd varchar2(20) constraint TBLUNQ2_LGNPWD_UNQ not null,
tel varchar2(20));

select owner,constraint_name, constraint_type, table_name
from user_constraints
where table_name like 'table_unique%';

alter table table_unique modify(tel unique);

-- 3) primary key : not null + unique
--                : 테이블당 하나만 존재
--                : index 자동 생성
--                : 각 행을 식별하는 목적으로 사용
create table table_pk(
login_id varchar2(20) primary key,
login_pwd varchar2(20) not null,
tel varchar2(20));

INSERT INTO TABLE_pk
VALUES('test_01','PWD01','010-1234-7896');

--무결성 제약 조건의 위배
INSERT INTO TABLE_pk
VALUES('test_01','PWD02','010-1234-7896');

--오류 보고 - ORA-02260: 테이블에는 하나의 기본 키만 가질 수 있습니다.
create table table_pk2(
login_id varchar2(20) primary key,
login_pwd varchar2(20) primary key,
tel varchar2(20));

create table table_pk2(
login_id varchar2(20) constraint TBLPK2_LGNID_PK primary key,
login_pwd varchar2(20) constraint TBLPK2_LGNPWD_NN NOT NULL,
tel varchar2(20));

--제약조건을 지정하는 다른 방식
CREATE TABLE TABLE_CON(
COL1 VARCHAR2(20),
COL2 VARCHAR2(20),
COL3 VARCHAR2(20),
PRIMARY KEY(COL1),
CONSTRAINT TBLCON_UNQ UNIQUE (COL2));

--4) FIREIGN KEY : 외래키 
--               : 서로 다른 테이블 간 관계 정의
--               : 특정 테이블에서 PK 제약조건을 지정한 열을 다른 테이블의 특정열에서 참조
CREATE TABLE DEPT_FK(
DEPTNO NUMBER(2) CONSTRAINT DEPTFK_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13));

CREATE TABLE EMP_FK (
EMPNO NUMBER(4) CONSTRAINT EMPPK_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPFK_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO));

--오류 보고 - ORA-02291: 무결성 제약조건(C##SCOTT.EMPFK_DEPTNO_FK)이 위배되었습니다- 
--                     부모 키가 없습니다
INSERT INTO EMP_FK 
VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);

--외래키 수행 순서
--1. 부모테이블에 해당하는 데이터 삽입
--2. 자식테이블 데이터 삽입

INSERT INTO DEPT_FK VALUES(10,'DATABASE','SEOUL');

--오류 보고 -ORA-02292: 무결성 제약조건(C##SCOTT.EMPFK_DEPTNO_FK)이 
--위배되었습니다- 자식 레코드가 발견되었습니다
DELETE FROM DEPT_FK WHERE DEPTNO=10;

--외래 키 참조 행 데이터 삭제
--1) 자식 테이블에 해당하는 데이터 삭제
--2) 부모 테이블의 해당하는 데이터 삭제

--ON DELETE CASCADE : 열 데이터 삭제시 이 데이터를 참조하고 있는 데이터도 함께 삭제

DELETE FROM DEPT_FK WHERE DEPTNO=10;

DELETE FROM EMP_FK WHERE DEPTNO=10;
DELETE FROM DEPT_FK WHERE DEPTNO=10;

CREATE TABLE DEPT_FK2(
DEPTNO NUMBER(2) CONSTRAINT DEPTFK2_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14),
LOC VARCHAR2(13));

CREATE TABLE EMP_FK2 (
EMPNO NUMBER(4) CONSTRAINT EMPPK2_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPFK2_DEPTNO_FK REFERENCES DEPT_FK(DEPTNO) ON DELETE CASCADE);

INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');

INSERT INTO EMP_FK2 
VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);

DELETE FROM DEPT_FK2 WHERE DEPTNO=10;

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK2;

--ON DELETE SET NULL : 열 데이터를 삭제할 때 이 데이터를 참조하는 데이터를 NULL로 수정

CREATE TABLE EMP_FK3 (
EMPNO NUMBER(4) CONSTRAINT EMPPK3_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10),
JOB VARCHAR2(9),
MGR NUMBER(4),
HIREDATE DATE,
SAL NUMBER(7,2),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPFK3_DEPTNO_FK REFERENCES DEPT_FK2(DEPTNO) ON DELETE SET NULL);

INSERT INTO DEPT_FK2 VALUES(10,'DATABASE','SEOUL');

INSERT INTO EMP_FK3 
VALUES(9999,'TEST_NAME','TEST_JOB',NULL,'21-10-05',3000,NULL,10);

SELECT * FROM DEPT_FK2;
SELECT * FROM EMP_FK3;

DELETE FROM DEPT_FK2 WHERE DEPTNO=10;

--5) CHECK : 열에 저장할 수 있는 값의 범위 또는 패턴 정의
--         : 시간 0~23 숫자만 허용

CREATE TABLE TABLE_CHECK(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLCK_LGNID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(14) CONSTRAINT TBLCK_LGNPWD_NN CHECK(LENGTH(LOGIN_PWD)>3),
TEL VARCHAR2(13));

--오류 보고 -
--ORA-02290: 체크 제약조건(C##SCOTT.TBLCK_LGNPWD_NN)이 위배되었습니다
INSERT INTO TABLE_CHECK VALUES('TEST_ID','123','010-1234-5678');

INSERT INTO TABLE_CHECK VALUES('TEST_ID','1234','010-1234-5678');

--기본값을 지정 DEFAULT
--특정 열에 저장할 값이 지정되지 않았을 경우에 입력되는 기본값

CREATE TABLE TABLE_DEFAULT(
LOGIN_ID VARCHAR2(20) CONSTRAINT TBLDF_LGNID_PK PRIMARY KEY,
LOGIN_PWD VARCHAR2(20) DEFAULT '1234',
TEL VARCHAR2(13));

INSERT INTO TABLE_DEFAULT(LOGIN_ID,LOGIN_PWD)
VALUES('TEST_ID2','TEST_ID');

INSERT INTO TABLE_DEFAULT(LOGIN_ID,TEL)
VALUES('TEST_ID','010-5689-1234');

INSERT INTO TABLE_DEFAULT(LOGIN_ID,LOGIN_PWD,TEL)
VALUES('TEST_ID3',NULL,'010-5689-1234');

SELECT *  FROM TABLE_DEFAULT;

--[실습]
-- DEPT_CONST 테이블을 생성하시오.
-- DEPTNO /정수형숫자 /2 /PRIMARY KEY /DEPTCONST_DEPTNO_PK 
-- DNAME /가변형문자열 /14 /UNIQUE /DEPTCONST_DEPTNO_UNQ
-- LOC /가변형문자열 /13 /NOT NULL /DEPTCONST_LOC_N1N
CREATE TABLE DEPT_CONST(
DEPTNO NUMBER(2) CONSTRAINT DEPTCONST_DEPTNO_PK PRIMARY KEY,
DNAME VARCHAR2(14) CONSTRAINT DEPTCONST_DEPTNO_UNQ UNIQUE,
LOC VARCHAR2(13) CONSTRAINT DEPTCONST_LOC_NN NOT NULL);

DESC DEPT_CONST;

--EMP_CONST 테이블을 생성하시오.
-- EMPNO 정수형숫자 2 PRIMARY KEY  EMPCONST_EMPNO_PK
-- ENAME 가변형문자열 10 NOT NULL EMPCONST_ENAME_NN
-- JOB 가변형문자열 9
-- TEL 가변형문자열 20 UNIQUE EMPCONST_TEL_UNQ
-- HIREDATE 날짜
-- SAL 소수점 둘째자리 숫자 7 CHECK:급여는 1000 ~ 9999 만 입력가능 EMPCONST_SAL_CHK
-- COMM 소수점 둘째자리 숫자 7
-- DEPTNO 정수형 숫자 2 FOREIGN KEY EMPCONST_DEPTNO_FK

CREATE TABLE EMP_CONST(
EMPNO NUMBER(2) CONSTRAINT EMPCONST_EMPNO_PK PRIMARY KEY,
ENAME VARCHAR2(10) CONSTRAINT EMPCONST_ENAME_NN NOT NULL,
JOB VARCHAR2(9),
TEL VARCHAR2(20) CONSTRAINT EMPCONST_TEL_UNQ UNIQUE,
HIREDATE DATE,
SAL NUMBER(7,2) CONSTRAINT EMPCONST_SAL_CHK CHECK(SAL BETWEEN 1000 AND 9999),
COMM NUMBER(7,2),
DEPTNO NUMBER(2) CONSTRAINT EMPCONST_DEPTNO_FK REFERENCES DEPT_CONST(DEPTNO));





