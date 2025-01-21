CREATE TABLE user_info
(
    user_no      NUMBER(3) PRIMARY KEY,
    user_id      VARCHAR2(30 CHAR) NOT NULL,
    user_pw      VARCHAR2(30 CHAR) NOT NULL,
    user_name    VARCHAR2(20 CHAR) NOT NULL,
    user_profile VARCHAR2(200 CHAR)
);

create sequence user_info_seq;

INSERT INTO user_info
VALUES (user_info_seq.NEXTVAL, 'gkgus234', 'qwer1234', '김하현', NULL);

select * from user_info;