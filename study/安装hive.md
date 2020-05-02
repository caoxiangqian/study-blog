* 安装hive 1.2.2

hive 2.3.6

* 配置文件
```sh
cd hive-2.3.2/conf
cp hive-log4j2.properties.template hive-log4j2.properties
cp hive-default.xml.template hive-site.xml
cp hive-env.sh.template hive-env.sh
cp hive-exec-log4j2.properties.template hive-exec-log4j2.properties
```

* 初始化元数据
```sh
schematool -initSchema -dbType mysql
```
* 查看初始化的信息
```sh
schematool -dbType mysql -info
```

* 执行hive命令
```sql
hive> create table test(id int,name string);
hive> show tables;
```

* 查看hdfs目录
```sql
hdfs dfs -ls /user
hdfs dfs -ls -R /user/hive
```

* 后台启动hiveserver2
```sh
nohup hiveserver2 > hiveserver2.log 2>&1 &

nohup ./hiveserver2 > hiveserver2.log 2>&1 &
```



* beeline
```sh
beeline

!connect jdbc:hive2://hadoop001:10000
root
hadooppwd


!connect jdbc:hive2://hadoop01:10000
```

```sh
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
/home/hadoop/soft/spark163/bin/spark-submit \
--master yarn \
--class cxq.sparkreadhive.HiveJdbcTest \
/home/hadoop/test/spark-read-hbase-0.1-jar-with-dependencies.jar


hadoop jar /home/hadoop/test/spark-read-hbase-0.1-jar-with-dependencies.jar cxq.sparkreadhive.HiveJdbcTest


export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
/home/hadoop/soft/spark163/bin/spark-submit \
--master yarn \
--class cxq.sparkreadhive.HiveJdbcTest2 \
/home/hadoop/test/spark-read-hbase-0.1-jar-with-dependencies.jar
```




```sql
messagekey,id,name,address,homeCity

create table test_parquet(
homeCity string,
messagekey string,
id string,
address string,
name string
) 
partitioned by(dt string)
stored as parquet



load data inpath '/user/caoxiangqian/testparquet/' into table test_parquet partition(dt=20191107)

set hive.cli.print.header=true;
set hive.resultset.use.unique.column.names=false;
select * from test_parquet;


dfs -cp /user/caoxiangqian/testparquet/_metadata /user/hive014/warehouse/test_parquet/dt=20191107/
```

