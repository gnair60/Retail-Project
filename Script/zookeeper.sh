./zookeeper-server-start.sh../config/zookeeper.PROPERTIES


# Start Kafka Server

./kafka-server-start.sh ../config/server.PROPERTIES

# Create Kafka Topic

./kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic customer

#Starting Consumer:

./kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic customer --from-beginning
