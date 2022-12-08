#Create database in hive
 
create database retail_pg;

 

#Create managed tables in hive
#Note: The preferred option while loading data would be to enforce a custom schema, this ensures that the data types are consistent and avoids any unexpected behavior.

#Region Table

create table Region(R_RegionKey int,R_Name string,R_Comment string);

#Customer Table

create table Customer(C_CustKey int,C_Name string,C_Address string,C_NationKey int,C_Phone string,C_AcctBal double,C_MKTSegment string,C_Comment string);

#Part Table

create table Part(P_PartKey int,P_Name string, P_MFGR string,P_Brand string,P_Type string,P_Size int,P_Container string,P_RetailPrice double,P_Comment string);

#Orders Table

create table Orders(O_OrderKey int,O_CustKey int,O_OrderStatus string,O_TotalPrice double,O_OrderDate string,O_OrderPriority string,O_Clerk string,O_ShipPriority int,O_Comment string);

#LineItem Table

create table LineItem(L_OrderKey int,L_PartKey int,L_SuppKey int,L_LineNumber int,L_Quantity double,L_ExtendedPrice double,L_Discount double,L_Tax double,L_ReturnFlag string,L_LineStatus string,L_ShipDate string,L_CommitDate string,L_ReceiptDate string,L_ShipInstruct string,L_ShipMode string,L_Comment string);

#Partsupp Table

create table Partsupp(PS_Partkey int, PS_Suppkey int, PS_Availability int, PS_Supplycost double, PS_Comment string);

#Import from MySQL table to Hive managed table via Sqoop

#Customer Table

sqoop import --connect jdbc:mysql://localhost:3306/retail_db?useSSL=false -username hiveuser -password hivepassword --table CUSTOMER --hive-import --hive-table retail.CUSTOMER  --fields-terminated-by "\001" -m 2;

#LineItem Table

sqoop import --connect jdbc:mysql://localhost:3306/retail_db?useSSL=false -username hiveuser -password hivepassword --table LINEITEM --hive-import --hive-table retail.LINEITEM  --fields-terminated-by "\001" --split-by L_LINENUMBER;

#Orders Table

sqoop-import --connect jdbc:mysql://localhost/retail_db -username hiveuser  -password hivepassword  --table Orders -hive-table retail_proj.ORDERS  -hive-import --fields-terminated-by  '\001';

#Part Table

sqoop-import --connect jdbc:mysql://localhost/retail_db -username hiveuser  -password hivepassword  --table Part -hive-table retail_proj.PART  -hive-import --fields-terminated-by  '\001' --split-by P_PARTKEY -m 3;

#Partsupp Table

sqoop-import --connect jdbc:mysql://localhost/retail_db -username hiveuser  -password hivepassword  --table Partsupp -hive-table retail_proj.PARTSUPP  -hive-import --fields-terminated-by  '\001' --split-by PS_PARTKEY -m 3;

#Region Table

sqoop-import --connect jdbc:mysql://localhost/retail_db -username hiveuser  -password hivepassword  --table region -hive-table retail_proj.REGION  -hive-import --fields-terminated-by  '\001' -m 1;


#Create external tables in hive on top of data stored in HDFS

#Nation Table

CREATE EXTERNAL TABLE Nation(N_NationKey int, N_Name string, N_RegionKey int, N_Comment string) row format delimited fields terminated BY ';' stored AS textfile location '/retail_datasets/nation/' tblproperties ("skip.header.line.count"="1");

# Supplier Table

CREATE EXTERNAL TABLE SUPPLIER(S_SUPPKEY int, S_NAME string, S_ADDRESS string, S_NATIONKEY int, S_PHONE string, S_ACCTBAL double, S_COMMENT string)   ROW FORMAT DELIMITED FIELDS TERMINATED BY ';' STORED AS TEXTFILE   LOCATION '/aman/retail_proj/SUPPLIER/' tblproperties ("skip.header.line.count"="1");