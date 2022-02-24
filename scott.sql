-- 프리미어 리그 테이블(행) 생성
CREATE TABLE Premier_League
(
번호                  number(3),
이름                  varchar2(50),
포지션                varchar2(20),
득점                  number(3),
도움                  number(3)
);

--리스트 생성(내용물)--
INSERT INTO Premier_League VALUES(44,'데인 스칼렛', '공격수', 2, 2);
INSERT INTO Premier_League VALUES(7,'손흥민', '공격수', 9, 3);
INSERT INTO Premier_League VALUES(27,'루카스 모우라', '미드필더', 2, 4);
INSERT INTO Premier_League VALUES(1,'위고 요리스', '골키퍼', 0, 0);
INSERT INTO Premier_League VALUES(2,'도허티', '수비수', 0, 1);
INSERT INTO Premier_League VALUES(23,'스티븐', '공격수', 4, 2);
INSERT INTO Premier_League VALUES(19,'라이언', '공격수', 4, 1);
INSERT INTO Premier_League VALUES(52,'마이크', '미드필더', 3, 5);
INSERT INTO Premier_League VALUES(15,'에릭', '미드필더', 2, 3);
INSERT INTO Premier_League VALUES(12,'이메르송', '수비수', 0, 6);

-- 드롭 테이블 --
drop table Premier_League;

-- 특정 테이블 요소 보기--
desc Premier_League;

-- 테이블 표로 확인하기 --
select * from Premier_League;

-- 원하는 조건의 값 검색 --
select * from Premier_League where 포지션= '공격수';
select * from Premier_League where 번호= '1';
select * from Premier_League where 이름= '손흥민';

-- 원하는 행 삭제 --
delete from Premier_League where 이름  = '도허티';

-- 원하는 행 내용 수정 -- 
--where (검색 기준) = 기준이 된 행의 값  set (바꾸고 싶은 정보) = 바꾸고 싶은 값 
update Premier_League set 이름 = '로드리고' where 번호=52;

-- 특정 수치도다 높거나 낮은 값 검색 --
select * from Premier_League where 번호 >= 7;
select * from Premier_League where 득점 >= 3;

-- 특정 수치도다 높거나 낮으며, 특정 문자가 들어간 값 검색--
select * from Premier_League where 번호 >= 6 and 이름 like '%손%';
select * from Premier_League where 번호 >= 6 and 포지션 like '%공%';

-- 새로운 열 만들기--
ALTER TABLE Premier_League ADD birth date;
-- 특정 칸에 값 입력 --
update Premier_League set birth = '1992.07.08' where 번호 = 7;

-- 오름차순 내림차순 정렬--
select * from Premier_League order by 번호;		
select * from Premier_League order by 번호 asc;		
select * from Premier_League order by 번호 desc;		

--  ID 열 생성과 ID값 선언--
ALTER TABLE Premier_League ADD id number(5);
update Premier_League set id = 8 where 이름 = '로드리고';

--ID 값을 프라이머리 키로 선언--
-- 프라이 머리 키란? 이블당 오직 하나의 필드에만 설정할 수 있다. 중복 불가
ALTER TABLE Premier_League MODIFY id number(5) PRIMARY KEY;

--선수들 주급, 연봉 열 추가와 설정--
alter table Premier_League add WeeklyWage number(10);
alter table Premier_League add YearlySalary number(10);

update Premier_League set WeeklyWage = 5000 where id = 5;
update Premier_League set YearlySalary = 70000 where id = 10;

--원하는 특정 정보만 뽑아서 보기--
select id,번호,이름 from Premier_League;
select id,이름,WeeklyWage,YearlySalary from Premier_League;

--중복 데이터 제거하기--
select distinct WeeklyWage from Premier_League;

-- weeklywage 칼럼 명을 한글 "주급"으로 표시--
select 번호,이름,weeklywage as "주급" from Premier_League;

-- 일급을 나타냄, 코드에 /7을 삽입해서 일급을 산출--
select 번호,이름,weeklywage/7 일급 from Premier_League;

