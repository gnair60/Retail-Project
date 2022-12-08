from kafka import KafkaProducer
import json
import logging
import csv
from json import dumps
from time import sleep
from kafka.errors import KafkaError
logging.basicConfig(level=logging.INFO)




producer = KafkaProducer(bootstrap_servers=['localhost:9092'],
                      value_serializer=lambda x:
                      dumps(x).encode('utf-8'))

with open('/home/gautam/Proj/customer_0_0_0.csv') as file:
    reader=csv.reader(file, delimiter=';')
    for messages in reader:
     producer.send('customer',messages)
     producer.flush()
     sleep(10)
