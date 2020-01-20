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

--테스트

SELECT
    *
FROM qna_board where rownum < 10 ORDER BY bno desc;
