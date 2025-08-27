create database StudentFeeDB;
use studentfeedb;
create table students (
	studentid int primary key,
	name varchar (50),
	class varchar (50)
)
create table fee(
	feeid int primary key,
	class varchar (20),
	feeamount int 
)
create table payment(
	paymentid int primary key,
	studentid int,
	feeid int,
	status varchar (30),
	paymentdate date,
	foreign key (studentid) references students (studentid),
	foreign key (feeid) references fee (feeid)
)
insert into students (studentid,name,class) values (1,'usman','cs'),(2,'ali','cs'),(3,'kashif','cs');
insert into fee (feeid,class,feeamount) values (233,'13',343434),(343,'13',343456),(545,'13',6563);
INSERT INTO payment (paymentid, studentid, feeid, status, paymentdate)
VALUES (1, 1, 233, 'Payable', NULL),
       (2, 2, 343, 'Payable', NULL),
       (3, 3, 545, 'Payable', NULL);
update payment 
set status='paid',paymentdate=getdate() where studentid=1;
select * from payment;
SELECT students.studentid, students.name, payment.status, payment.paymentdate
FROM students
INNER JOIN payment
ON students.studentid = payment.studentid;