USE ojonah;
ALTER DATABASE ojonah CHARACTER SET utf8 COLLATE utf8_unicode_ci;
DROP TABLE IF EXISTS registration;
DROP TABLE IF EXISTS course;
DROP TABLE IF EXISTS student;

CREATE TABLE student(
	studentId BINARY(16) NOT NULL,
	studentFirstName VARCHAR (30) NOT NULL,
	studentLastName VARCHAR (30) NOT NULL,
	INDEX (studentFirstName),
	PRIMARY KEY (studentId)

);

CREATE TABLE course(
	courseId BINARY(16) NOT NULL,
	courseStudentId BINARY(16) NOT NULL,
	courseTitle VARCHAR (15) NOT NULL,
	PRIMARY KEY (courseId),
	FOREIGN KEY (courseStudentId) REFERENCES student(studentId)
);

CREATE TABLE registration(
   registrationCourseId BINARY(16) NOT NULL ,
   registrationStudentId BINARY(16) NOT NULL,
   INDEX (registrationCourseId),
   INDEX (registrationStudentId),
   FOREIGN KEY (registrationCourseId) REFERENCES course(courseId),
   FOREIGN KEY (registrationStudentId) REFERENCES student(studentId)
);