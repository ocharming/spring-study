-- 게시판형식
DROP TABLE IF EXISTS BOARD_TYPE RESTRICT;

-- 게시판리스트
DROP TABLE IF EXISTS BOARD_LIST RESTRICT;

-- 카테고리
DROP TABLE IF EXISTS CATEGORY RESTRICT;

-- 게시판
DROP TABLE IF EXISTS BOARD RESTRICT;

-- 답변형게시판
DROP TABLE IF EXISTS REBOARD RESTRICT;

-- 사진게시판
DROP TABLE IF EXISTS ALBUM RESTRICT;

-- 메모글
DROP TABLE IF EXISTS MEMO RESTRICT;

-- 자료실
DROP TABLE IF EXISTS BBS RESTRICT;

-- 회원
DROP TABLE IF EXISTS USERS RESTRICT;

-- 권한
DROP TABLE IF EXISTS AUTHORITIES RESTRICT;

-- 회원정보
DROP TABLE IF EXISTS MEMBER RESTRICT;

-- 게시판형식
CREATE TABLE BOARD_TYPE (
    BTYPE      INT          NOT NULL COMMENT '게시판형식번호', -- 게시판형식번호
    BTYPE_NAME VARCHAR(100) NULL     COMMENT '게시판형식이름' -- 게시판형식이름
)
COMMENT '게시판형식';

-- 게시판형식
ALTER TABLE BOARD_TYPE
    ADD CONSTRAINT PK_BOARD_TYPE -- 게시판형식 기본키
        PRIMARY KEY (
            BTYPE -- 게시판형식번호
        );

ALTER TABLE BOARD_TYPE
    MODIFY COLUMN BTYPE INT NOT NULL AUTO_INCREMENT COMMENT '게시판형식번호';

ALTER TABLE BOARD_TYPE
    AUTO_INCREMENT = 1;

-- 게시판리스트
CREATE TABLE BOARD_LIST (
    BCODE INT          NOT NULL COMMENT '게시판번호', -- 게시판번호
    BNAME VARCHAR(100) NULL     COMMENT '게시판이름', -- 게시판이름
    BTYPE INT          NULL     COMMENT '게시판형식번호', -- 게시판형식번호
    CCODE INT          NULL     COMMENT '카테고리번호' -- 카테고리번호
)
COMMENT '게시판리스트';

-- 게시판리스트
ALTER TABLE BOARD_LIST
    ADD CONSTRAINT PK_BOARD_LIST -- 게시판리스트 기본키
        PRIMARY KEY (
            BCODE -- 게시판번호
        );

ALTER TABLE BOARD_LIST
    MODIFY COLUMN BCODE INT NOT NULL AUTO_INCREMENT COMMENT '게시판번호';

ALTER TABLE BOARD_LIST
    AUTO_INCREMENT = 1;

-- 카테고리
CREATE TABLE CATEGORY (
    CCODE INT          NOT NULL COMMENT '카테고리번호', -- 카테고리번호
    CNAME VARCHAR(100) NULL     COMMENT '카테고리이름' -- 카테고리이름
)
COMMENT '카테고리';

-- 카테고리
ALTER TABLE CATEGORY
    ADD CONSTRAINT PK_CATEGORY -- 카테고리 기본키
        PRIMARY KEY (
            CCODE -- 카테고리번호
        );

ALTER TABLE CATEGORY
    MODIFY COLUMN CCODE INT NOT NULL AUTO_INCREMENT COMMENT '카테고리번호';

ALTER TABLE CATEGORY
    AUTO_INCREMENT = 1;

