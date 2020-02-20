CREATE TABLE qna_attach (
    uuid VARCHAR2(100) not null,
    uploadPath VARCHAR2(200) not null,
    fileName VARCHAR2(100) not null,
    fileType char(1) DEFAULT 'I',
    bno number(10,0)
);

ALTER TABLE qna_attach add CONSTRAINT pk_attach PRIMARY KEY (uuid);

ALTER TABLE qna_attach add CONSTRAINT fk_board_attach FOREIGN key (bno)
REFERENCES qna_board(bno);