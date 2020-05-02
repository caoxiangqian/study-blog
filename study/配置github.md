* 生成密钥
```sh
ssh-keygen -t rsa -b 4096 -C "cake234@live.com"
```
* 将生成的公钥配置到Github账户中

* 客户端设置
```sh
git config --global user.email "cake234@live.com"
git config --global user.name "caoxiangqian"
```
