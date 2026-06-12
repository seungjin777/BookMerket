CREATE TABLE board (
       num int not null auto_increment,
       id varchar(10) not null,
       name varchar(10) not null,
       subject varchar(100) not null,
       content text not null,
       regist_day varchar(30),
       hit int,
       ip varchar(20),
       passwd varchar(10) not null,
       
       PRIMARY KEY (num)
)default CHARSET=utf8;




DROP TABLE IF EXISTS board;

CREATE TABLE board (
    num int not null auto_increment,
    id varchar(10) not null,
    name varchar(10) not null,
    subject varchar(100) not null,
    content text not null,
    regist_day varchar(30),
    hit int default 0,
    ip varchar(20),
    passwd varchar(10) not null,
    re_ref int default 0,
    re_lev int default 0,
    re_seq int default 0,
    PRIMARY KEY (num)
) default CHARSET=utf8;




select * from board;