--반올림 처리
select 번호,이름,round(weeklywage/7) 주급 from Premier_League;
--버림처리
select 번호,이름,trunc(weeklywage/7) 주급 from Premier_League;

--문제 선수단 정보 중 등번호,이름을 출력 - 조건은 주급이  이상인 선수만 출력
select  ID, 번호, 이름, round(weeklywage/7) "주급", weeklywage as "월급"
from Premier_League where YearlySalary >= 50000 and round(weeklywage/7) >= 900;


--원하는 정수 카운트--
update Gamer_Reddit 
SET 득점 = 득점 + 1
WHERE 번호 = 1;


--문제 부상인 선수와 아닌 선수 출력하기--

--부상 칼럼 추가(date형으로 잘못 선언, 실수)
ALTER TABLE Premier_League ADD 부상여부 date;
--char로 변경
ALTER TABLE Premier_League MODIFY 부상여부 char(1);
--부상자 추가
update Premier_League set 부상여부 = 'y' where id = 8;
update Premier_League set 부상여부 = 'n' where 부상여부 is null;

--부상여부 출력
select * from Premier_League where 부상여부 is null;
select * from Premier_League where 부상여부= 'y';
--부상여부  Y or N 으로 출력
select 번호,이름,nvl(부상여부,'n') from Premier_League;

-- 특정 텍스트로 출력--
select * from Premier_League; where 이름 like '%손%'		
union		
select * from Premier_League; where 이름 like '%로%';	


--시간--
select sysdate from dual;
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') from dual;
-- MSSQL 디폴트 값 추가방법
--ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건명] DEFAULT [값] FOR [컬럼명];



-- 중복 제거--
select 
sum(distinct weeklywage), 
count(distinct weeklywage), 
max(weeklywage), 
min(weeklywage), 
round(avg(distinct weeklywage))
from Premier_League;

select sum(distinct weeklywage) from Premier_League;

--시간 출력--
SELECT 
TO_CHAR(SYSDATE, 'YYYY-MM-DD'), --현재날짜 /
TO_CHAR(SYSDATE, 'YYYY-MM-DD'), --현재날짜 -
TO_CHAR(SYSDATE, 'YYYY'), --현재년도
TO_CHAR(SYSDATE, 'MM'), --현재 월
TO_CHAR(SYSDATE, 'DD'), --현재 일
TO_CHAR(SYSDATE, 'DAY'), --현재 요일
TO_CHAR(SYSDATE, 'HH24:MI:SS'), --현재시간 포맷 (24시간)
TO_CHAR(SYSDATE, 'HH:MI:SS') --현재시간 포맷 (12시간)
FROM
Premier_League;






---다중 수행 함수---
create table Member(
id          number(3) PRIMARY KEY,
name        varchar2(50),
job         varchar2(50)
);

create table Member_Pay(
name           varchar(50),
money          number(10),
pay            number(10)
);

DROP TABLE member;
INSERT INTO member VALUES(7,'tota','SCAV');
INSERT INTO member_pay VALUES('jack',700);

SELECT *FROM member;
SELECT *FROM member_pay;
SELECT *FROM member,member_pay;
SELECT *FROM member,member_pay;
WHERE member.name = member_pay.name;
SELECT member.name,member_pay.name FROM member,member_pay WHERE member.name = member_pay.name;
;








------- 다중 수행 함수 -------
create table Market (
name            varchar2(100),
category        varchar2(100),
price           number(5)
);
Select * From Market;
Insert Into Market Values('프링글스', '과자', 2000);

----1. 행의 원하는 값을 산출----
select 
sum (pay), -- 지정한 열의 갑을 모두 더함
count (pay), --항목의 데이터 개수를 출력
max (pay), --행의 항목들 중 최대값 출력
min (pay), --행의 항목들 중 최소값 출력
avg (pay) --행의 평균 값을 출력
from Member_Pay
;
select sum(price) from Market;


