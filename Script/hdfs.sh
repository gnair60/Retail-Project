# Create a folder in HDFS

hdfs dfs -mkdir /retail_datasets
hdfs dfs -mkdir /retail_datasets/nation
hdfs dfs -mkdir /retail_datasets/supplier





#Load Files to the created folder

#Nation File 

hdfs dfs -copyFromLocal /home/ak/project_gladiator/nation_0_0_0.csv /retail_datasets/nation

#Supplier File

hdfs dfs -put /home/ak/project_gladiator/supplier_0_0_0.csv /retail_datasets/supplier

#Verify that files are successfully loaded to the folder in HDFS

hdfs dfs -ls -R /retail_datasets
