create table tbl_user(
userId varchar(200) primary key,
userPw varchar(200),
userStudentNum bigint,
userEmail varchar(200),
userPhoneNum varchar(200),
checkAdmin bigint
);
insert into tbl_user (userId,userPw) values ('test','test');
drop table tbl_user;
select * from tbl_user;
select count(*) from tbl_user where userId='test' and userPw='test';

create table tbl_mentorBoard(
   bno bigint not null auto_increment primary key,
    userId varchar(200),
    userStudentNum bigint,
    menteeCount bigint,
    department varchar(200),
   subjectName varchar(200),
    startDate DATETIME,
    endDate DATETIME,
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    hopeDay varchar(200),
    introduce varchar(1000),
    menteeStudentNum bigint
);

drop table tbl_mentorBoard;
select * from tbl_mentorBoard;

ALTER TABLE tbl_mentorBoard ADD CONSTRAINT FK_userIdMentor FOREIGN KEY (userId) REFERENCES tbl_user(userId);
ALTER TABLE tbl_menteeBoard ADD CONSTRAINT FK_userIdMentee FOREIGN KEY (userId) REFERENCES tbl_user(userId);

/*더미데이터*/
insert into tbl_mentorBoard(bno,subjectName,menteeCount,startDate,endDate) values (1, '자바', '3',sysdate(),'2020-05-05');
insert into tbl_mentorBoard(bno,subjectName,menteeCount,startDate,endDate) values (2, '알고리즘', '4',sysdate(),'2020-05-05');

create table tbl_menteeBoard(
   bno bigint not null auto_increment primary key,
    userId varchar(200),
    userStudentNum bigint,
	mentorWho varchar(200),
    department varchar(200),
   subjectName varchar(200),
    startDate DATETIME,
    endDate DATETIME,
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    hopeDay varchar(200),
    introduce varchar(1000)
);

select * from tbl_menteeBoard;

drop  table tbl_menteeBoard;
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (2, 201632015,'알고리즘', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (1, 201632016,'알고리즘', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (3, 201632077,'알고리즘', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (4, 201632066,'알고리즘', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (5, 201632055,'알고리즘', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (6, 201632020,'알고리즘', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');
insert into tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate,introduce) values (7, 201632018,'자바', '육정근',sysdate(),'2022-05-05','안녕하세요 육정근입니다 열심히 하겠습니다');

-- 더미데이터
INSERT INTO tbl_menteeBoard(bno,userStudentNum,subjectName,mentorWho,startDate,endDate)
VALUES(1, 201632015,'알고리즘', '육정근',sysdate(),'2022-05-05');

create table tbl_mentoring(
	mno bigint not null auto_increment primary key,
    userId varchar(200),
    student1 varchar(200),
    student2 varchar(200),
    student3 varchar(200),
    student4 varchar(200),
    student5 varchar(200),
    student6 varchar(200),
    student7 varchar(200),
    student8 varchar(200)
);

select * from tbl_mentoring;

Create Table TBL_DEPARTMENT(
    dno int not null auto_increment primary key,
    department varchar(200)
);

insert into tbl_department values(null,"인문융합자율학부");
insert into tbl_department values(null,"사회융합자율학부");
select * from tbl_department;

create table tbl_mentoBoard(
    bno bigint not null auto_increment primary key,
    userId varchar(200),
    userStudentNum bigint,
    department varchar(200),
    subjectName varchar(200),
    startDate DATE,
    endDate DATE,
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    hopeDay varchar(200),
    introduce varchar(1000)
);
drop table tbl_mentoboard;
SELECT * FROM TBL_MENTOBOARD;


create table tbl_subject(
    sno bigint not null auto_increment primary key,
    subjectName varchar(200)
);
insert into tbl_subject values(null,"자바");
insert into tbl_subject values(null,"C언어");

select * from tbl_subject;

create table tbl_menteeBoard(
   bno bigint not null auto_increment primary key,
    userId varchar(200),
    userStudentNum bigint,
   mentorWho varchar(200),
    department varchar(200),
   subjectName varchar(200),
    startDate DATETIME,
    endDate DATETIME,
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    hopeDay varchar(200),
    introduce varchar(1000)
);

select * from tbl_menteeBoard;
drop  table tbl_menteeBoard;
insert into tbl_menteeBoard(bno,subjectName,mentorWho,startDate,endDate) values (2, '알고리즘', '육정근',sysdate(),'2022-05-05');

ALTER TABLE tbl_mentorBoard ADD CONSTRAINT FK_userIdMentor FOREIGN KEY (userId) REFERENCES tbl_user(userId)