----Group By----
SELECT [조회할 테이블 열] [여러개]....
FROM [조회 할 테이블]
Where [조회 할 행을 선별하는 조건식]
ORDER BY [정렬하려는 열 지정];

--GB를 사용하여 평균 가격 출력--
SELECT avg(price),category
From Market
Group By category;

--카테고리별 평균 가격으로 정렬 하기--
Select name, category, avg(price)
From Market
Group By category, name
Order By category, name ;

--GB에 조건을 줄떄 사용하는 HAVING절--
--가격이 1500원 이상의 제품 정렬해서 출력
SELECT name, category, avg(price)
    From Market
Group By category, name
    Having avg(price) >= 1500
Order By category, name;

--ROLLUP, CUBE, GROUPING SET 함수--
--ROLLUP을 사용하여 그룹 대상으로 한 정보 조회
SELECT name, category, avg(price), min(price), max(price) 
    From Market
Group By Rollup(category, name);

--CUBE를 사용하여 열 전체를 대상으로 한 정보 조회
SELECT name, category, avg(price), min(price), max(price) 
    From Market
Group By CUBE(category, name)
Order By category, name;

--GROUPING SETS으로 열별로 그룹 묶어 출력 하기
SELECT name, category, count(price) 
    From Market
Group By GROUPING SETS(category, name)
Order By category, name;

--GROUPING ID, 특정 열이 그룹화 되었는지 확인하는 함수
SELECT name, category, count(price), sum(price) 
    GROUPING (category)
    GROUPING (name)
From Market
Group By CUBE(category, name)
Order By category, name;

-----서브 쿼리------






---JOIN 조인--
create table Market (
name            varchar2(100),
category        varchar2(100),
price           number(5)
);

CREATE TABLE Market2 (
name            varchar2(100),
company         varchar2(100),
Performance     number(5)
);
Select * From Market,Market2;
Insert Into Market2 Values('생수', '삼다수', 5649);
DELETE Market WHERE category = '오리온';


--from절에 여러 테이블 선언하기--
--from절에 명시한 각 테이블을 구성하는 행이 모든 경우의 수로 조합되어 출력
SELECT *
FROM Market, Market2
ORDER BY category;

--이너 조인--
--이너조인은 위와 같이 우리가 조인하고자 하는 두개의 테이블에서 공통된 요소들을 통해 결합하는 조인방식입니다.
SELECT Market.name, Market2.name
FROM Market
JOIN Market2 
ON Market.name, Market2.name;


CREATE TABLE T1( NO NUMBER(1) );	
INSERT INTO T1 VALUES(1);	
INSERT INTO T1 VALUES(2);	
CREATE TABLE T2( NO NUMBER(1), ID CHAR(1) );	
INSERT INTO T2 VALUES(1,'A');	
INSERT INTO T2 VALUES(2,'B');	
INSERT INTO T2 VALUES(3,'C');	

SELECT * FROM T1,T2;	

SELECT * FROM T1,T2 
WHERE T1.NO = T2.NO;	

SELECT no,id FROM T1,T2 WHERE T1.NO = T2.NO; -- 에러. 이유: no 열이 어떤 테이블의 열인지 모르기때문(t1에도 no열이 있고, t2에도 no열이 있어서)	
SELECT t1.no,t2.id FROM T1,T2 WHERE T1.NO = T2.NO; -- 열 이름이 겹치는 경우 테이블명.열이름 으로 표시해야함.	

select * from emp;
select * from dept;
select * from emp, dept;
select * from emp, dept where emp.deptno=dept.deptno;
select * from emp, dept where emp.deptno=dept.deptno order by emp.deptno;
select * from emp e, dept d where e.deptno=d.deptno;    --p.219 별칭 설정
select empno,ename,job,mgr,e.deptno,dname,loc from emp e, dept d where e.deptno=d.deptno;








