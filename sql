create table tbl_user(
userId varchar(200) primary key,
userPw varchar(200),
userStudentNum bigint,
userEmail varchar(200),
userPhoneNum varchar(200),
userName varchar(200),
department varchar(200),
checkAdmin bigint
);
drop table tbl_user;
select * from tbl_user;
insert into tbl_user(userId, userPw, userStudentNum,userName) values('test','1234','20161234','홍길동');

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
ALTER TABLE tbl_mentorBoard ADD CONSTRAINT FK_userIdMentor FOREIGN KEY (userId) REFERENCES tbl_user(userId);

drop table tbl_mentorBoard;
select * from tbl_mentorBoard;

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
ALTER TABLE tbl_menteeBoard ADD CONSTRAINT FK_userIdMentee FOREIGN KEY (userId) REFERENCES tbl_user(userId);
select * from tbl_menteeBoard;

drop  table tbl_menteeBoard;


/*더미데이터*/
insert into tbl_mentorBoard(bno,subjectName,menteeCount,startDate,endDate) values (1, '자바', '3',sysdate(),'2020-05-05');
insert into tbl_mentorBoard(bno,subjectName,menteeCount,startDate,endDate) values (2, '알고리즘', '4',sysdate(),'2020-05-05');

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

create table tbl_subject(
    sno bigint not null auto_increment primary key,
    subjectName varchar(200)
);
insert into tbl_subject values(null,"자바");
insert into tbl_subject values(null,"C언어");

select * from tbl_subject;


select * from tbl_menteeBoard;
drop  table tbl_menteeBoard;
insert into tbl_menteeBoard(bno,subjectName,mentorWho,startDate,endDate) values (2, '알고리즘', '육정근',sysdate(),'2022-05-05');



