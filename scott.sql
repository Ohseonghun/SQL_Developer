-- �����̾� ���� ���̺�(��) ����
CREATE TABLE Premier_League
(
��ȣ                  number(3),
�̸�                  varchar2(50),
������                varchar2(20),
����                  number(3),
����                  number(3)
);

--����Ʈ ����(���빰)--
INSERT INTO Premier_League VALUES(44,'���� ��Į��', '���ݼ�', 2, 2);
INSERT INTO Premier_League VALUES(7,'�����', '���ݼ�', 9, 3);
INSERT INTO Premier_League VALUES(27,'��ī�� ����', '�̵��ʴ�', 2, 4);
INSERT INTO Premier_League VALUES(1,'���� �丮��', '��Ű��', 0, 0);
INSERT INTO Premier_League VALUES(2,'����Ƽ', '�����', 0, 1);
INSERT INTO Premier_League VALUES(23,'��Ƽ��', '���ݼ�', 4, 2);
INSERT INTO Premier_League VALUES(19,'���̾�', '���ݼ�', 4, 1);
INSERT INTO Premier_League VALUES(52,'����ũ', '�̵��ʴ�', 3, 5);
INSERT INTO Premier_League VALUES(15,'����', '�̵��ʴ�', 2, 3);
INSERT INTO Premier_League VALUES(12,'�̸޸���', '�����', 0, 6);

-- ��� ���̺� --
drop table Premier_League;

-- Ư�� ���̺� ��� ����--
desc Premier_League;

-- ���̺� ǥ�� Ȯ���ϱ� --
select * from Premier_League;

-- ���ϴ� ������ �� �˻� --
select * from Premier_League where ������= '���ݼ�';
select * from Premier_League where ��ȣ= '1';
select * from Premier_League where �̸�= '�����';

-- ���ϴ� �� ���� --
delete from Premier_League where �̸�  = '����Ƽ';

-- ���ϴ� �� ���� ���� -- 
--where (�˻� ����) = ������ �� ���� ��  set (�ٲٰ� ���� ����) = �ٲٰ� ���� �� 
update Premier_League set �̸� = '�ε帮��' where ��ȣ=52;

-- Ư�� ��ġ���� ���ų� ���� �� �˻� --
select * from Premier_League where ��ȣ >= 7;
select * from Premier_League where ���� >= 3;

-- Ư�� ��ġ���� ���ų� ������, Ư�� ���ڰ� �� �� �˻�--
select * from Premier_League where ��ȣ >= 6 and �̸� like '%��%';
select * from Premier_League where ��ȣ >= 6 and ������ like '%��%';

-- ���ο� �� �����--
ALTER TABLE Premier_League ADD birth date;
-- Ư�� ĭ�� �� �Է� --
update Premier_League set birth = '1992.07.08' where ��ȣ = 7;

-- �������� �������� ����--
select * from Premier_League order by ��ȣ;		
select * from Premier_League order by ��ȣ asc;		
select * from Premier_League order by ��ȣ desc;		

--  ID �� ������ ID�� ����--
ALTER TABLE Premier_League ADD id number(5);
update Premier_League set id = 8 where �̸� = '�ε帮��';

--ID ���� �����̸Ӹ� Ű�� ����--
-- ������ �Ӹ� Ű��? �̺�� ���� �ϳ��� �ʵ忡�� ������ �� �ִ�. �ߺ� �Ұ�
ALTER TABLE Premier_League MODIFY id number(5) PRIMARY KEY;

--������ �ֱ�, ���� �� �߰��� ����--
alter table Premier_League add WeeklyWage number(10);
alter table Premier_League add YearlySalary number(10);

update Premier_League set WeeklyWage = 5000 where id = 5;
update Premier_League set YearlySalary = 70000 where id = 10;

--���ϴ� Ư�� ������ �̾Ƽ� ����--
select id,��ȣ,�̸� from Premier_League;
select id,�̸�,WeeklyWage,YearlySalary from Premier_League;

--�ߺ� ������ �����ϱ�--
select distinct WeeklyWage from Premier_League;

-- weeklywage Į�� ���� �ѱ� "�ֱ�"���� ǥ��--
select ��ȣ,�̸�,weeklywage as "�ֱ�" from Premier_League;

-- �ϱ��� ��Ÿ��, �ڵ忡 /7�� �����ؼ� �ϱ��� ����--
select ��ȣ,�̸�,weeklywage/7 �ϱ� from Premier_League;

