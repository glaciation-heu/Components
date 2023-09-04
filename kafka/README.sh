Run setup_kafka.sh

After setting it up we can test it
Create a topic:
kafka-topics.sh --create --zookeeper kafka-zookeeper:2181 --replication-factor 1 --partitions 1 --topic test

Produce messages:
kafka-console-producer.sh --broker-list kafka:9092 --topic test

Consume messages:
kafka-console-consumer.sh --bootstrap-server kafka:9092 --topic test --from-beginning
