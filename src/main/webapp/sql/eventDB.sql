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




