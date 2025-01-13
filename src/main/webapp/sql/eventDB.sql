create table product_test
(
    p_no       number(4) primary key,
    p_name     varchar2(20 char) not null,
    p_price    number(5)         not null,
    p_category varchar2(20 char) not null,
    image_url  varchar2(255)


);

create sequence product_test_seq;

insert into product_test
values (product_test_seq.nextval, '초코바', 3000, '과자',
        'https://m.kakamuka.com/web/product/medium/202305/c8ddc62cb8f7b9a02c0b37b07524da5a.jpg', 0);
insert into product_test
values (product_test_seq.nextval, '양파링', 1500, '과자',
        'https://i.namu.wiki/i/vCEbaVou2eQcd7_GFviBpnwhAfOamD66Wd95jyJLd2d7L6xyuvLfnpzv7_Oh5tAjfBWs7ZXouav87ERJd04TrA.gif',
        0);
insert into product_test
values (product_test_seq.nextval, '자가리코', 2500, '과자',
        'https://m.ojapan.co.kr/web/product/extra/big/20230708/39081e5232b6af36d312b94a1c7eed4e.jpg', 0);

select *
from product_test;

delete product_test
where p_no = 6;