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

select * from Premier_Leagu where �̸� like '%��%'		
union		
select * from Premier_Leagu where �̸� like '%��%';	

select sysdate from dual;
select to_char(sysdate,'YYYY/MM/DD HH24:MI:SS') from dual;
-- MSSQL ����Ʈ �� �߰����
--ALTER TABLE [���̺��] ADD CONSTRAINT [�������Ǹ�] DEFAULT [��] FOR [�÷���];

--- ���� ����----

CREATE TABLE e_sports
(
id              number(4) PRIMARY KEY,
��               varchar2(50),
�̸�             varchar2(50),     
������            varchar2(50),
MVPȽ��          number(2),
����              number(10),
�������            date,
��������           char(1)          DEFAULT 'y'
);

INSERT INTO Premier_League VALUES(1, SKT, '����Ŀ', '�̵�', 10, 2020 );

drop table e_sports;

desc e_sports;

commit;