
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

commit;