  
use AcademicsDB;

go 
CREATE TYPE _Name  
FROM varchar(100) NOT NULL ;  

-- phone can be null
CREATE TYPE _Phone 
FROM varchar(50);  

-- phone can be null
CREATE TYPE _Paragraph 
FROM varchar(1000);  

-- phone can be null

go

create table _user(   
	id _Name primary key,
	fName _Name,
	lName _Name,
	email varchar(64),
	bDate Date,
	phone _phone,
	Edu _Paragraph
	);

	create table _course(
	courseID _Name primary key,
	cName _Name,
	finalGrade float,
	startDate Date,
	endDate date,
	topic _Name,
	MGRID _Name,
	Foreign key (MGRID) references _user(ID) on update cascade on delete cascade  -- if manager out then classes will not go out since students will try to keep their grades
	)


	create table _class(
	clName _name,
	courseID _name,
	primary key (clName, courseID),
	foreign key (courseID) references _course(courseID) on update cascade on delete cascade  -- if course is changed the so will classes
	)
	
	create table student(
	id _Name primary key,
	schoolName _Name,
	phone _phone,
	parentPhone _phone,
	className _name,
	courseID _name,
	Foreign key (className, courseID) references _class(clName, courseID) on update cascade on delete cascade
	-- if class is out then student
	);

	-- this table stores the day of the week's day this class
	create table classDate(
	className _name,
	courseID _name,
	classDay varchar(10) check (classDay = 'saturday' or classDay = 'Sunday'or classDay = 'Monday'or classDay = 'Teusday'or classDay = 'Wednesday'or classDay = 'Thursday'or classDay = 'Friday'), 
	primary key (className, courseID, classDay),
	Foreign key (className, courseID) references _class(clName, courseID) on update cascade on delete cascade   -- if the class is out then so will be the class dates
	);

	create table material(
		matName _name,
		courseID _name,
		primary key(matName, courseID),
		foreign key( courseID ) references _course(courseID) on update cascade on delete cascade
		);

		create table materialBook(
			bookName _name,
			matName _name,
			courseID _name,
			bookType _name,
			bookPDF varbinary(max),
			primary key( bookName, matName, courseID),
			foreign key( matName, courseID) references material(matName, courseID) on update cascade on delete cascade
		);

		create table sheet(
		sheetName _name,
		matName _name,
		courseID _name,		
		sheetPDF varbinary(max),
		dueDate date,	-- this is the sheets due date
		primary key(sheetName, matName, courseID),
		foreign key(matName, courseID) references material(matName, courseID) on update cascade on delete cascade
		);


		-- ##NOTE this is something that is pretty awkward 
		-- # changing the (courseID, className) order to (className, courseID) made it work
		-- # the poblem is that you have to follow the order in primarykey(className, courseID) in the referenced table
		-- # you have to be careful
		---- evaluation not added
		--create table evaluation(
		--evDate Date,
		--courseID _name,
		--className _name,
		--studID _name,
		--attended varchar(1),
		--score float,
		--primary key (evDate, courseID, className, studID),
		--foreign key (studID) references student(ID) on update cascade on delete cascade,
		--foreign key (courseID, className) references _class(courseID, clName) on update cascade on delete cascade
		--);

		create table evaluation(
		evDate Date,
		courseID _name,
		className _name,
		studID _name,
		attended varchar(1),
		score float,
		primary key (evDate, courseID, className, studID),
		foreign key (studID) references student(ID) on update cascade on delete cascade,
		Foreign key (className, courseID) references _class(clName, courseID) 

		);

		create table exam(
			exName _name,
			courseID _name,
			primary key(exName, courseID),
			foreign key(courseID) references _course(courseID) on update cascade on delete cascade
		);

		create table question(
		courseID _name,
		exName _name,
		qNum int,
		qText _Paragraph,
		isMultiple char check(isMultiple = 'y' or isMultiple = 'n'),
		-- add the correctAns field
		correctAnsNum int,
		primary key(qNum, courseID, exName),
		foreign key (exName, courseID) references exam(exName, courseID) on update cascade on delete cascade
		);
		
		-- question choices not added
		create table questionChoice(
		choiceNum int,
		courseID _name,
		exName _name,
		qNum int,
		choiceText _paragraph
		primary key (choiceNum, qNum, exName, courseID),		
		foreign key (qNum, courseID, exName ) references question(qNum, courseID, exName) on update cascade on delete cascade
		);	
		
		-- uncertain about it
		alter table question 
		add constraint correctAns_fk foreign key(correctNum) references questionChoices(choiceNum) on update cascade on delete cascade;

		create table assistant (
		assistID _name,
		courseID _name,
		primary key(assistID, courseID),
		foreign key (assistID) references _user(ID) , -- deleted  on update cascade on delete cascade as caused cycles
		foreign key (courseID) references _course(courseID) on update cascade on delete cascade
		);

		create table StudentUser(
		userID _name,
		studentID _name,
		primary key(userID, studentID),
		foreign key (userID) references _user(ID), --- deleted on update cascade on delete cascade as it caused cycles
		foreign key(studentID) references student(ID) on update cascade on delete cascade
		);


		create table studExamScore(
		studID _name,
		courseID _name,
		exName _name,
		score float,
		primary key(studID, courseID, exName),
		foreign key(exName, courseID) references exam(exName, courseID) on update cascade on delete cascade
		);