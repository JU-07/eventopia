create table product_test(
    p_no number(4) primary key,
p_name varchar2(20 char) not null ,
    p_price number(5) not null ,
p_category varchar2(20 char) not null,
image_url varchar2(255)

);

create sequence product_test_seq;

insert into product_test values (product_test_seq.nextval,'초코바',3000,)