-- 게시판
CREATE TABLE BOARD (
    SEQ     INT          NOT NULL COMMENT '글번호', -- 글번호
    NAME    VARCHAR(10)  NULL     COMMENT '작성자이름', -- 작성자이름
    ID      VARCHAR(16)  NULL     COMMENT '작성자아이디', -- 작성자아이디
    EMAIL   VARCHAR(50)  NULL     COMMENT '작성자이메일', -- 작성자이메일
    SUBJECT VARCHAR(100) NULL     COMMENT '제목', -- 제목
    CONTENT LONGTEXT     NULL     COMMENT '내용', -- 내용
    HIT     INT          NULL     COMMENT '조회수', -- 조회수
    LOGTIME DATETIME     NULL     COMMENT '작성일자', -- 작성일자
    BCODE   INT          NULL     COMMENT '게시판번호' -- 게시판번호
)
COMMENT '게시판';

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT PK_BOARD -- 게시판 기본키
        PRIMARY KEY (
            SEQ -- 글번호
        );

ALTER TABLE BOARD
    MODIFY COLUMN SEQ INT NOT NULL AUTO_INCREMENT COMMENT '글번호';

ALTER TABLE BOARD
    AUTO_INCREMENT = 1;

-- 답변형게시판
CREATE TABLE REBOARD (
    RSEQ  INT NOT NULL COMMENT '답변형게시판번호', -- 답변형게시판번호
    SEQ   INT NULL     COMMENT '글번호', -- 글번호
    REF   INT NULL     COMMENT '그룹번호', -- 그룹번호
    LEV   INT NULL     COMMENT '들여쓰기', -- 들여쓰기
    STEP  INT NULL     COMMENT '답변정렬', -- 답변정렬
    PSEQ  INT NULL     COMMENT '원글번호', -- 원글번호
    REPLY INT NULL     COMMENT '답변갯수' -- 답변갯수
)
COMMENT '답변형게시판';

-- 답변형게시판
ALTER TABLE REBOARD
    ADD CONSTRAINT PK_REBOARD -- 답변형게시판 기본키
        PRIMARY KEY (
            RSEQ -- 답변형게시판번호
        );

ALTER TABLE REBOARD
    MODIFY COLUMN RSEQ INT NOT NULL AUTO_INCREMENT COMMENT '답변형게시판번호';

ALTER TABLE REBOARD
    AUTO_INCREMENT = 1;

-- 사진게시판
CREATE TABLE ALBUM (
    ASEQ          INT          NOT NULL COMMENT '사진게시판번호', -- 사진게시판번호
    SEQ           INT          NULL     COMMENT '글번호', -- 글번호
    ORIGN_PICTURE VARCHAR(100) NULL     COMMENT '원본사진이름', -- 원본사진이름
    SAVE_PICTURE  VARCHAR(100) NULL     COMMENT '저장사진이름', -- 저장사진이름
    SAVEFOLDER    VARCHAR(30)  NULL     COMMENT '저장폴더', -- 저장폴더
    TYPE          INT(1)       NULL     COMMENT '사진타입' -- 사진타입
)
COMMENT '사진게시판';

-- 사진게시판
ALTER TABLE ALBUM
    ADD CONSTRAINT PK_ALBUM -- 사진게시판 기본키
        PRIMARY KEY (
            ASEQ -- 사진게시판번호
        );

ALTER TABLE ALBUM
    MODIFY COLUMN ASEQ INT NOT NULL AUTO_INCREMENT COMMENT '사진게시판번호';

ALTER TABLE ALBUM
    AUTO_INCREMENT = 1;

-- 메모글
CREATE TABLE MEMO (
    MSEQ     INT          NOT NULL COMMENT '메모글번호', -- 메모글번호
    SEQ      INT          NULL     COMMENT '글번호', -- 글번호
    ID       VARCHAR(16)  NULL     COMMENT '작성자아이디', -- 작성자아이디
    NAME     VARCHAR(10)  NULL     COMMENT '작성자이름', -- 작성자이름
    MCONTENT VARCHAR(500) NULL     COMMENT '메모내용', -- 메모내용
    MTIME    DATETIME     NULL     COMMENT '메모작성일' -- 메모작성일
)
COMMENT '메모글';

-- 메모글
ALTER TABLE MEMO
    ADD CONSTRAINT PK_MEMO -- 메모글 기본키
        PRIMARY KEY (
            MSEQ -- 메모글번호
        );

