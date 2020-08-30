# Database-and-SQL-for-Data-Science
The practice and assignment for SQL.

## Week 1 - Introduction to Database & basic SQL commands 
### 1.1 Intro 
* SQL: Structured Query Language. 
  - use for relational database; 
  - to query data.
* Database: a repository of Data.
* Relational database: data stored in tabular form is a relationnal database
* Relational Database Management System (DBMS): the system used to manage relational database.

* statement type
  - Data Definition Language: define, alter, or drop data 
  - Data Manipulation Language: read, modify data
 
### 1.2 Five Basic SQL Commands 
* create  ``` create <tablename>(COLUMN1, COLUMN2, ... );```
* insert  ``` insert into <tablename> values (COLUMN1, COLUMN2, ...  ) ([value1], [value2], ...);``` 
* select  ``` select * from <tablename>;```
* update  ``` update <tablename> set COLUMN = [value] where <condition>;```
* delete  ``` delete from <tablename> where <condition>;```  

### 1.3 Count, Distinct, Limit
__1.__ __Count__: retrieve the rows that match query criterion.
    - the number of rows of table:
    ```select count(*) from <tablename>;```
    - the number of rows that matching specific query criteiron: 
    ```select count(<columnname>) from <tablename> where <condition>;```
    
__2.__ __Distinct__: retrieve the values without repetition.
    ``` select distinct <columnname> from <tablename>;```

__3.__ __Limit__: use to specify the number of rows when retrieve data.
    ``` select * from <tablename> limit 10; ```
  
**Tips**: equal to `fetch the first 10 rows;`

### 1.4 Insert Statement (DML)
1. insert one row
2. insert multiple rows

### 1.5 Update Statement (DML)
```
update <tablename> set <columnname> = [value] (where <condition>);
```

### 1.5 Delete Statement (DML)
```
delete from <tablename> (where <condition>);
```

### 1.6 Drop Statement (DDL)
```
# delete database or table. If the object is not exist, a Error message will be return. 
drop TABLE <tablename>； 

# If the object is not exist, nothing will be done. 
drop TABLE IF NOT EXISTS <tablename>;  
```


### 1.3 Use DB2: Create a Database Instance on Clould
Register a DB2 on https://cloud.ibm.com.

## Week 2 - Advenced SQL Statement 
### 2.1 Using String Patterns, Ranges and Sets
__1. String Patterns__: use `like`, `%`; 

```
select <columnname> from <tablename> 
       where <columnname> like '%R%';
```
where "%" is wildcard character that use to replace other character. 


__2. Ranges__: use `between and` & `>=, <=`
```
select <columnname> from <tablename> 
       where <columnname> between v1 and v2;
```

__3. Sets__: use `in`
```
select <columnname> from <tablename> 
       where <columnname> in ([value1], [value2], [value3]);
```

### 2.2 Sorting Results Sets

__1. `order by` clause__, default by ascending order:
```
select <columnname> from <tablename> 
       order by <columnname>;
```

If wanna descending order, please add `desc` at the end of the clause:
```
select <columnname> from <tablename> 
       order by <columnname> desc;
```

### 2.3 Grouping Result Sets
__1.  `group by` clause__
```
select <columnname>, count(<columnname>) as count_col from <tablename>
       group by <columnname>;
```
where `as` define a colname for the retrieved column `count(<columnname>)`, or the retrieved column will be named by 2.

__2. `having` clause__: restrict the result set by `having`, for example,
```
select <columnname>, count(<columnname>) as count_col from <tablename>
       group by <columnname> having count(<columnname>) < 10;
```

__Note__: `having` clause is only work for `group by` clause. 'where' works for the entire dataset. 

### 2.4 Built-in Database functions
1. Aggregate Function
__Input__:  collection of values (e.g. entire column)
__Output__: single value

Example:
- SUM()
```
select SUM(<columnname>) from <tablename>; 
# or
select SUM(<columnname>) as SUM_OF_COL from <tablename>;
```

- MIN(), MAX()
```
select MIN(<columnname>) from <tablename>; 
```

- AVG()
```
select AVG(<columnname>) from <tablename>;
# or
select AVG(<columnname> / <columnname>) from <tablename>;
```
count() is also an aggregate function.

### 2.5 Data and Time Built-in Functions
* `year(), month(), day(), week(), hour(), dayofmonth(), dayofweek(), dayofyear()`
* `current_date, current_time`


### 2.6 Sub-Queries & Nested Selected
1. sub-queries: a query nest in another query

2. the functions of sub-query:
- use sub-query to calculate aggregate functions
```
select * from <tablename> 
     where <columnname> < 
     (select AVG(<columnname>) from <tablename>;)
```
- use sub-query to replace column name

- use sub-query to replace table name 
```
select * from (select * from <tablename>) as TABNAME
```

### 2.7 Multiple Tables
1. Sub-queries
```
select * from <table1>
      where <column1> in 
      (select <column2> from <table2>);
```
2. Implicit JOIN
```
select T1.column1, T2.column2 from table1 T1, table2 T2 where T1.column3 = T2.column4;
```
3. Join Operation
* inner join
* outer join
  - __left outer join__: all rows from the left table and any matching rows from the right table.
    - most popular join, displays matches only (returns the rows that  match).
  - __right outer join__: all row from the right table and any matching rows from the left table.
  - __full outer join__: all rows from both tables.


## Week 3 - Write SQL Using Python (take DB2 for instance)

