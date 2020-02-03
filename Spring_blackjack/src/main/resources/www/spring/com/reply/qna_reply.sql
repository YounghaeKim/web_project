drop INDEX index_reply;
drop SEQUENCE seq_qna_reply;
DROP TABLE qna_reply;


CREATE TABLE qna_reply (
    rno         number(10, 0), 
    bno         number(10, 0) not null,
    reply       varchar2(1000) not null,
    replyer     varchar2(50) not null,
    replyDate	date	default sysdate,
    updateDate	date	default sysdate
);

create sequence seq_qna_reply;

alter table qna_reply add CONSTRAINT pk_qna_reply primary key (rno);

alter TABLE qna_reply add CONSTRAINT fk_reply_qna_board
FOREIGN key (bno) REFERENCES qna_board (bno);

--2020-02-03 새로 추가됨 인덱스를 생성한다.
create INDEX index_reply on QNA_REPLY (bno desc, rno asc);


--여기 밑으로는 테스트용이니 실행하지 말것
insert into qna_reply (rno, bno, reply, replyer)
(select seq_board.nextval, bno, reply, replyer from qna_reply);
--반복데이터 만들기

SELECT
    *
FROM qna_board where rownum < 10 ORDER BY bno desc;

SELECT
    *
FROM qna_reply ORDER BY rno desc;

--index생성 테스트
SELECT /*+INDEX(qna_reply index_reply)*/
    rownum rn, bno, rno, reply, replyer, replyDate,updatedate
FROM qna_reply
where bno = 11141169--(게시물번호)
and rno > 0;


SELECT rno, bno, reply, replyer, replydate, updatedate
from
    (
    SELECT /*+INDEX(qna_reply index_reply)*/
    rownum rn, bno, rno, reply, replyer, replyDate, updatedate
    FROM qna_reply
    where bno = 11141169--(게시물번호)
    and rno > 0
    and rownum <=20
    )where rn > 10;

--여기까지 가운데는 테스트 용이니 디비 실행하지 말것