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
    
    
###
ALTER TABLE USERS
    MODIFY COLUMN SEQ INT NOT NULL AUTO_INCREMENT COMMENT '회원번호';








-- 공원 좋아요
DROP TABLE IF EXISTS HEARTS RESTRICT;

-- 게시판
DROP TABLE IF EXISTS BOARD RESTRICT;

-- 댓글
DROP TABLE IF EXISTS COMMENT RESTRICT;

-- 회원정보
DROP TABLE IF EXISTS MEMBER RESTRICT;

-- 회원
DROP TABLE IF EXISTS USERS RESTRICT;

-- 권한
DROP TABLE IF EXISTS AUTHORITIES RESTRICT;

-- 공원 좋아요
CREATE TABLE HEARTS (
    H_NO      INT         NOT NULL COMMENT '번호', -- 번호
    park_num  INT         NOT NULL COMMENT '공원번호', -- 공원번호
    park_name VARCHAR(20) NOT NULL COMMENT '공원이름', -- 공원이름
    SEQ       INT         NULL     COMMENT '회원번호', -- 회원번호
    NAME      VARCHAR(10) NULL     COMMENT '닉네임' -- 닉네임
)
COMMENT '공원 좋아요';

-- 공원 좋아요
ALTER TABLE HEARTS
    ADD CONSTRAINT PK_HEARTS -- 공원 좋아요 기본키
        PRIMARY KEY (
            H_NO -- 번호
        );

ALTER TABLE HEARTS
    MODIFY COLUMN H_NO INT NOT NULL AUTO_INCREMENT COMMENT '번호';

-- 게시판
CREATE TABLE BOARD (
    b_no      INT         NOT NULL COMMENT '글번호', -- 글번호
    b_title   VARCHAR(20) NOT NULL COMMENT '제목', -- 제목
    b_content VARCHAR(50) NOT NULL COMMENT '내용', -- 내용
    b_view    INT         NOT NULL DEFAULT 0 COMMENT '조회수', -- 조회수
    b_up      INT         NOT NULL DEFAULT 0 COMMENT '추천', -- 추천
    b_regdate DATETIME    NOT NULL COMMENT '작성일자' -- 작성일자
)
COMMENT '게시판';

-- 게시판
ALTER TABLE BOARD
    ADD CONSTRAINT PK_BOARD -- 게시판 기본키
        PRIMARY KEY (
            b_no -- 글번호
        );

ALTER TABLE BOARD
    MODIFY COLUMN b_no INT NOT NULL AUTO_INCREMENT COMMENT '글번호';

-- 댓글
CREATE TABLE COMMENT (
    c_no      INT         NOT NULL COMMENT '댓글 번호', -- 댓글 번호
    c_content VARCHAR(20) NOT NULL COMMENT '댓글 내용', -- 댓글 내용
    c_regdate DATETIME    NOT NULL COMMENT '댓글 작성일', -- 댓글 작성일
    b_no      INT         NOT NULL COMMENT '글번호' -- 글번호
)
COMMENT '댓글';

-- 댓글
ALTER TABLE COMMENT
    ADD CONSTRAINT PK_COMMENT -- 댓글 기본키
        PRIMARY KEY (
            c_no -- 댓글 번호
        );

ALTER TABLE COMMENT
    MODIFY COLUMN c_no INT NOT NULL AUTO_INCREMENT COMMENT '댓글 번호';

-- 회원정보
CREATE TABLE MEMBER (
    SEQ  INT         NOT NULL COMMENT '회원번호', -- 회원번호
    NAME VARCHAR(10) NOT NULL COMMENT '닉네임' -- 닉네임
)
COMMENT '회원정보';

-- 회원정보
ALTER TABLE MEMBER
    ADD CONSTRAINT PK_MEMBER -- 회원정보 기본키
        PRIMARY KEY (
            SEQ,  -- 회원번호
            NAME  -- 닉네임
        );

-- 회원
CREATE TABLE USERS (
    SEQ      INT          NOT NULL COMMENT '회원번호', -- 회원번호
    ID       VARCHAR(30)  NULL     COMMENT '아이디', -- 아이디
    PASSWORD VARCHAR(100) NULL     COMMENT '비밀번호', -- 비밀번호
    ENABLED  INT(10)      NULL     COMMENT '사용여부' -- 사용여부
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

-- 공원 좋아요
ALTER TABLE HEARTS
    ADD CONSTRAINT FK_MEMBER_TO_HEARTS -- 회원정보 -> 공원 좋아요
        FOREIGN KEY (
            SEQ,  -- 회원번호
            NAME  -- 닉네임
        )
        REFERENCES MEMBER ( -- 회원정보
            SEQ,  -- 회원번호
            NAME  -- 닉네임
        );

-- 댓글
ALTER TABLE COMMENT
    ADD CONSTRAINT FK_BOARD_TO_COMMENT -- 게시판 -> 댓글
        FOREIGN KEY (
            b_no -- 글번호
        )
        REFERENCES BOARD ( -- 게시판
            b_no -- 글번호
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

-- 권한
ALTER TABLE AUTHORITIES
    ADD CONSTRAINT FK_USERS_TO_AUTHORITIES -- 회원 -> 권한
        FOREIGN KEY (
            SEQ -- 회원번호
        )
        REFERENCES USERS ( -- 회원
            SEQ -- 회원번호
        );