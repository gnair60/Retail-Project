from pyspark.sql import SparkSession
from pyspark.sql.functiopns import*
from pyspark.sql.types import*
from pyspark.sql import Window

if__name == "__main__":

	spark = SparkSession\
	.builder\
	.appName("PythonWordCount")\
	.getOrCreate()

#Using Hive Tables

	partDf = spark.sql("select * from retail_db.part")

	partsuppDf = spark.sql("select * from retail_db.partsupp")

#Through DSL


	nationDf=spark.read.table("retail_proj.nation")

	regionDf=spark.read.table("retail_proj.region")


#Using MySQL Tables


#Customer Dataframe

	customerDf =
	spark.read.format("jdbc").option("url", "jdbc:mysql://localhost:3306/retail_db?useSSL=false").option("driver", "com.mysql.jdbc.Driver").option("dbtable", "Customer").option("mode","DROPMALFORMED").option("user", "hiveuser").option("password", "hivepassword").load()

# Lineitem Dataframe 

	lineitemDf =
	spspark.read.format("jdbc").option("url", "jdbc:mysql://localhost:3306/retail_db?useSSL=false").option("driver", "com.mysql.jdbc.Driver").option("dbtable", "Lineitem").option("mode","DROPMALFORMED").option("user", "hiveuser").option("password", "hivepassword").load()


# Using CSV files and imposing user defined schema

#Order Dataframe

	from pyspark.sql.types import StructType,StructField, StringType,IntegerType,TimestampType,DoubleType

	orderschema = StructType([
    	StructField("O_ORDERKEY", IntegerType()),
    	StructField("O_CUSTKEY", IntegerType()),
    	StructField("O_ORDERSTATUS", StringType()),
    	StructField("O_TOTALPRICE", DoubleType()),
    	StructField("O_ORDERDATE", TimestampType()),
    	StructField("O_ORDERPRIORITY", StringType()),
    	StructField("O_CLERK", StringType()),
    	StructField("O_SHIPPRIORITY", IntegerType()),   
    	StructField("O_COMMENT", StringType())
	])

	orderDf = spark.read.option("sep",";").option("header","true").schema(orderschema).csv("file:////home/ak/PG/semi/csv/ORDERS_0_0_0.csv", sep=";")
   	 
#Supplier Dataframe

	suppschema = StructType([
	    StructField("S_SUPPKEY", IntegerType()),
    	StructField("S_NAME", StringType()),
    	StructField("S_ADDRESS", StringType()),
    	StructField("S_NATIONKEY", IntegerType()),
    	StructField("S_PHONE", StringType()),
    	StructField("S_ACCTBAL", DoubleType()),
    	StructField("S_COMMENT", StringType())
	])
 
	suppDf = spark.read.option("header","true").csv("file:///home/ak/PG/semi/csv/SUPPLIER_0_0_0.csv", sep=";", schema=suppschema)

#Dataframe Transformations

#Typecasting and saving dataframe as a Table in Hive

	new_orderDf = orderDf.withColumn("O_ORDERDATE",orderDf.O_ORDERDATE.cast("date"))

	new_orderDf.write.mode("overwrite").saveAsTable("retail_pg.orders")


#Partitioning using PySpark

	spark.sql("SELECT O_ORDERKEY, O_CUSTKEY, O_ORDERSTATUS, O_TOTALPRICE, O_CLERK, O_SHIPPRIORITY, O_COMMENT, O_ORDERPRIORITY, year(O_ORDERDATE) as O_ORDERYEAR, month(O_ORDERDATE) as O_ORDERMONTH, day(O_ORDERDATE) as O_ORDERDAY FROM RETAIL_PG.ORDERS").write.partitionBy("o_orderpriority","o_orderyear","o_ordermonth","o_orderday").mode("append").option("codec","gzip").parquet("file:///home/ak/retail_trans/orders_partition")

#Bucketing using PySpark

	lineitemDf.write.bucketBy(4,"l_shipmode").format("parquet").option("codec","gzip").mode("append").saveAsTable("retail_prgl.lineitemDfbuck")


 


