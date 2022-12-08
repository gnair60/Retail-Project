#Create Database

create database retail_pg;
 

#Create Tables

#Region Table

create table Region(R_RegionKey int(38) not null,R_Name varchar(25) not null,R_Comment varchar(152) not null, primary key(R_RegionKey));

#Nation Table

create table Nation(N_NationKey int(38) not null,N_Name varchar(25) not null,N_RegionKey int(38) not null, N_Comment varchar(152) not null, primary key(N_NationKey));

#Supplier Table

create table Supplier(S_SuppKey int(38) not null,S_Name varchar(25) not null,S_Address varchar(40) not null,S_NationKey int(38) not null,S_Phone varchar(15) not null,s_AcctBal float(12,2) not null,S_Comment varchar(101) not null, primary key(S_SuppKey), foreign key(S_NationKey) references Nation(N_NationKey));

#Part Table

create table Part(P_PartKey int(38) not null,P_Name varchar(55) not null, P_MFGR varchar(25) not null ,P_Brand varchar(10) not null,P_Type varchar(25) not null,P_Size int(38) not null,P_Container varchar(10) not null,P_RetailPrice float(12,2) not null,P_Comment varchar(23) not null, primary key(P_PartKey));

#Partsupp Table

create table Partsupp(PS_Partkey int(38) not null, PS_Suppkey int(38) not null, PS_Availability int(38) not null, PS_Supplycost double(12,2) not null, PS_Comment varchar(199) not null, foreign key(PS_PartKey) references Part(P_PartKey), foreign key(PS_SuppKey) references Supplier(S_SuppKey));

#Customer Table

create table Customer(C_CustKey int(38) not null,C_Name varchar(25) not null,C_Address varchar(40) not null,C_NationKey int(38) not null,C_Phone varchar(15) not null,C_AcctBal float(12,2) not null,C_MKTSegment varchar(10) not null,C_Comment varchar(117) not null, primary key(C_CustKey), foreign key(C_NationKey) references Nation(N_NationKey));

#Orders Table

create table Orders(O_OrderKey int(38) not null,O_CustKey int(38) not null,O_OrderStatus varchar(1) not null,O_TotalPrice float(12,2) not null,O_OrderDate date not null,O_OrderPriority varchar(15) not null,O_Clerk varchar(15) not null,O_ShipPriority int(38) not null,O_Comment varchar(79) not null , primary key(O_OrderKey), foreign key(O_CustKey) references Customer(C_CustKey));

#LineItem Table

create table LineItem(L_OrderKey int(38) not null,L_PartKey int(38) not null,L_SuppKey int(38) not null,L_LineNumber int(38) not null,L_Quantity float(12,2) not null,L_ExtendedPrice float(12,2) not null ,L_Discount float(12,2) not null,L_Tax double(12,2) not null,L_ReturnFlag varchar(1) not null,L_LineStatus varchar(1) not null,L_ShipDate date not null,L_CommitDate date not null,L_ReceiptDate date not null,L_ShipInstruct varchar(25) not null,L_ShipMode varchar(10) not null,L_Comment varchar(44) not null);

#Load Data from files to the created tables

#Region Table

load data local infile '/home/ak/PG/semi/csv/region_0_0_0.csv' into table Region fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

#Nation Table

load data local infile '/home/ak/PG/semi/csv/nation_0_0_0.csv' into table Nation fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

#Supplier Table

load data local infile '/home/ak/PG/semi/csv/supplier_0_0_0.csv' into table Supplier fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

#Part Table

load data local infile '/home/ak/PG/semi/csv/part_0_0_0.csv' into table Part fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

#Partsupp Table

load data local infile '/home/ak/PG/semi/csv/partsupp_0_0_0.csv' into table Partsupp fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;



#Customer Table

load data local infile '/home/ak/PG/semi/csv/customer_0_0_0.csv' into table Customer fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

#Orders Table

load data local infile '/home/ak/PG/semi/csv/orders_0_0_0.csv' into table Orders fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

#LineItem Table

load data local infile '/home/ak/PG/semi/csv/lineitem_0_0_0.csv' into table LineItem fields terminated by ';' enclosed by '"' lines terminated by '\n' ignore 1 lines;

