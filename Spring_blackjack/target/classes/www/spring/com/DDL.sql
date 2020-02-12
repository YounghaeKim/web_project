drop table CUSTOMER_AUTH cascade constraints;
drop table CUSTOMER_DETAILS cascade constraints;
drop table CUSTOMER;
drop sequence seq_customer;
create sequence seq_customer;

create table CUSTOMER (--고객
    ID                 VARCHAR2(20) primary key,
    PASSWORD           VARCHAR2(100) not null
);

create table CUSTOMER_AUTH (--고객의 권한
   ID        VARCHAR2(20) not null,
   AUTH      VARCHAR2(50) not null,
   constraint fk_customer_auth foreign key(ID) references CUSTOMER(ID)
);

create table CUSTOMER_DETAILS(--고객의 디테일 정보
    CUSTOMER_NUMBER      NUMBER(10) primary key,
    ID               VARCHAR2(20) not null,
    PHONE_NUMBER       VARCHAR2(100) not null,
    EMAIL              VARCHAR2(200) not null,
    NAME                 VARCHAR2(20) not null,
    GENDER             VARCHAR2(10) not null,
    profileImg         VARCHAR2(200),
    CURRENT_CASH         NUMBER(30) default 0,
    TOTAL_AMOUNT          NUMBER(30) default 0,
    WIN_RATE           NUMBER(3) default 0,
    REGISTRATION_DATE   date   default sysdate,
    constraint percent check(WIN_RATE between 0 and 100),
    constraint fk_customer_details foreign key(ID) references CUSTOMER(ID)
);

insert into CUSTOMER (ID, PASSWORD)--디폴트 아이디
values ('asdf', 'asdf');

insert into CUSTOMER_AUTH (ID, AUTH)--디폴트 아이디의 권한
values ('asdf', 'ROLE_MEMBER');

insert into CUSTOMER_DETAILS (CUSTOMER_NUMBER, ID, PHONE_NUMBER, EMAIL, NAME, GENDER, 
   CURRENT_CASH, TOTAL_AMOUNT, WIN_RATE)--디폴트 아이디의 상세 정보
values (seq_board.nextval, 'asdf', 'asdf', 'asdf', 'asdf', 'male', '100', '1000', '0');