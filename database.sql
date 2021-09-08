create database qlsp;
use qlsp;
create table category(
                         id int auto_increment primary key ,
                         name varchar(255)
);

insert into category(name) value ('phone');
insert into category( name) value ('computer');

create table product(
    id_pr int auto_increment primary key ,
    name_pr varchar(255),
    price int ,
    quantity int,
    color varchar(255),
    description varchar(255),
    category int,
    foreign key (category) references category(id)
);

select * from product join category on product.category = category.id;

insert into product(name_pr, price, quantity, color, description, category) VALUE (?,?,?,?,?,?);

delete from product where id_pr = ?;

update product set name_pr=?, price=?,quantity=?,color=?,description=?,category=? where id_pr=?;

select * from product join category on product.category = category.id where name_pr=?;