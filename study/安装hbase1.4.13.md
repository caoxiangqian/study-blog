# 安装hbase

https://hbase.apache.org/book.html#distributed


* 配置

* hbase-env.sh
```sh
export JAVA_HOME=/usr/java/jdk1.8.0_211-amd64/
export HBASE_MANAGES_ZK=false
```

* hbase-site.xml
```xml
<configuration>
	<property>
	  <name>hbase.cluster.distributed</name>
	  <value>true</value>
	</property>
	<property>
	  <name>hbase.rootdir</name>
	  <value>hdfs://hadoop001:9000/hbase</value>
	</property>
	<property>
		<name>hbase.zookeeper.quorum</name>
		<value>hadoop001:2181,hadoop002:2181,hadoop003:2181</value>
	  </property>
	<property>
	  <name>hbase.unsafe.stream.capability.enforce</name>
	  <value>false</value>
	</property>
</configuration>
```

* regionservers
```yaml
hadoop002
hadoop003
```


* 拷贝安装文件
```sh
scp -r hbase* .bash_profile hadoop002:/home/hadoop/
scp -r hbase* .bash_profile hadoop003:/home/hadoop/
```

* 清理hbase安装数据

* 删除zookeeper节点
```sh
echo 'deleteall /hbase' | /home/hadoop/zookeeper-3.5.5/bin/zkCli.sh -server hadoop001:2181,hadoop003:2181,hadoop002:2181
```
* 删除hbase数据目录
```sh
hdfs dfs -rm -r /hbase
```



* HMaster UI
http://hadoop001:16010/master-status


```sql
create 'table',{NAME=>'info',COMPRESSION=>'SNAPPY'}
create 'CXQ_TEST_ONE', {NAME=>'f',COMPRESSION=>'GZ'}

put 'CXQ_TEST_ONE','ab-123','f:id','123'

count 'CXQ_TEST_ONE'
```

https://www.apache.org/dyn/closer.lua/spark/spark-1.6.3/spark-1.6.3-bin-hadoop2.6.tgz
http://archive.apache.org/dist/spark/spark-1.6.3/spark-1.6.3-bin-hadoop2.6.tgz
http://mirrors.tuna.tsinghua.edu.cn/apache/spark/spark-1.6.3/spark-1.6.3-bin-hadoop2.6.tgz