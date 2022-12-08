from pyspark.sql.functions import *


if__name == "__main__":
	data= spark.readStream.format('kafka') \
       .option('kafka.bootstrap.servers', 'localhost:9092') \
       .option('subscribe','customer') \
       .option('startingOffsets','earliest') \
       .load()




	customerdf = data.select(split(col('value'),';').alias('splitted_value')).withColumn("CustomerKey",col("splitted_value").getItem(0)).withColumn("Name",col("splitted_value").getItem(1))          .withColumn("Address",col("splitted_value").getItem(2))
	.withColumn("NationKey",col("splitted_value").getItem(3))             .withColumn("Phone No",col("splitted_value").getItem(4)) 
	.withColumn("AccountBalance",col("splitted_value").getItem(5)).withColumn("MKTSegment",col("splitted_value").getItem(6).withColumn("Comment",col("splitted_value").getItem(7)).select('Customer Key','Name','Address','Nation Key','Phone No','Account Balance','MKTSegment','Comment')

	
	customer = customerdf.writeStream.outputMode("append").format("console").start()

	customer=customerdf.writeStream.outputMode('append').format("parquet").option('checkpointLocation','file:///home/gautam/sparkstream/checkpoint').option("path",'file:///home/gautam/sparkstream/customer').start()

  



#HDFS

	customer=customerdf.writeStream.outputMode('append').format("parquet").option("checkpointLocation", "hdfs:///gautam/checkcust").start("/gautam/customer")