ALTER TABLE MEMO
    MODIFY COLUMN MSEQ INT NOT NULL AUTO_INCREMENT COMMENT '메모글번호';

ALTER TABLE MEMO
    AUTO_INCREMENT = 1;

-- 자료실
CREATE TABLE BBS (
    BSEQ       INT          NOT NULL COMMENT '자료실게시판번호', -- 자료실게시판번호
    SEQ        INT          NULL     COMMENT '글번호', -- 글번호
    ORIGN_FILE VARCHAR(100) NULL     COMMENT '원본파일이름', -- 원본파일이름
    SAVE_FILE  VARCHAR(100) NULL     COMMENT '저장파일이름', -- 저장파일이름
    FILESIZE   INT          NULL     COMMENT '파일크기', -- 파일크기
    SAVEFOLDER VARCHAR(30)  NULL     COMMENT '저장폴더' -- 저장폴더
)
COMMENT '자료실';

-- 자료실
ALTER TABLE BBS
    ADD CONSTRAINT PK_BBS -- 자료실 기본키
        PRIMARY KEY (
            BSEQ -- 자료실게시판번호
        );

ALTER TABLE BBS
    MODIFY COLUMN BSEQ INT NOT NULL AUTO_INCREMENT COMMENT '자료실게시판번호';

ALTER TABLE BBS
    AUTO_INCREMENT = 1;

-- 회원
CREATE TABLE USERS (
    SEQ      INT         NOT NULL COMMENT '회원번호', -- 회원번호
    ID       VARCHAR(30) NOT NULL COMMENT '아이디', -- 아이디
    PASSWORD VARCHAR(100) NULL     COMMENT '비밀번호', -- 비밀번호
    ENABLED  INT(10)     NULL     COMMENT '사용여부' -- 사용여부
)
COMMENT '회원';

-- 회원
ALTER TABLE USERS
    ADD CONSTRAINT PK_USERS -- 회원 기본키
        PRIMARY KEY (
            SEQ -- 회원번호
        );

ALTER TABLE USERS
    MODIFY COLUMN SEQ INT NOT NULL AUTO_INCREMENT COMMENT '회원번호';

-- 권한
CREATE TABLE AUTHORITIES (
    SEQ       INT         NOT NULL COMMENT '회원번호', -- 회원번호
    AUTHORITY VARCHAR(30) NOT NULL COMMENT '권한' -- 권한
)
COMMENT '권한';

-- 권한
ALTER TABLE AUTHORITIES
    ADD CONSTRAINT PK_AUTHORITIES -- 권한 기본키
        PRIMARY KEY (
            SEQ,       -- 회원번호
            AUTHORITY  -- 권한
        );

