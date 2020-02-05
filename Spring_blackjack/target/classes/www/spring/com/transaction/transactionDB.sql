--트랜잭션 테스트를 위한 임시 테이블 생성

drop table qna_sample1;
drop table qna_sample2;


create table qna_sample1(col1 varchar2(500));

create table qna_sample2(col2 varchar2(50));


DELETE qna_sample1;

DELETE qna_sample2;

commit;