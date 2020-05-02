
# 配置开机运行脚本

```shell

crontab -u hadoop -e

@reboot sleep 10s && /home/hadoop/boot/start_cluster.sh

```

# 拷贝脚本文件

scp -r boot hadoop002:/home/hadoop/
scp -r boot hadoop003:/home/hadoop/



# 配置zookeeper开机启动

* 在zookeeper的每个节点的开机运行的脚本添加启动zookeeper的指令

```sh

# start zookeeper server
/home/hadoop/zookeeper3.6/bin/zkServer.sh start

```

# 配置kafka开机启动

* 在每个节点的开机运行的脚本添加启动kafka的指令

```sh

# start kafka
sleep 10
rm /tmp/kafka-logs/.lock
/home/hadoop/kafka_2.11-1.1.1/bin/kafka-server-start.sh /home/hadoop/kafka_2.11-1.1.1/config/server.properties &

```











# 配置hadoop开机启动

```sh
# start hdfs
/home/hadoop/hadoop-2.9.2/sbin/start-dfs.sh
# start yarn
/home/hadoop/hadoop-2.9.2/sbin/start-yarn.sh

```

```shell

crontab -u hadoop -e

@reboot sleep 30s && /home/hadoop/boot/start_hadoop.sh

```



# 配置hbase开机启动

```sh
# start hbase
/home/hadoop/hbase-1.4.13/bin/start-hbase.sh

```

```shell

crontab -u hadoop -e

@reboot sleep 60s && /home/hadoop/boot/start_hbase.sh

```


