
* lxc模板路径

`
/var/lib/vz/template/cache
`
* Iso文件路径

`
/var/lib/vz/template/iso
`

* 查看可用模板
```
pveam available
pveam list local
```

* 下载模板：
```
pveam download local ubuntu-18.10-standard_18.10-2_amd64.tar.gz
```

```
禁用服务
Systemctl disable serviceName
停止服务
Systemctl stop serviceName
```

# 网络配置
```
/etc/sysconfig/network-scripts
ONBOOT=yes
BOOTPROTO=static
IPADDR=192.168.31.173
NETMASK=255.255.255.0
GATEWAY=192.168.31.1
```

# Kvm安装完centos8后操作

* 安装tar
```
yum install tar.x86_64 -y
```
* 安装jdk8, jdk13
```
/usr/java
ln -s jdk-13.0.2/ latest
ln -s jdk-13.0.2/ default
```

* 配置全局环境变量
```sh
/etc/profile

export JAVA_HOME=/usr/java/latest
export PATH=$PATH:$JAVA_HOME/bin
```



