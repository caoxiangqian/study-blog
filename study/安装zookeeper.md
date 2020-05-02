# 安装zookeeper

http://zookeeper.apache.org/doc/current/zookeeperStarted.html#sc_RunningReplicatedZooKeeper


* 添加配置

* zoo.cfg

```
tickTime=2000
initLimit=10
syncLimit=5
dataDir=/tmp/zookeeper
clientPort=2181
dataDir=/home/hadoop/zookeeper3.6/data
server.1=hadoop001:2888:3888
server.2=hadoop002:2888:3888
server.3=hadoop003:2888:3888
```

* 在data目录添加myid文件



* 拷贝安装文件

```sh
scp -r zookeeper* .bash_profile hadoop002:/home/hadoop/
scp -r zookeeper* .bash_profile hadoop003:/home/hadoop/
```

* 启动

* 在每个节点上执行
```shell
/home/hadoop/zookeeper3.6/bin/zkServer.sh start
```
```
zkServer.sh stop
zkCli.sh -server hadoop001:2181,hadoop003:2181,hadoop002:2181
```

* 设置权限
```
setAcl /test/zk ip:192.168.31.172:cdrwa
```

zkServer.sh status

