-- 0. Drop table INSTRUCTOR in case it already exists
drop table INSTRUCTOR;

-- 1. Create table INSTRUCTOR
create table INSTRUCTOR (ins_id integer primary key not null, lastname varchar(15) not null,
                                            firstname varchar(15) not null, city varchar(15), country char(2));
insert into INSTRUCTOR values(1, 'Ahuja', 'Rav', 'Toronto', 'CA');
insert into INSTRUCTOR values(2, 'Chong', 'Raul', 'Toronto', 'CA');
insert into INSTRUCTOR values(3, 'Vasudevan', 'Hima', 'Chicago', 'US');

/* Tips: The column named "INS_ID" cannot be a column of a primary key or unique key constraint
             because it can contain null values. 指定主键必须声明NOT NULL. */


 -- 3. Select all rows from INSTRUCTOR table.
select * from INSTRUCTOR;
  
-- 3B. Select the firstname, lastname, and the countruy where the city is Toronto.
select firstname, lastname, country from INSTRUCTOR where city = 'Toronto';
  
-- 4. Update the row for Rav Ahuja and change his city to Markham.
Update INSTRUCTOR set city = 'Markham' where firstname = 'Rav' and lastname = 'Ahuja';
-- UPDATE INSTRUCTOR SET city='Markham' where ins_id=1;

-- 5. Delete the row for Raul Chong from the table.
delete from INSTRUCTOR where firstname = 'Raul' and lastname = 'Chong';
-- DELETE FROM INSTRUCTOR where ins_id=2;

-- 5B. Retrieve all rows in the INSTRUCTOR table.
select * from INSTRUCTOR;

 /* solution
 
CREATE TABLE INSTRUCTOR
   (ins_id INTEGER PRIMARY KEY NOT NULL, 
   lastname VARCHAR(15) NOT NULL, 
   firstname VARCHAR(15) NOT NULL, 
   city VARCHAR(15), 
   country CHAR(2)
 );
 
-- 2A: Insert one row into the INSTRUCTOR table for the instructor Rav Ahuja.
INSERT INTO INSTRUCTOR
 	(ins_id, lastname, firstname, city, country)
  	VALUES 
  	(1, 'Ahuja', 'Rav', 'Toronto', 'CA');
 
--2B. Insert the two rows at once for Raul and Hima
insert into INSTRUCTOR
  values
  (2, 'Chong', 'Raul', 'Toronto', 'CA'),
  (3, 'Vasudevan', 'Hima', 'Chicago', 'US');
  
 */ 
  