--�ݿø� ó��
select ��ȣ,�̸�,round(weeklywage/7) �ֱ� from Premier_League;
--����ó��
select ��ȣ,�̸�,trunc(weeklywage/7) �ֱ� from Premier_League;

--���� ������ ���� �� ���ȣ,�̸��� ��� - ������ �ֱ���  �̻��� ������ ���
select  ID, ��ȣ, �̸�, round(weeklywage/7) "�ֱ�", weeklywage as "����"
from Premier_League where YearlySalary >= 50000 and round(weeklywage/7) >= 900;


--���ϴ� ���� ī��Ʈ--
update Gamer_Reddit 
SET ���� = ���� + 1
WHERE ��ȣ = 1;


--���� �λ��� ������ �ƴ� ���� ����ϱ�--

--�λ� Į�� �߰�(date������ �߸� ����, �Ǽ�)
ALTER TABLE Premier_League ADD �λ󿩺� date;
--char�� ����
ALTER TABLE Premier_League MODIFY �λ󿩺� char(1);
--�λ��� �߰�
update Premier_League set �λ󿩺� = 'y' where id = 8;
update Premier_League set �λ󿩺� = 'n' where �λ󿩺� is null;

--�λ󿩺� ���
select * from Premier_League where �λ󿩺� is null;
select * from Premier_League where �λ󿩺�= 'y';
--�λ󿩺�  Y or N ���� ���
select ��ȣ,�̸�,nvl(�λ󿩺�,'n') from Premier_League;

-- Ư�� �ؽ�Ʈ�� ���--
select * from Premier_League; where �̸� like '%��%'		
union		
select * from Premier_League; where �̸� like '%��%';	


--�ð�--
select sysdate from dual;
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') from dual;
-- MSSQL ����Ʈ �� �߰����
--ALTER TABLE [���̺��] ADD CONSTRAINT [�������Ǹ�] DEFAULT [��] FOR [�÷���];



-- �ߺ� ����--
select 
sum(distinct weeklywage), 
count(distinct weeklywage), 
max(weeklywage), 
min(weeklywage), 
round(avg(distinct weeklywage))
from Premier_League;

select sum(distinct weeklywage) from Premier_League;

--�ð� ���--
SELECT 
TO_CHAR(SYSDATE, 'YYYY-MM-DD'), --���糯¥ /
TO_CHAR(SYSDATE, 'YYYY-MM-DD'), --���糯¥ -
TO_CHAR(SYSDATE, 'YYYY'), --����⵵
TO_CHAR(SYSDATE, 'MM'), --���� ��
TO_CHAR(SYSDATE, 'DD'), --���� ��
TO_CHAR(SYSDATE, 'DAY'), --���� ����
TO_CHAR(SYSDATE, 'HH24:MI:SS'), --����ð� ���� (24�ð�)
TO_CHAR(SYSDATE, 'HH:MI:SS') --����ð� ���� (12�ð�)
FROM
Premier_League;






---���� ���� �Լ�---
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








------- ���� ���� �Լ� -------
create table Market (
name            varchar2(100),
category        varchar2(100),
price           number(5)
);
Select * From Market;
Insert Into Market Values('�����۽�', '����', 2000);

----1. ���� ���ϴ� ���� ����----
select 
sum (pay), -- ������ ���� ���� ��� ����
count (pay), --�׸��� ������ ������ ���
max (pay), --���� �׸�� �� �ִ밪 ���
min (pay), --���� �׸�� �� �ּҰ� ���
avg (pay) --���� ��� ���� ���
from Member_Pay
;
select sum(price) from Market;


----Group By----
SELECT [��ȸ�� ���̺� ��] [������]....
FROM [��ȸ �� ���̺�]
Where [��ȸ �� ���� �����ϴ� ���ǽ�]
ORDER BY [�����Ϸ��� �� ����];

--GB�� ����Ͽ� ��� ���� ���--
SELECT avg(price),category
From Market
Group By category;

--ī�װ��� ��� �������� ���� �ϱ�--
Select name, category, avg(price)
From Market
Group By category, name
Order By category, name ;

--GB�� ������ �ً� ����ϴ� HAVING��--
--������ 1500�� �̻��� ��ǰ �����ؼ� ���
SELECT name, category, avg(price)
    From Market
Group By category, name
    Having avg(price) >= 1500
Order By category, name;

