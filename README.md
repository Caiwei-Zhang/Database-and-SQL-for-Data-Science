# Database-and-SQL-for-Data-Science
The practice and assignment for SQL.

### Week 1 - Introduction to Database & basic SQL commands 
#### Intro 
* SQL, Structured Query Language. (use for relational database; To query data.)
* Databse.
* Relational database & Relational Database Management System.

#### 5 basic SQL commands 
* create  ` create <tablename>(COLUMN1, COLUMN2, ... );`
* insert  ` insert into <tablename> values (COLUMN1, COLUMN2, ...  ) ([value1], [value2], ...);` 
* select  `select * from <tablename>` 
* update  `update <tablename> set COLUMN = [value] where <condition>;`
* delete  `drop <tablename>`

#### Use DB2: Create a Database Instance on Clould
Register a DB2 on https://cloud.ibm.com.

### Week 2 - Advenced SQL statement 


### Week 3 - Write SQL Using Python (take DB2 for instance)

#### 3.1 Access Database Using Python
the Python code connects to the database by using "API" calls.

#### 3.2 Using DB_API
There are two steps to using Python DB_API:
* Step 1: Connection Objects, connect database & manage transaction;
* Step 2: Query Objects

#### 3.3 Connecting to a Database Using ibm_db API
1. **ibm_db API**: provides a variety of useful Python functions for accessing and manipulating data in IbM data server Database.

2. Obtain the service credentials of your DB2 instance. For more details, please check the file in week 3/LAB-0-v6-Create-Db2-Service-Credentials.pdf.

3. First import the ibm_db library into Python Application.
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
  
* __Method 1__
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
Whee the connection is established, you can check the __information of Server__ by `ibm_db.server_info(conn)`; or check the __information of client__ `ibm_db.client_info()`.

* __Method 2__
Load SQL extension in Python, and establish a connection with the database.
```
%load_ext sql

# Remember the connection string is of the format:
# %sql ibm_db_sa://my-username:my-password@my-hostname:my-port/my-db-name
# Enter the connection string for your Db2 on Cloud database instance below
# i.e. copy after db2:// from the URI string in Service Credentials of your Db2 instance. Remove the double quotes at the end.
%sql ibm_db_sa://
```

#### 3.4 Create Tables, Loading Data and Querying Data Using Python

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