---------------서브 쿼리--------------
--1. 서브쿼리는 쿼리를 구조화시키므로, 쿼리의 각 부분을 명확히 구분할 수 있게 해줍니다.
--2. 서브쿼리는 복잡한 JOIN이나 UNION과 같은 동작을 수행할 수 있는 또 다른 방법을 제공합니다.
--3. 서브쿼리는 복잡한 JOIN이나 UNION 보다 좀 더 읽기 편합니다.

-- 단일행 서브쿼리 --
select * 
From EMP
    WHERE SAL > (SELECT SAL
                From EMP
                Where ENAME = 'jones');

--단일행 서브 쿼리에서 함수 사용--
SELECT E.EMPNO, E.ENAME, E.JOB, E.SLA,
        D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = D.DEPTNO
    AND E.SAL >(SELECT AVG(SAL) 
                FROM EMP)

--IN 연산자를 이용한 다중행 서브쿼리--
--부서 번호가 20이거나 30인 사원 정보만 출력
SELECT *
    FROM EMP
WHERE DEPTNO IN (20, 30);

--각 부서별 최고 그여와 동일한 급여를 받는 사람 출력
SELECT *
    FROM EMP
WHERE DEPTNO IN (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);

--ANY연산자 사용--
SELECT *
    FROM EMP
WHERE DEPTNO ANY (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);


--SELECT 절 서브 쿼리 (스칼라 서브쿼리)--
--SELECT 절 안에 서브쿼리가 들어있다.이 때, 서브쿼리의 결과는 반드시 단일 행이나 
--SUM, COUNT 등의 집계 함수를 거친 단일 값으로 리턴되어야 한다.

SELECT 학생이름,
       (  SELECT 학과.학과이름
            FROM 학과
           WHERE 학과.학과ID = 학생.학생ID ) AS 학과이름
  FROM 학생
 WHERE 학생이름 = '홍길동' ;


--from절 서브 쿼리(인라인뷰 서브쿼리)--
--FROM 절 안에 서브쿼리가 들어있다. 이 때, 서브쿼리의 결과는 반드시 하나의 테이블로 리턴되어야 한다.
--이유는 서브쿼리를 끝마친 테이블 하나를 메인쿼리의 FROM 에서 테이블로 잡기 때문.

SELECT 학생이름, 수학점수
  FROM ( SELECT 학생.학생이름 AS 학생이름,
                과목.과목점수 AS 수학점수
           FROM 학생, 과목
          WHERE 학생.학생이름 = 과목.학생이름
            AND  과목.과목이름 = '수학' ) ;


--WHERE절 서브쿼리 (중첩 서브쿼리)
--WHERE 절 안에 서브쿼리가 들어있다. 가장 자주 쓰이는 대중적인 서브쿼리이며 단일행과 복수행 둘 다 리턴이 가능하다.

ELECT *
  FROM 학생
 WHERE 학생.학생이름 IN ( SELECT 과목.학생이름 FROM 과목 WHERE 과목.과목이름 = '수학' ) ;



--단일행 서브쿼리--
-- 서브쿼리의 수행결과가 오직 하나의 ROW(행)만을 반환.
-- 이 하나의 결과를 가지고 메인쿼리는 비교연산자를 통해 쿼리를 수행함.
-- 비교연산자는 단일행 비교연산자를 사용 ( >, >=, <, <=, =, ... ).

-- ex ) 사원들의 평균 급여보다 더 많은 급여를 받는 사원을 검색
SELECT  ENAME, SAL
  FROM  EMP
 WHERE  SAL > ( SELECT  AVG(SAL)
                  FROM  EMP);


---다중행 서브쿼리---
-- 서브쿼리의 수행결과가 두 건 이상의 데이터를 반환.
-- 비교연산자는 다중행 비교연산자를 사용 ( IN, ANY, SOME, ALL, EXISTS ).

-- ex ) 30번 소속 사원들 중 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사람의 이름과 급여를 출력
SELECT  ENAME, SAL
  FROM  EMP
 WHERE  SAL > ALL ( SELECT  SAL
                      FROM  EMP
                     WHERE  DEPTNO = 30 );