### 3.1 Access Database Using Python
the Python code connects to the database by using "API" calls.

### 3.2 Using DB_API
There are two objects to using Python DB_API:
* __Step 1__: Connection Objects, connect database & manage transaction;
* __Step 2__: Query Objects

### 3.3 Connecting to a Database Using ibm_db API
1. **ibm_db API**: provides a variety of useful Python functions for accessing and manipulating data in IbM data server Database.

2. Obtain the __service credentials of your DB2 instance__. For more details, please check the file in week 3/LAB-0-v6-Create-Db2-Service-Credentials.pdf.

3.  __Import the ibm_db__ library into Python Application.
```
import ibm_db
```

4. Connecting to database (for instance, DB2)
Connect to DB2 database requires the following information:
  - Driver name (dsn_driver)
  - Database name  (dsn_database)
  - Host DSN name or IP address (dsn_hostname)
  - Host port (主机端口dsn_port,一般是50000，看你的具体情况)
  - Connection protocol (连接协议，一般是TCPIP)
  - User ID  (uid)
  - User Password
  
4.a __Method 1__ 

__Step 1__: Replace the placeholder values with your actual Db2 hostname, username, and password:
```
dsn_hostname = "hostname" # e.g.: "dashdb-txn-sbox-yp-dal09-04.services.dal.bluemix.net"
dsn_uid = "uid"        # e.g. "abc12345"
dsn_pwd = "password"      # e.g. "7dBZ3wWt9XN6$o0J"

dsn_driver = "{IBM DB2 ODBC DRIVER}"
dsn_database = "BLUDB"            # e.g. "BLUDB"
dsn_port = "50000"                # e.g. "50000" 
dsn_protocol = "TCPIP"            # i.e. "TCPIP"
```
__Step 2__: Create the _dsn_ connection string
```
dsn = (
    "DRIVER={0};"
    "DATABASE={1};"
    "HOSTNAME={2};"
    "PORT={3};"
    "PROTOCOL={4};"
    "UID={5};"
    "PWD={6};").format(dsn_driver, dsn_database, dsn_hostname, dsn_port, dsn_protocol, dsn_uid, dsn_pwd)

# print the connection string to check correct values are specified
print(dsn)
```
__Step 3__: Establish the database connection
```
try:
    conn = ibm_db.connect(dsn, "", "")
    print ("Connected to database: ", dsn_database, "as user: ", dsn_uid, "on host: ", dsn_hostname)

except:
    print ("Unable to connect: ", ibm_db.conn_errormsg() )
```
When the connection is established, you can check the __information of Server__ by `ibm_db.server_info(conn)`; or check the __information of client__ `ibm_db.client_info()`.

4.b __Method 2__
Load SQL extension in Python, and establish a connection with the database.
```
%load_ext sql

# Remember the connection string is of the format:
# %sql ibm_db_sa://my-username:my-password@my-hostname:my-port/my-db-name
# Enter the connection string for your Db2 on Cloud database instance below
# i.e. copy after db2:// from the URI string in Service Credentials of your Db2 instance. Remove the double quotes at the end.
%sql ibm_db_sa://
```

### 3.4 Create Tables, Loading Data and Querying Data Using Python

Using function `ibm_db.exec_immediate(para1 = connection, para2 = QueryStatement, para3 = Options)`. 
__3.4.1 Drop Tables__
```
#Lets first drop the table INSTRUCTOR in case it exists from a previous attempt
dropQuery = "drop table INSTRUCTOR"

#Now execute the drop statment
dropStmt = ibm_db.exec_immediate(conn, dropQuery)
```
__3.4.2 Create Tables__
```
#Construct the Create Table DDL statement - replace the ... with rest of the statement
createQuery = "create table INSTRUCTOR(ID integer primary key not null, FNAME varchar(15) not null, LNAME varchar(15), CITY varchar(15), CCODE char(2))"

#Now fill in the name of the method and execute the statement
createStmt = ibm_db.exec_immediate(conn, createQuery)
```
__3.4.3 Insert data into the table__
```
#Construct the query - replace ... with the insert statement
insertQuery = "insert into INSTRUCTOR values (1, 'Rav', 'Ahuja', 'TORONTO', 'CA')"

#execute the insert statement
insertStmt = ibm_db.exec_immediate(conn, insertQuery)
```

__3.4.4 Query data in the table__
```
#Construct the query that retrieves all rows from the INSTRUCTOR table
selectQuery = "select * from INSTRUCTOR"

#Execute the statement
selectStmt = ibm_db.exec_immediate(conn, selectQuery)

#Fetch the Dictionary (for the first row only)
ibm_db.fetch_both(selectStmt)
```
### 3.5  Retrieve data into Pandas
Retrieve the contents of table into Pandas dataframe.

__Step 1__: import related libraries.
```
import pandas
import ibm_db_dbi
```
__Step 2__:  connection for pandas
```
pconn = ibm_db_dbi.Connection(conn)  # conn = ibm_db.connect(dsn, "", "")
```
__Step 3__: query statement to retrieve all rows in INSTRUCTOR table 
```
selectQuery = "select * from INSTRUCTOR"

#retrieve the query results into a pandas dataframe
df = pandas.read_sql(selectQuery, pconn)

#print the entire data frame
df

# print how many rows and columns in the data frame
df.shape
```

### 3.6 Close the connection 
When you finish the use of DB2, remember close connections so that we can avoid unused connections taking up resources.
```
ibm_db.close(conn)
```

## Week 4 - Working with real-world data sets

