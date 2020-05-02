# mysql安装
* 下载： mysql-8.0.16-2.el7.x86_64.rpm-bundle.tar        

* 安装依赖软件
```sh
yum install perl -y
yum install libaio.x86_64 -y
yum install numactl-libs.x86_64 -y
yum install net-tools -y

# rpm -ivh mysql-community-embedded-compat-8.0.16-2.el7.x86_64.rpm
# rpm -ivh mysql-community-libs-compat-8.0.16-2.el7.x86_64.rpm
# rpm -ivh mysql-community-test-8.0.16-2.el7.x86_64.rpm
# rpm -ivh mysql-community-devel-8.0.16-2.el7.x86_64.rpm

rpm -ivh mysql-community-common-8.0.16-2.el7.x86_64.rpm  
rpm -ivh mysql-community-libs-8.0.16-2.el7.x86_64.rpm
rpm -ivh mysql-community-client-8.0.16-2.el7.x86_64.rpm
rpm -ivh mysql-community-server-8.0.16-2.el7.x86_64.rpm

```

* 修改密码
```sql
alter user 'root'@'localhost' identified by 'mypwd';
```


* mysql 5.6
```sh
rpm -ivh MySQL-devel-5.6.44-1.el7.x86_64.rpm
rpm -ivh MySQL-embedded-5.6.44-1.el7.x86_64.rpm

rpm -ivh MySQL-shared-5.6.44-1.el7.x86_64.rpm
rpm -ivh MySQL-shared-compat-5.6.44-1.el7.x86_64.rpm
rpm -ivh MySQL-test-5.6.44-1.el7.x86_64.rpm

rpm -ivh MySQL-client-5.6.44-1.el7.x86_64.rpm
rpm -ivh MySQL-server-5.6.44-1.el7.x86_64.rpm
```


# 安装5.7
* 卸载5.6
```sh
rpm -qa | grep -i mysql | xargs rpm -ev --nodeps
```
* 安装5.7
```sh
rpm -ivh mysql-community-common-5.7.28-1.el7.x86_64.rpm
rpm -ivh mysql-community-libs-5.7.28-1.el7.x86_64.rpm
rpm -ivh mysql-community-client-5.7.28-1.el7.x86_64.rpm
rpm -ivh mysql-community-server-5.7.28-1.el7.x86_64.rpm
```
