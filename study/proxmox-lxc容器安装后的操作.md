1.	安装sshd服务，并设置开机启动
```sh
yum install openssh-server -y
systemctl enable sshd
systemctl start sshd
```

2.	安装java（rpm方式jdk8）
```
下载：http://www.oracle.com/technetwork/java/javase/overview/index.html
rpm -ivh jdk-8u211-linux-x64.rpm
安装目录：/usr/java
配置JAVA_HOME=/usr/java/latest
```

3.	配置root用户登录本机的ssh免密码登录
```sh
ssh-keygen
ssh-copy-id -i ~/.ssh/id_rsa.pub localhost
```

4.	安装which命令

5.	安装scala2.11.12
```
下载：https://www.scala-lang.org/download/2.11.12.html
rpm -ivh scala-2.11.12.rpm
安装目录：/usr/share/scala
配置SCALA_HOME=/usr/share/scala
```

6.	配置hosts文件

```yaml
192.168.31.170 hadoop001
192.168.31.171 hadoop002
192.168.31.172 hadoop003
192.168.31.173 hadoop004
192.168.31.174 hadoop005
192.168.31.175 hadoop006
192.168.31.176 hadoop007
192.168.31.177 hadoop008
192.168.31.178 hadoop009
192.168.31.179 hadoop010
```

7.	常用soft package
```sh
yum install which -y
yum install perl -y
yum install libaio.x86_64 -y
yum install numactl-libs.x86_64 -y
yum install net-tools -y
yum install unzip -y
yum install wget -y
yum install gcc* -y
yum install mlocate -y
```