--ROLLUP, CUBE, GROUPING SET �Լ�--
--ROLLUP�� ����Ͽ� �׷� ������� �� ���� ��ȸ
SELECT name, category, avg(price), min(price), max(price) 
    From Market
Group By Rollup(category, name);

--CUBE�� ����Ͽ� �� ��ü�� ������� �� ���� ��ȸ
SELECT name, category, avg(price), min(price), max(price) 
    From Market
Group By CUBE(category, name)
Order By category, name;

--GROUPING SETS���� ������ �׷� ���� ��� �ϱ�
SELECT name, category, count(price) 
    From Market
Group By GROUPING SETS(category, name)
Order By category, name;

--GROUPING ID, Ư�� ���� �׷�ȭ �Ǿ����� Ȯ���ϴ� �Լ�
SELECT name, category, count(price), sum(price) 
    GROUPING (category)
    GROUPING (name)
From Market
Group By CUBE(category, name)
Order By category, name;

-----���� ����------






---JOIN ����--
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
Insert Into Market2 Values('����', '��ټ�', 5649);
DELETE Market WHERE category = '������';


--from���� ���� ���̺� �����ϱ�--
--from���� ����� �� ���̺��� �����ϴ� ���� ��� ����� ���� ���յǾ� ���
SELECT *
FROM Market, Market2
ORDER BY category;

--�̳� ����--
--�̳������� ���� ���� �츮�� �����ϰ��� �ϴ� �ΰ��� ���̺��� ����� ��ҵ��� ���� �����ϴ� ���ι���Դϴ�.
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

SELECT no,id FROM T1,T2 WHERE T1.NO = T2.NO; -- ����. ����: no ���� � ���̺��� ������ �𸣱⶧��(t1���� no���� �ְ�, t2���� no���� �־)	
SELECT t1.no,t2.id FROM T1,T2 WHERE T1.NO = T2.NO; -- �� �̸��� ��ġ�� ��� ���̺��.���̸� ���� ǥ���ؾ���.	

select * from emp;
select * from dept;
select * from emp, dept;
select * from emp, dept where emp.deptno=dept.deptno;
select * from emp, dept where emp.deptno=dept.deptno order by emp.deptno;
select * from emp e, dept d where e.deptno=d.deptno;    --p.219 ��Ī ����
select empno,ename,job,mgr,e.deptno,dname,loc from emp e, dept d where e.deptno=d.deptno;








---------------���� ����--------------
--1. ���������� ������ ����ȭ��Ű�Ƿ�, ������ �� �κ��� ��Ȯ�� ������ �� �ְ� ���ݴϴ�.
--2. ���������� ������ JOIN�̳� UNION�� ���� ������ ������ �� �ִ� �� �ٸ� ����� �����մϴ�.
--3. ���������� ������ JOIN�̳� UNION ���� �� �� �б� ���մϴ�.

-- ������ �������� --
select * 
From EMP
    WHERE SAL > (SELECT SAL
                From EMP
                Where ENAME = 'jones');

--������ ���� �������� �Լ� ���--
SELECT E.EMPNO, E.ENAME, E.JOB, E.SLA,
        D.DEPTNO, D.DNAME, D.LOC
        FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
    AND E.DEPTNO = D.DEPTNO
    AND E.SAL >(SELECT AVG(SAL) 
                FROM EMP)

--IN �����ڸ� �̿��� ������ ��������--
--�μ� ��ȣ�� 20�̰ų� 30�� ��� ������ ���
SELECT *
    FROM EMP
WHERE DEPTNO IN (20, 30);

--�� �μ��� �ְ� �׿��� ������ �޿��� �޴� ��� ���
SELECT *
    FROM EMP
WHERE DEPTNO IN (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);

--ANY������ ���--
SELECT *
    FROM EMP
WHERE DEPTNO ANY (SELECT MAX(SAL)
                    FROM EMP
                    GROUP BY DEPTNO);


--SELECT �� ���� ���� (��Į�� ��������)--
--SELECT �� �ȿ� ���������� ����ִ�.�� ��, ���������� ����� �ݵ�� ���� ���̳� 
--SUM, COUNT ���� ���� �Լ��� ��ģ ���� ������ ���ϵǾ�� �Ѵ�.

SELECT �л��̸�,
       (  SELECT �а�.�а��̸�
            FROM �а�
           WHERE �а�.�а�ID = �л�.�л�ID ) AS �а��̸�
  FROM �л�
 WHERE �л��̸� = 'ȫ�浿' ;


