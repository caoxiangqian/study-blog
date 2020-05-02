# 修改配置文件: server.properties:

```properties
# 每台服务器指定一个不同的值
broker.id=0
listeners=PLAINTEXT://:9093
log.dirs=/tmp/kafka-logs-1
```

# 拷贝安装文件

```sh
scp -r kafka* hadoop002:/home/hadoop/
scp -r kafka* hadoop003:/home/hadoop/
```

* 启动kafka, 在每台节点上执行
```sh

/home/hadoop/kafka_2.11-1.1.1/bin/kafka-server-start.sh /home/hadoop/kafka_2.11-1.1.1/config/server.properties &
```

* 创建topic
```sh
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-topics.sh --create \
    --zookeeper hadoop001:2181,hadoop002:2181,hadoop003:2181 \
    --replication-factor 2 \
    --partitions 2 \
    --topic input-test

```

* 查看全部topic

```sh
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-topics.sh --list --zookeeper hadoop001:2181,hadoop002:2181,hadoop003:2181
```

* 查看指定topic信息
```sh
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-topics.sh --describe --zookeeper hadoop001:2181,hadoop002:2181,hadoop003:2181 --topic input-test
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-topics.sh --describe --zookeeper hadoop001:2181 --topic input-test
```

* 生产数据
```sh
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-console-producer.sh --broker-list hadoop001:9092,hadoop002:9092,hadoop003:9092 --topic input-test
This is a message
```


/home/hadoop/kafka_2.11-1.1.1/bin/kafka-configs.sh --zookeeper hadoop001:2181 --describe --entity-name input-test --entity-type topics


/home/hadoop/kafka_2.11-1.1.1/bin/kafka-configs.sh --help
* 设置数据过期时间，10天
```sh
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-configs.sh --zookeeper hadoop001:2181 --entity-name input-test --entity-type topics --alter --add-config retention.ms=864000000
```