CREATE TABLE T1( NO NUMBER(1) );	
INSERT INTO T1 VALUES(1);	
INSERT INTO T1 VALUES(2);	
CREATE TABLE T2( NO NUMBER(1), ID CHAR(1) );	
INSERT INTO T2 VALUES(1,'A');	
INSERT INTO T2 VALUES(2,'B');	
INSERT INTO T2 VALUES(3,'C');	
SELECT * FROM T1,T2;	
SELECT * FROM T1,T2 WHERE T1.NO = T2.NO;	
SELECT no,id FROM T1,T2 WHERE T1.NO = T2.NO; -- 에러. 이유: no 열이 어떤 테이블의 열인지 모르기때문(t1에도 no열이 있고, t2에도 no열이 있어서)	
SELECT t1.no,t2.id FROM T1,T2 WHERE T1.NO = T2.NO; -- 열 이름이 겹치는 경우 테이블명.열이름 으로 표시해야함.	



drop table t2;
CREATE TABLE T1( NO NUMBER(1), animal varchar2(20) );		
INSERT INTO T1 VALUES(1,'개');		
INSERT INTO T1 VALUES(2,'고양이');		
CREATE TABLE T2( NO NUMBER(1) );		
INSERT INTO T2 VALUES(1);		
INSERT INTO T2 VALUES(2);		
SELECT * FROM T1;		
SELECT * FROM T2;		
SELECT COUNT(*) FROM T2; -- 2
SELECT * FROM T1 WHERE NO = (SELECT COUNT(*) FROM T2);		
SELECT * FROM T1 WHERE NO = 2;	

select * from emp;
--1
select sal from emp where ename='JONES';
--2
select * from emp where sal > 2975;

-- 1+2(서브쿼리)
select * from emp where sal > 
    (select sal from emp where ename='JONES');






---게시판 만들기 연습----
CREATE TABLE Gamer_Reddit
(
글번호                number(10),
닉네임                varchar2(100) NOT NULL, 
제목                  varchar2(300),
내용                  varchar2(500) NOT NULL,
추천                  number(4) DEFAULT 0,
비추천                number(4) DEFAULT 0,
작성일                date
);


--테이블 드랍
DROP TABLE Gamer_Reddit;
--테이블 요소 출력
DESC Gamer_Reddit;
--테이블 내용 출력
select * from Gamer_Reddit;


--게시글 종합 내용 입력--
INSERT INTO Gamer_Reddit VALUES(
--글 번호--
1                       ,
--닉네임--
'불리조드'               ,
--제목--
'나는 깨끗하다'          ,
--내용--
'나는 무죄다 진짜다'      ,
--추천--
2                       ,
--비추천--
22                      ,
--작성일--
sysdate
);

-- 원하는 글 내용 검색 --
select * from Gamer_Reddit where 내용 = '닌텐도';
select * from Gamer_Reddit where 이름 like '%도%';
--내용 수정--
UPDATE Gamer_Reddit SET 제목 = '' where 글번호 = 1; 

--추천 비추천 조회수 카운트 +1--
update Gamer_Reddit 
SET 비추천 = 비추천 + 1
WHERE 글번호 = 1;

--댓글 달기--
INSERT INTO Gamer_Reddit(글번호,닉네임,내용)
VALUES(1,'닌텐', '응 아니야');

--회원 정보 join ---
create table info
(
mail    varchar2(100),
age     number(2)
);
create table info2
(
abr    varchar2(100),
phon     number(10)
);
select * from info;   
DROP TABLE info;

INSERT INTO info VALUES(
'불리조드',
25
);
INSERT INTO info2 VALUES(
'불리조드',
25
);

--group by----
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 10;
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 20;
UNION ALL
SELECT AVG(SAL) FROM EMP WHERE DEPTNO = 30;

SELECT AVG(SAL), DEPTNO
FROM EMP
GROUP BY DEPTNO;select * from test;

HAVING AVG(SAL) >= 2000

commit;