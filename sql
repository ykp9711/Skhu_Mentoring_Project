create table tbl_user(
userId varchar(200) primary key,
userPw varchar(200),
userStudentNum bigint,
userEmail varchar(200),
userPhoneNum varchar(200),
userName varchar(200),
department varchar(200),
checkAdmin bigint,
mentorRating bigint default 0,
menteeRating bigint default 0,
    imgName varchar(200) default 'noImg.png',
    nickName varchar(200),
    oneWord varchar(200),
    mainSubject varchar(200),
    sns varchar(200)
);
select * from tbl_user;

insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentor','zSOGF5AYZbXgDWDZDeqJfA==',201632013,'skhu@abc.com',01012345678,'김멘토','IT융합자율학부',500);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee','zSOGF5AYZbXgDWDZDeqJfA==',201632014,'skhu@abc.com',01012345678,'이멘티','IT융합자율학부',300);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee2','zSOGF5AYZbXgDWDZDeqJfA==',201632015,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',1000);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee3','zSOGF5AYZbXgDWDZDeqJfA==',201632016,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',50);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee4','zSOGF5AYZbXgDWDZDeqJfA==',201632017,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',30);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee5','zSOGF5AYZbXgDWDZDeqJfA==',201632018,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',20);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee6','zSOGF5AYZbXgDWDZDeqJfA==',201632019,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',10);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee7','zSOGF5AYZbXgDWDZDeqJfA==',201632020,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',3);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee8','zSOGF5AYZbXgDWDZDeqJfA==',201632021,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',6);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee9','zSOGF5AYZbXgDWDZDeqJfA==',201632022,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',9);
insert into tbl_user(userId,userPw,userStudentNum,userEmail,userPhoneNum,userName,department, mentorRating) values('mentee10','zSOGF5AYZbXgDWDZDeqJfA==',201632023,'skhu@abc.com',01012345678,'홍길동','IT융합자율학부',1200);
select * from tbl_user order by mentorRating desc limit 10;
select * from tbl_user order by mentorRating desc limit 0,1;
select * from tbl_user order by mentorRating desc limit 1,1;
select * from tbl_user order by mentorRating desc limit 2,1;
select * from tbl_user order by mentorRating desc limit 3,7;

create table tbl_mentorBoard(
   bno bigint not null auto_increment primary key,
    userId varchar(200),
    userName varchar(200),
    userStudentNum bigint,
    menteeCount bigint,
    department varchar(200),
   subjectName varchar(200),
    startDate DATETIME,
    endDate DATETIME,
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    hopeDay varchar(200),
    introduce varchar(1000),
    menteeStudentNum bigint,
    maxPersonnel bigint,
    personnel bigint default 0,
    recruiting varchar(300),
   realStartDate datetime,
    realEndDate datetime,
    rating varchar(200)
);
ALTER TABLE tbl_mentorBoard ADD CONSTRAINT FK_userIdMentor FOREIGN KEY (userId) REFERENCES tbl_user(userId) ON DELETE CASCADE;

insert into tbl_mentorboard(userId,userName,userStudentNum,department, subjectName, maxPersonnel, recruiting) (select userId,userName,userStudentNum,department,subjectName,maxPersonnel,



recruiting  from tbl_mentorboard);

create table tbl_menteeBoard(
   bno bigint not null auto_increment primary key,
    userId varchar(200),
    userName varchar(200),
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
ALTER TABLE tbl_menteeBoard ADD CONSTRAINT FK_userIdMentee FOREIGN KEY (userId) REFERENCES tbl_user(userId) ON DELETE CASCADE;


Create Table TBL_DEPARTMENT(
    dno int not null auto_increment primary key,
    department varchar(200)
);

insert into tbl_department values(null,"인문융합자율학부");
insert into tbl_department values(null,"사회융합자율학부");
insert into tbl_department values(null,"미디어콘텐츠융합자율학부");
insert into tbl_department values(null,"IT융합자율학부");

create table tbl_subject(
    sno bigint not null auto_increment primary key,
    subjectName varchar(200)
);
insert into TBL_SUBJECT values(null,"JAVA");
insert into TBL_SUBJECT values(null,"C언어");

create table tbl_applicationMentor(
   bno bigint,
    menteeId varchar(200),
    userName varchar(200),
    userStudentNum bigint,
    department varchar(200),
    regDate DATETIME DEFAULT CURRENT_TIMESTAMP,
    introduce varchar(1000),
    subjectName varchar(200),
    accept varchar(200),
    startDate datetime,
    endDate datetime,
    refusalReason varchar(2000),
    checkRating varchar(200) default 0,
    checkRatingMentor varchar(200) default 0
);
ALTER TABLE tbl_ApplicationMentor ADD CONSTRAINT FK_bno FOREIGN KEY (bno) REFERENCES tbl_mentorBoard(bno) ON DELETE CASCADE;

select * from tbl_applicationmentor;
select * from tbl_user;
select * from tbl_mentorboard;


