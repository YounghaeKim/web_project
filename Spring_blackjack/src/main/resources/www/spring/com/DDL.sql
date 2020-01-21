drop table CUSTOMER;
drop sequence seq_customer;

drop table tbl_board;
drop sequence seq_board;

create sequence seq_board;

create sequence seq_customer;

create table CUSTOMER (
   CUSTOMER_NUMBER      NUMBER(10) primary key,
    ID                 VARCHAR2(20) not null,
    PASSWORD           VARCHAR2(20) not null,
    PHONE_NUMBER       VARCHAR2(100) not null,
    EMAIL              VARCHAR2(200) not null,
    NAME                 VARCHAR2(20) not null,
    GENDER             VARCHAR2(10) not null,
    profileImg         VARCHAR2(200),
    CURRENT_CASH         NUMBER(30) default 0,
    TOTAL_AMOUNT          NUMBER(30) default 0,
    WIN_RATE           NUMBER(3) default 0,
    REGISTRATION_DATE   date   default sysdate,
    CONSTRAINT percent check(WIN_RATE between 0 and 100)
);

insert into CUSTOMER (CUSTOMER_NUMBER, ID, PASSWORD, PHONE_NUMBER, EMAIL, NAME, GENDER, 
   CURRENT_CASH, TOTAL_AMOUNT, WIN_RATE)
values (seq_board.nextval, 'newID', 'newPassword','newPoneNum', 'newEmail', 'newName', 'male', '100', '1000', '0');


create table CUSTOMER_AUTH (
   CUSTOMER_NUMBER      NUMBER(10) not null,
   AUTH      varchar2(50) not null,
   constraint fk_customer_auth foreign key(CUSTOMER_NUMBER) references CUSTOMER(CUSTOMER_NUMBER)
);
