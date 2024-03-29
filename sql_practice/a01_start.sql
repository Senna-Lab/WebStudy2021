SELECT * FROM emp;
-- 복사 테이블 만들기

/*
CREATE table 테이블명
as select * from 복사할 테이블명;
 */

CREATE TABLE emp01
AS SELECT * FROM emp;
SELECT * FROM emp01;
-- 로딩할 특정 컬럼 지정, select 컬럼명1, 컬럼명2 ...
SELECT empno, ename, job
FROM emp01;

/*

# SELECT 명령문
1. 테이블에 저장된 데이터를 검색하기 위한 명령문
2. select 명령문에서 select 절과 from 절이 필수적
3. 사용법 
	selecet
		* : 테이블에 있는전체 컬럼
		컬럼명1, 컬럼명2 : 해당 컬럼을 지정할 때..
	distinct 컬럼명 : 중복하는 데이터를 삭제.
	from 테이블명
	where 조건;
 */

-- ex) emp, dept, salgrade, bonus 이용해서 테이블 전체 내용 검색
-- es2) emp테이블에 ename, job, hiredate, deptno 컬럼 검색 처리

SELECT * FROM emp;
SELECT * FROM dept;
SELECT * FROM salgrade;
SELECT * FROM bonus;
SELECT ename, job, hiredate, deptno FROM emp;

-- 중복배제: 하나의 컬럼이 같지않게 처리
SELECT DISTINCT deptno FROM emp;
-- 중복배제: 두개 컬럼에서 같지 않게 처리
SELECT DISTINCT mgr, deptno FROM emp;

/*

# 컬럼명 별칭 처리
1. 기본형식
	select 컬럼명 as 별칭,
		컬럼명 as 별칭,
		컬렴명 별칭,
		컬럼명 " 안 녕 하 세 요"
	from 테이블
 - 해당 테이블 구조 안에 있는 컬럼명이 별칭명으로 호출되어 출력된다.
 - 별칭명은 공백도 가능
 - 별칭명에 공백, 특수문자(한글 포함)이 필요할 때는 " " 사이에 입력한다.


*/

SELECT empno AS NO, ename AS name,
		job job01,
		hiredate "입사일 입니다"
FROM emp;

-- ex) alias 형식으로 사원번호(empno), 사원명(ename), 관리자번호(mgr) 출력 처리
SELECT empno AS "사원번호(empno)",
		ename AS "사원명(ename)",
		mgr AS "관리자번호(mgr)"
FROM emp


/*

# 데이터와 산술연간자 concatnate(문자열 연결) 처리..

1. 컬럼에 있는 숫자형 데이터는 사칙연산자 처리가 가능하다. (+ - / *)
2. 문자열 연결. DB에서는 '문자열1' || '문자열2'로 데이터 표시, 연결처리 함.



 */

SELECT empno, empno+1000 "empno+1000",
		empno*20 "empno*20",
		ename || '님은 회사원입니다!' msg,
		sal, comm, sal+comm "sal+comm"
FROM emp;

-- ex1 사원의 이름은 @@@입니다. 부서번호는 @@@입니다.
-- ex2 사원명(부서번호), 급여의 10%표시, 급여+급여10% 합산

SELECT '사원의 이름은'||ename||'입니다.' ename,
		'부서번호는'||deptno||'입니다,' deptno
FROM emp;

SELECT ename||'('||deptno||')' emp,
		sal*0.1 "급여의 10%",
		sal*1.1 "반영 급여"
FROM emp;

-- ex3 사원번호 empno이고 급여는 연봉으로 sal만원이빈다 alias명 "소개"

SELECT '사원번호 '||empno||'이고 급여는 연봉으로 '||sal*12||'만원입니다' "소개"
FROM emp;



/*

# sql 명령문의 표준 형식

select *|컬럼명 : 열단위로 나타날 데이터
from 테이블명 : 대상 테이블 as alias명
where 조건문 : row(행)단위로 나타날 데이터 filtering 처리
group by 그룹할 컬럼 지정 : 특정 컬럼 기ㅣ준으로 합산, 갯수, 최대/최소값
having 그룹의 조건 지정 : 그룹 컬럼의 조건
order by 정렬할 우선순위 컬럼 지정:

 */



SELECT deptno, sal -- 컬럼 단위로 전체 행을 지정..
FROM emp
WHERE sal>=3000; -- 조건을 통해서 행 단위로 filtering 처리

SELECT deptno, max(sal) "그룹별 최대 연봉",
		count(*) "그룹별 건수"
FROM emp 
GROUP BY deptno --그룹 할 컬럼 부서번호를 겹치지않게 그룹화한 후
HAVING max(sal) >= 3000; -- HAVING 그룹함수의 조건

SELECT deptno, sal
FROM emp 
ORDER BY sal DESC;  -- 특정 컬럼 기준으로 순차정렬/역순정렬

/*
# where 조건문
1. 질의에서 필요한 관계대수(=, >=, <=, >, <)로 select의 컬럼에 대해서 row 단위로 조건에 해당한다.
2. 관계 대수를 연결하는 and, or, subquery (중첩질의)를 통해서 row단위로 filtering 한다.

 */

-- 연봉이 2000~4000 사이의 사원 정보 출력
SELECT *
FROM emp
WHERE sal>=2000 AND sal<=4000;
-- 부서번호가 10dls epdlxj cnffur
SELECT *
FROM emp
WHERE deptno = 10;
-- ex) job(직책)이 'SALESMAN'인 사원 정보 출력
SELECT *
FROM emp
WHERE JOB = 'SALESMAN';

--ex1) sal이 2000이상인 상원명, 급여, 부서번호 출력
--ex2) 연봉이 1000~3000이고 부서번호가 10인 사원의 사원번호 사원명, 급여, 부서번호 출력

SELECT ename, sal, deptno
FROM emp
WHERE sal>=2000;

SELECT empno, ename, sal, deptno
FROM emp
WHERE sal>=1000 AND sal<=3000 AND deptno=10 ;


/*
비교 연산자
1. != : 같지 않을 때
	not: 아닐 때
	--> deptno != 20, NOT(deptno=20)
2. null
	IS NULL, IS NOT NULL


 */

SELECT sal, comm
FROM EMP e 
WHERE comm = NULL; -- 원하는 NULL 데이터가 보이지 않는다.

SELECT sal, comm
FROM EMP e 
WHERE comm IS NULL; -- null인 경우

SELECT sal, comm
FROM EMP e 
WHERE comm IS NOT NULL; -- null이 아닌 경우

--ex) comm이 null이 아니거나 부서번호가 10인 데이터 출력
SELECT *
FROM emp 
WHERE comm IS NOT NULL OR deptno = 10;