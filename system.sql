CREATE TABLE TEST(		ID VARCHAR2(4000),	
		PW CHAR(10),	
		NUM NUMBER(38),        	
		NUM2 NUMBER(4,2),	
		FLOATING_POINT NUMBER,	
		CONTENTS CLOB,	
		WRITE_DATE DATE      );	
CREATE TABLE DEPT_T AS SELECT * FROM DEPT;			
CREATE TABLE DEPT_T AS SELECT * FROM DEPT WHERE 1!=1;			
DESC Ȯ�� �� ���̺��� ;			ex.
ALTER TABLE TEST ADD XXX NUMBER(3);			
ALTER TABLE TEST RENAME COLUMN XXX TO YYY;			
ALTER TABLE TEST MODIFY YYY NUMBER(5);			
ALTER TABLE TEST DROP COLUMN YYY;			
RENAME TEST TO TEST2;			
DROP TABLE TEST;			
INSERT INTO TEST VALUES( '4', 'a', '��', 10 );			
INSERT INTO TEST (ID) VALUES('1');		INSERT INTO TEST (ID,NAME) VALUES('3','��');	
INSERT INTO EMP_T (HIREDATE) VALUES ( '2021/09/06' ); -- �������� �ְ� �ú��ʴ� 0���� ��			
INSERT INTO EMP_T (HIREDATE) VALUES (SYSDATE); -- ���� �ð� �Է�			
SELECT * FROM TEST;			
SELECT NO,TITLE,WID,TO_CHAR(DATE_W,'YYYY/MM/DD HH24:MI:SS') FROM BF ORDER BY TITLE ASC, DATE_W DESC;	
1���� TITLE �� �������� �����ϰ�, �׷��� ���ĵ� ���¿��� 2���� DATE_W �� ������.	
	SELECT TO_CHAR(DATE_W,'YYYY/MM/DD HH24:MI:SS') FROM BF;
SELECT * FROM TEST WHERE ID >= 1;	
SELECT * FROM TEST WHERE NUM IS NOT NULL;	
SELECT * FROM TEST WHERE NUM IS NULL;	
ex.	��ȣ�� 6�̻��̸鼭 �̸��� '��' �� �� �����鸸 ���
UPDATE TEST SET NUM = 5 WHERE ID = 3;	
UPDATE TEST SET NUM = 5;	
DELETE TEST WHERE ID = 6;	
DELETE FROM MEMBER;	
TRUNCATE TABLE TEST; 	
	��� �ڷ��� constraint ���������̸� �������ǳ��� 
CREATE TABLE TEST( ID VARCHAR2(4000) NOT NULL );	
CREATE TABLE TEST( ID VARCHAR2(4000) UNIQUE );	
CREATE TABLE TEST( ID VARCHAR2(4000) PRIMARY KEY );	
�̰� �������� �̸� �ּ���(Ȥ�� �� ���� ���� ������ ����)	
CREATE TABLE MEMBER( NO NUMBER(1), ID VARCHAR2(4000) DEFAULT '������' );	
�̷��� �κ� Į���� ���� �ְ�..	
����Ʈ �غ���..	
�� ����	1
	
CREATE TABLE MEMBER( ID VARCHAR2(4000) UNIQUE );	
INSERT INTO MEMBER VALUES('NYANG4');	
CREATE TABLE TEST( ID VARCHAR2(4000) REFERENCES MEMBER(ID) );	
INSERT INTO TEST VALUES('NYANG4');	
INSERT INTO TEST VALUES('NYANG6'); --����: ORA-02291: ���Ἲ ��������(SCOTT.SYS_C0011358)�� ����Ǿ����ϴ�- �θ� Ű�� �����ϴ�	

SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='���̺���';
ALTER TABLE TEST MODIFY NO NUMBER(36) NOT NULL;
ALTER TABLE TEST MODIFY NO NUMBER(36) UNIQUE;
ALTER TABLE TEST MODIFY NO NUMBER(36) PRIMARY KEY;
ALTER TABLE TEST MODIFY NO CONSTRAINT TEST_CR_CK CHECK(NO>0);
ALTER TABLE TEST MODIFY( NO CONSTRAINT TEST_CR_CK CHECK(NO>0) );
ALTER TABLE TEST MODIFY NO NUMBER(36) CONSTRAINT TEST_CR_CK CHECK(NO>0);
ALTER TABLE TEST MODIFY NO( NUMBER(36) CONSTRAINT TEST_CR_CK CHECK(NO>0) );
ALTER TABLE TEST MODIFY NO NUMBER(36) DEFAULT 0;
ALTER TABLE ������ MODIFY POSITION REFERENCES POSITION_TYPE(POSITION);
ALTER TABLE TEST MODIFY ID VARCHAR2(4000) NULL;
ALTER TABLE TEST DROP UNIQUE(ID);
ALTER TABLE TEST DROP PRIMARY KEY;
ALTER TABLE TEST DROP CONSTRAINT TEST_CR_CK;
ALTER TABLE TEST MODIFY NO NUMBER(36) DEFAULT NULL;
SELECT * FROM USER_CONSTRAINTS WHERE TABLE_NAME='�ش����̺���';
ALTER TABLE CT DROP CONSTRAINT SYS_C0011379;
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
SELECT t1.no,t2.id FROM T1,T2 WHERE T1.NO = T2.NO; -- �� �̸��� ��ġ�� ��� ���̺���.���̸� ���� ǥ���ؾ���.

CREATE TABLE T( TYPE CHAR(9), VAL CHAR(9) );
INSERT INTO T VALUES('������','��');
INSERT INTO T VALUES('������','������');
INSERT INTO T VALUES('������','�ʱ���');
INSERT INTO T VALUES('���','����');
INSERT INTO T VALUES('���','���');
SELECT * FROM T;
SELECT COUNT(*) FROM T;
SELECT COUNT(*) FROM T WHERE TYPE = '���';
SELECT COUNT(*) FROM T WHERE TYPE = '������';
SELECT COUNT(*) FROM T GROUP BY TYPE;
SELECT TYPE, COUNT(*) FROM T GROUP BY TYPE;

SELECT TYPE, COUNT(*) FROM T GROUP BY TYPE HAVING TYPE='������';
"CREATE TABLE T1( NO NUMBER(1), animal varchar2(20) );		"
"INSERT INTO T1 VALUES(1,'��');		"
INSERT INTO T1 VALUES(2,'������');                
CREATE TABLE T2( NO NUMBER(1) );
INSERT INTO T2 VALUES(1);
INSERT INTO T2 VALUES(2);
SELECT * FROM T1;
SELECT COUNT(*) FROM T2;
SELECT * FROM T1 WHERE NO = (SELECT COUNT(*) FROM T2);
SELECT * FROM T1 WHERE NO = 2;




SELECT * FROM T1 WHERE NO <= (SELECT COUNT(*) FROM T2);
SELECT * FROM T1 WHERE NO <= 2;
DROP TABLE T1;
DROP TABLE T2;

commit;