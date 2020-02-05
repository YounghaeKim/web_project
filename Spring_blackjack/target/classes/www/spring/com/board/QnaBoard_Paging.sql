select * FROM qna_board ORDER BY bno desc;

SELECT /*+INDEX_DESC (qna_board pk_qna_board) */
    *
FROM qna_board;

SELECT /*+FULL(qna_board) */
    *
FROM qna_board order by bno desc;

insert into qna_board (bno, title, content, writer)
(select seq_board.nextval, title, content, writer from qna_board);

SELECT
    *
FROM qna_board where bno > 0;

SELECT
    *
FROM qna_board where bno = 100;

SELECT /*+ INDEX_ASC(qna_board pk_qna_board) */
    *
FROM qna_board where bno > 0;

SELECT /*+ FULL(qna_board)*/
    ROWNUM rn, bno, title
FROM qna_board where bno > 0
ORDER BY bno;

SELECT /*+ INDEX_ASC(qna_board pk_qna_board) */
    ROWNUM rn, bno, title, content
FROM qna_board;

SELECT /*+ INDEX_DESC(qna_board pk_qna_board) */
    ROWNUM rn, bno, title, content
FROM qna_board
where bno > 0;

--한페이지당 10개의 데이터 출력
SELECT /*+ INDEX_DESC(qna_board pk_qna_board) */
    ROWNUM rn, bno, title, content
FROM qna_board
where rownum <= 10;

--ROWNUM은 반드시 1이 포함되도록 해야 한다.
SELECT /*+ INDEX_DESC(qna_board pk_qna_board) */
    ROWNUM rn, bno, title, content
FROM qna_board
where rownum <= 20;

--인라인뷰를 이용 인라인뷰의 내용 안에서 필요한 부분만 추출한다.
SELECT
    bno, title, content
FROM
    (
    SELECT /*+ INDEX_DESC(qna_board pk_qna_board) */
        ROWNUM rn, bno, title, content
    FROM qna_board
    where rownum <= 20
    )
where rn > 10;


--검색테스트
SELECT
    bno, title, content
FROM
    (
    SELECT /*+ INDEX_DESC(qna_board pk_qna_board) */
        ROWNUM rn, bno, title, content, writer, regdate, updatedate
    FROM qna_board
    where
    --변경부분
    (title like '%테스트%' or content like '%좋은%')
    
    and rownum <= 20
    )
where rn > 10;