-- 회원정보
CREATE TABLE MEMBER (
    SEQ      INT         NOT NULL COMMENT '회원번호', -- 회원번호
    NAME     VARCHAR(10) NULL     COMMENT '이름', -- 이름
    EMAIL    VARCHAR(50) NULL     COMMENT '이메일', -- 이메일
    BIRTH    CHAR(10)    NULL     COMMENT '생일', -- 생일
    GENDER   INT(1)      NULL     COMMENT '성별', -- 성별
    PHONE    VARCHAR(13) NULL     COMMENT '전화번호', -- 전화번호
    ADDRCODE VARCHAR(7)  NULL     COMMENT '우편번호', -- 우편번호
    ADDR     LONGTEXT    NULL     COMMENT '주소', -- 주소
    ADDR2    LONGTEXT    NULL     COMMENT '상세주소' -- 상세주소
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE MEMBER
    ADD CONSTRAINT PK_MEMBER -- 회원정보 기본키
        PRIMARY KEY (
            SEQ -- 회원번호
        );

-- 게시판리스트
ALTER TABLE BOARD_LIST
    ADD CONSTRAINT FK_BOARD_TYPE_TO_BOARD_LIST -- 게시판형식 -> 게시판리스트
        FOREIGN KEY (
            BTYPE -- 게시판형식번호
        )
        REFERENCES BOARD_TYPE ( -- 게시판형식
            BTYPE -- 게시판형식번호
        );

-- 게시판리스트
ALTER TABLE BOARD_LIST
    ADD CONSTRAINT FK_CATEGORY_TO_BOARD_LIST -- 카테고리 -> 게시판리스트
        FOREIGN KEY (
            CCODE -- 카테고리번호
        )
        REFERENCES CATEGORY ( -- 카테고리
            CCODE -- 카테고리번호
        );

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT FK_BOARD_LIST_TO_BOARD -- 게시판리스트 -> 게시판
        FOREIGN KEY (
            BCODE -- 게시판번호
        )
        REFERENCES BOARD_LIST ( -- 게시판리스트
            BCODE -- 게시판번호
        );

-- 답변형게시판
ALTER TABLE REBOARD
    ADD CONSTRAINT FK_BOARD_TO_REBOARD -- 게시판 -> 답변형게시판
        FOREIGN KEY (
            SEQ -- 글번호
        )
        REFERENCES BOARD ( -- 게시판
            SEQ -- 글번호
        );

-- 사진게시판
ALTER TABLE ALBUM
    ADD CONSTRAINT FK_BOARD_TO_ALBUM -- 게시판 -> 사진게시판
        FOREIGN KEY (
            SEQ -- 글번호
        )
        REFERENCES BOARD ( -- 게시판
            SEQ -- 글번호
        );

-- 메모글
ALTER TABLE MEMO
    ADD CONSTRAINT FK_BOARD_TO_MEMO -- 게시판 -> 메모글
        FOREIGN KEY (
            SEQ -- 글번호
        )
        REFERENCES BOARD ( -- 게시판
            SEQ -- 글번호
        );

-- 자료실
ALTER TABLE BBS
    ADD CONSTRAINT FK_BOARD_TO_BBS -- 게시판 -> 자료실
        FOREIGN KEY (
            SEQ -- 글번호
        )
        REFERENCES BOARD ( -- 게시판
            SEQ -- 글번호
        );

-- 권한
ALTER TABLE AUTHORITIES
    ADD CONSTRAINT FK_USERS_TO_AUTHORITIES -- 회원 -> 권한
        FOREIGN KEY (
            SEQ -- 회원번호
        )
        REFERENCES USERS ( -- 회원
            SEQ -- 회원번호
        );

-- 회원정보
ALTER TABLE MEMBER
    ADD CONSTRAINT FK_USERS_TO_MEMBER -- 회원 -> 회원정보
        FOREIGN KEY (
            SEQ -- 회원번호
        )
        REFERENCES USERS ( -- 회원
            SEQ -- 회원번호
        );
        
INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('공지사항');

INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('방명록');

INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('한줄게시판');

INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('일반게시판');

INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('답변게시판');

INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('앨범게시판');

INSERT INTO BOARD_TYPE (BTYPE_NAME)
VALUES ('자료실');

COMMIT;


INSERT INTO CATEGORY (CNAME)
VALUES('갤럭시S9');

INSERT INTO CATEGORY (CNAME)
VALUES('갤럭시노트9');

INSERT INTO CATEGORY (CNAME)
VALUES('아이폰XS'); 

COMMIT;


INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시S9 공지사항', 1, 1);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시S9 일반게시판', 4, 1);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시S9 묻고답하기', 5, 1);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시S9 자랑하기', 6, 1);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시S9 자료실', 7, 1);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시노트9 공지사항', 1, 2);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시노트9 한줄메모', 3, 2);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시노트9 일반게시판', 4, 2);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시노트9 답변게시판', 5, 2);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시노트9 사진자랑', 6, 2);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('갤럭시노트9 자료공유', 7, 2);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('아이폰XS 한줄메모', 3, 3);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('아이폰XS QNA', 5, 3);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('아이폰XS 폰인증', 6, 3);

INSERT INTO BOARD_LIST (BNAME, BTYPE, CCODE)
VALUES ('아이폰XS 앱공유', 7, 3);

COMMIT;
