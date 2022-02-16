CREATE TABLE board (
       num int not null auto_increment, //게시글 번호
       id varchar(10) not null,	//회원아이디
       name varchar(10) not null, //회원이름
       subject varchar(100) not null, //게시글 제목
       content text not null, //게시글 내용
       regist_day varchar(30), //게시글 등록일자
       hit int, //게시글 조회수
       ip varchar(20), //게시글 등록 ip
       PRIMARY KEY (num)
)default CHARSET=utf8;

select * from board;
desc board;
drop table board;