--from�� ���� ����(�ζ��κ� ��������)--
--FROM �� �ȿ� ���������� ����ִ�. �� ��, ���������� ����� �ݵ�� �ϳ��� ���̺�� ���ϵǾ�� �Ѵ�.
--������ ���������� ����ģ ���̺� �ϳ��� ���������� FROM ���� ���̺�� ��� ����.

SELECT �л��̸�, ��������
  FROM ( SELECT �л�.�л��̸� AS �л��̸�,
                ����.�������� AS ��������
           FROM �л�, ����
          WHERE �л�.�л��̸� = ����.�л��̸�
            AND  ����.�����̸� = '����' ) ;


--WHERE�� �������� (��ø ��������)
--WHERE �� �ȿ� ���������� ����ִ�. ���� ���� ���̴� �������� ���������̸� ������� ������ �� �� ������ �����ϴ�.

ELECT *
  FROM �л�
 WHERE �л�.�л��̸� IN ( SELECT ����.�л��̸� FROM ���� WHERE ����.�����̸� = '����' ) ;



--������ ��������--
-- ���������� �������� ���� �ϳ��� ROW(��)���� ��ȯ.
-- �� �ϳ��� ����� ������ ���������� �񱳿����ڸ� ���� ������ ������.
-- �񱳿����ڴ� ������ �񱳿����ڸ� ��� ( >, >=, <, <=, =, ... ).

-- ex ) ������� ��� �޿����� �� ���� �޿��� �޴� ����� �˻�
SELECT  ENAME, SAL
  FROM  EMP
 WHERE  SAL > ( SELECT  AVG(SAL)
                  FROM  EMP);


---������ ��������---
-- ���������� �������� �� �� �̻��� �����͸� ��ȯ.
-- �񱳿����ڴ� ������ �񱳿����ڸ� ��� ( IN, ANY, SOME, ALL, EXISTS ).

-- ex ) 30�� �Ҽ� ����� �� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ���
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
SELECT no,id FROM T1,T2 WHERE T1.NO = T2.NO; -- ����. ����: no ���� � ���̺��� ������ �𸣱⶧��(t1���� no���� �ְ�, t2���� no���� �־)	
SELECT t1.no,t2.id FROM T1,T2 WHERE T1.NO = T2.NO; -- �� �̸��� ��ġ�� ��� ���̺��.���̸� ���� ǥ���ؾ���.	



drop table t2;
CREATE TABLE T1( NO NUMBER(1), animal varchar2(20) );		
INSERT INTO T1 VALUES(1,'��');		
INSERT INTO T1 VALUES(2,'�����');		
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

-- 1+2(��������)
select * from emp where sal > 
    (select sal from emp where ename='JONES');






---�Խ��� ����� ����----
CREATE TABLE Gamer_Reddit
(
�۹�ȣ                number(10),
�г���                varchar2(100) NOT NULL, 
����                  varchar2(300),
����                  varchar2(500) NOT NULL,
��õ                  number(4) DEFAULT 0,
����õ                number(4) DEFAULT 0,
�ۼ���                date
);


--���̺� ���
DROP TABLE Gamer_Reddit;
--���̺� ��� ���
DESC Gamer_Reddit;
--���̺� ���� ���
select * from Gamer_Reddit;


--�Խñ� ���� ���� �Է�--
INSERT INTO Gamer_Reddit VALUES(
--�� ��ȣ--
1                       ,
--�г���--
'�Ҹ�����'               ,
--����--
'���� �����ϴ�'          ,
--����--
'���� ���˴� ��¥��'      ,
--��õ--
2                       ,
--����õ--
22                      ,
--�ۼ���--
sysdate
);

-- ���ϴ� �� ���� �˻� --
select * from Gamer_Reddit where ���� = '���ٵ�';
select * from Gamer_Reddit where �̸� like '%��%';
--���� ����--
UPDATE Gamer_Reddit SET ���� = '' where �۹�ȣ = 1; 

--��õ ����õ ��ȸ�� ī��Ʈ +1--
update Gamer_Reddit 
SET ����õ = ����õ + 1
WHERE �۹�ȣ = 1;

--��� �ޱ�--
INSERT INTO Gamer_Reddit(�۹�ȣ,�г���,����)
VALUES(1,'����', '�� �ƴϾ�');

--ȸ�� ���� join ---
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
'�Ҹ�����',
25
);
INSERT INTO info2 VALUES(
'�Ҹ�����',
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