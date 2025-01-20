create table product_test(
    p_no number(4) primary key,
p_name varchar2(20 char) not null ,
    p_price number(5) not null ,
p_category varchar2(20 char) not null,
image_url varchar2(255)

);

alter table product_test add  p_count number(5) not null ;

create sequence product_test_seq;

insert into product_test values (product_test_seq.nextval,'초코바',3000,'과자','https://m.kakamuka.com/web/product/medium/202305/c8ddc62cb8f7b9a02c0b37b07524da5a.jpg',0);
insert into product_test values (product_test_seq.nextval,'양파링',1500,'과자','https://i.namu.wiki/i/vCEbaVou2eQcd7_GFviBpnwhAfOamD66Wd95jyJLd2d7L6xyuvLfnpzv7_Oh5tAjfBWs7ZXouav87ERJd04TrA.gif',0);
insert into product_test values (product_test_seq.nextval,'자가리코',2500,'과자','https://m.ojapan.co.kr/web/product/extra/big/20230708/39081e5232b6af36d312b94a1c7eed4e.jpg',0);

select * from product_test;

create table post_test(
                           p_no number(3) primary key,
                           p_title varchar2(30 char) not null,
                           p_actor varchar2(30 char) not null,
                           p_img varchar2(400 char) not null,
                           p_story varchar2(5000 char)not null,
                           p_date date not null
);
alter table post_test modify p_img varchar2(400);
alter table post_test modify p_actor varchar2(500 char);

create sequence post_test_seq;
insert into post_test values (post_test_seq.nextval,'제목1','~와의 콜라보','https://mblogthumb-phinf.pstatic.net/MjAyMTA1MTFfNjMg/MDAxNjIwNzEzODM3ODcz.jOj9ZysGMuhxRxycIBMsInB5fqKdOyMEa1DMiLwkDuEg.vKI42FzscRSTq01KwN5LPMB5UILU3gsKqV0Ry7VMFysg.JPEG.bluenight457/%EA%B7%80%EB%A9%B8%EC%9D%98_%EC%B9%BC%EB%82%A0_x_%EB%A1%9C%EC%86%90_%EC%BA%A0%ED%8E%98%EC%9D%B8.jpg?type=w420','ㄴㄴ',sysdate);
insert into post_test values (post_test_seq.nextval,'제목2','~와의 콜라보','https://mblogthumb-phinf.pstatic.net/MjAyMTA1MTFfNjMg/MDAxNjIwNzEzODM3ODcz.jOj9ZysGMuhxRxycIBMsInB5fqKdOyMEa1DMiLwkDuEg.vKI42FzscRSTq01KwN5LPMB5UILU3gsKqV0Ry7VMFysg.JPEG.bluenight457/%EA%B7%80%EB%A9%B8%EC%9D%98_%EC%B9%BC%EB%82%A0_x_%EB%A1%9C%EC%86%90_%EC%BA%A0%ED%8E%98%EC%9D%B8.jpg?type=w420','ㄴㄴ',sysdate);
insert into post_test values (post_test_seq.nextval,'제목3','~와의 콜라보','https://mblogthumb-phinf.pstatic.net/MjAyMTA1MTFfNjMg/MDAxNjIwNzEzODM3ODcz.jOj9ZysGMuhxRxycIBMsInB5fqKdOyMEa1DMiLwkDuEg.vKI42FzscRSTq01KwN5LPMB5UILU3gsKqV0Ry7VMFysg.JPEG.bluenight457/%EA%B7%80%EB%A9%B8%EC%9D%98_%EC%B9%BC%EB%82%A0_x_%EB%A1%9C%EC%86%90_%EC%BA%A0%ED%8E%98%EC%9D%B8.jpg?type=w420','ㄴㄴ',sysdate);
select * from post_test;

delete from post_test where p_no=7;

create table event_test(
    e_no number(3) primary key ,
    e_name varchar2(300 char) not null ,
    e_title varchar2(300 char) not not null,
    e_image_url varchar2(500 char) not null,
    e_short_story varchar2(300 char) not null,
    e_story varchar2(5000 char) not null,
    e_date date not null,
    e_good number(5) NOT NULL
);

alter table event_test modify e_title varchar(300);
alter table event_test modify e_story varchar(300);

create sequence event_test_seq;

insert into event_test values(event_test_seq.nextval,'1','2','3','4','5',sysdate,'6');

create table review_test(
  r_no number(3) primary key,
  r_name varchar2(20 char) not null,
  r_title varchar2(50 char) not null,
  r_img varchar2(500 char) not null,
  r_sub varchar2(20 char) not null,
  r_text varchar2(20 char) not null,
  r_date date not null
);
ALTER TABLE review_test MODIFY  r_text VARCHAR2(200);
ALTER TABLE review_test MODIFY  r_sub varchar2(200);
alter table review_test modify  r_img varchar2(1000);
ALTER TABLE review_test MODIFY r_sub VARCHAR2(200);
ALTER TABLE review_test MODIFY r_text VARCHAR2(200);

create sequence review_test_seq;

insert into review_test values(review_test_seq.nextval,'세븐일레븐','mr.greenapple','https://www.lawson.co.jp/lab/campaign/mrsgreenapple/img/main_keyvisual01.png','mr.greenapple과의 콜라보','로손과 mr.greenapple콜라보',sysdate);

select * from review_test;

drop table review_test cascade constraint purge;
DROP SEQUENCE review_test_seq CASCADE CONSTRAINTS PURGE;

CREATE SEQUENCE review_test_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

create table event_test(


                 );


