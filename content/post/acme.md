---
title: "Acme 安装及使用"
date: 2022-01-14T14:25:26+08:00
draft: false
---

# acme.sh 安装及使用
## 安装acme.sh
>curl  https://get.acme.sh | sh

>source .bashrc

安装在了~/.acme.sh/之中,如果你用的是Bash的话，最好在.bashrc文件最后添加一行,
>alias acme.sh=~/.acme.sh/acme.sh

以后直接可以使用acme.sh，稍微方便一些。

配置自动更新
acme.sh --upgrade --auto-upgrade

## 使用acme.sh获取证书

指定默认使用letsencrypt
>acme.sh --set-default-ca --server letsencrypt

>acme.sh --issue -d 你的域名 --standalone -k ec-256

>acme.sh --install-cert -d 你的域名 --fullchain-file /etc/nginx/ssl/private/你的域名.crt --key-file /etc/nginx/ssl/private/你的域名.key --ecc

或者用这个命令简单的操作
>acme.sh --issue -d 二级域名.你的域名.com -w /home/vpsadmin/www/webpage --keylength ec-256 --force

改下权限
>chmod 755 /etc/nginx/ssl/private

## 设置证书自动签
>vi /etc/nginx/ssl/private/xray-cert-renew.sh

添加以下内容，注意修改中文注释的地方
```
#!/bin/bash
.acme.sh/acme.sh --install-cert -d 你的域名 --ecc --fullchain-file  /etc/nginx/ssl/private/你的域名.crt --key-file  /etc/nginx/ssl/private/你的域名.key
echo "Xray Certificates Renewed"
chmod +r /etc/nginx/ssl/private/你的域名.key
echo "Read Permission Granted for Private Key"
sudo systemctl restart xray
echo "Xray Restarted"
```

保存后加权限
>chmod +x /etc/nginx/ssl/private/xray-cert-renew.sh

添加定时任务，更新证书
>crontab -e

添加crontab定时任务，每月1日自动申请证书
>0 1 1 * *   bash /etc/nginx/ssl/private/xray-cert-renew.sh



