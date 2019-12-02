drop table CUSTOMER;
drop sequence seq_customer;

create sequence seq_customer;
create table CUSTOMER (
	CUSTOMER_NUMBER		NUMBER(10) primary key,
    ID              VARCHAR2(20) not null,
    PASSWORD        VARCHAR2(20) not null,
    PHONE_NUMBER    VARCHAR2(100) not null,
    EMAIL           VARCHAR2(200) not null,
    NAME            VARCHAR2(20) not null,
    GENDER          VARCHAR2(4) not null,
    CURRENT_CASH    NUMBER(30) default 0,
    TOTAL_CASH      NUMBER(30) default 0,
    WIN_RATE        NUMBER(3) default 0,
    REGIST_DATE		date	default sysdate,
    CONSTRAINT percent check(WIN_RATE between 0 and 100)
);

insert into CUSTOMER (CUSTOMER_NUMBER, ID, PASSWORD, PHONE_NUMBER, EMAIL, NAME, GENDER, 
	CURRENT_CASH, TOTAL_CASH, WIN_RATE)
values (seq_board.nextval, 'newID', 'newPassword','newPoneNum', 'newEmail', 'newName', 'male', '100', '1000', '0');
