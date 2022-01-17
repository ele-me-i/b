---
title: "Debian11 Docker"
date: 2022-01-17T16:56:29+08:00
draft: false
# description: "Example article description"
categories:
  - "Linux"
  - "Debian11"
tags:
  - "Docker"
  - "Docker-Compose"
# menu: main # Optional, add page to a menu. Options: main, side, footer

# Theme-Defined params
thumbnail: "img/placeholder.png" # Thumbnail image
# lead: "Example lead - highlighted near the title" # Lead text
# comments: false # Enable Disqus comments for specific page
# sidebar: "right" # Enable sidebar (on the right side) per page
# widgets: # Enable sidebar widgets in given order per page
#   - "search"
#   - "recent"
#   - "taglist"
---

### 更新系统包和必要的依赖项
>sudo apt update
>sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common

#### 安装 Docker
使用arch查看arch类型(e.g. arm64 / amd64)
将Docker CE存储库添加到APT中
```
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
```

执行安装
```
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io
sudo systemctl status docker
docker -v
```

#### 安装 Docker-Compose
方法一
```
sudo curl -L "https://github.com/docker/compose/releases/download/v2.2.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
```
方法二

```
sudo apt update
sudo apt install -y python3-pip libffi-dev
sudo pip3 install docker-compose
```
docker-compose 组合命令

运行 docker-compose.yml 文件

>docker-compose up -d

停止所有正在运行的容器

>docker-compose down

暂停和取消正在运行的容器

>docker-compose pause
>docker-compose unpause

列出所有正在运行的容器

>docker-compose ps

检查驱动服务的日志

>docker-compose logs

#### 其他
启用IPv6
```
echo "iface ens3 inet6 dhcp" >> /etc/network/interfaces
reboot
```