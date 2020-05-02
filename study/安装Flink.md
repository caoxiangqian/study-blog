# 安装Flink

* Flink下载

https://flink.apache.org/downloads.html



# standalone模式安装

* 修改配置文件

```yaml
# flink-conf.yaml

jobmanager.rpc.address: hadoop001

```

```yaml
# slaves

hadoop001
hadoop002
hadoop003
```

* 拷贝安装文件
```
scp -r flink* hadoop002:/home/hadoop/
scp -r flink* hadoop003:/home/hadoop/
```

* 启动Flink集群

```shell
bin/start-cluster.sh
```

* Flink dashboard

http://hadoop001:8081/#/overview
测试提交一个新任务



# yarn模式启动
```sh
export HADOOP_CLASSPATH=/home/hadoop/hadoop-2.9.2/etc/hadoop:/home/hadoop/hadoop-2.9.2/share/hadoop/common/lib/*:/home/hadoop/hadoop-2.9.2/share/hadoop/common/*:/home/hadoop/hadoop-2.9.2/share/hadoop/hdfs:/home/hadoop/hadoop-2.9.2/share/hadoop/hdfs/lib/*:/home/hadoop/hadoop-2.9.2/share/hadoop/hdfs/*:/home/hadoop/hadoop-2.9.2/share/hadoop/yarn:/home/hadoop/hadoop-2.9.2/share/hadoop/yarn/lib/*:/home/hadoop/hadoop-2.9.2/share/hadoop/yarn/*:/home/hadoop/hadoop-2.9.2/share/hadoop/mapreduce/lib/*:/home/hadoop/hadoop-2.9.2/share/hadoop/mapreduce/*:/home/hadoop/hadoop-2.9.2/contrib/capacity-scheduler/*.jar

export HADOOP_CLASSPATH=`hadoop classpath`
echo $HADOOP_CLASSPATH

yarn-session.sh -n 2 -s 2 -jm 1024 -tm 1024 -nm FlinkSession -d

yarn application -kill application_1586145938857_0007


flink run -m yarn-cluster $FLINK_HOME/examples/batch/WordCount.jar
```

* flink 1.10.0
```sh
yarn-session.sh -jm 1024m -tm 1024m

flink run -m yarn-cluster -p 4 -yjm 1024m -ytm 1024m $FLINK_HOME/examples/batch/WordCount.jar
```




https://www.apache.org/dyn/closer.lua/flink/flink-1.6.4/flink-1.6.4-bin-scala_2.11.tgz



# flink编译

```sh
mvn clean install -DskipTests -Dfast
mvn clean install -DskipTests -Dfast -Dhadoop.version=2.8.3 -Dscala.version=2.11.12


mvn clean install -DskipTests -Dfast -Pinclude-hadoop -Dhadoop.version=2.8.3 -Dscala.version=2.11.12

mvn clean install -DskipTests -Drat.skip=true  -Dhadoop.version=2.7.2 -Dscala-2.12
```




