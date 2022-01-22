---
title: "无网环境用Rpm包安装Docker"
date: 2022-01-22T16:25:08+08:00
draft: false
# description: "Example article description"
categories:
  - "Linux"
  - "Docker"
tags:
  - "Docker"
  - "Docker-Compose"
  - "Docker Rpm"
# menu: main # Optional, add page to a menu. Options: main, side, footer

# Theme-Defined params
# thumbnail: "img/placeholder.png" # Thumbnail image
# lead: "Example lead - highlighted near the title" # Lead text
# comments: false # Enable Disqus comments for specific page
# sidebar: "right" # Enable sidebar (on the right side) per page
# widgets: # Enable sidebar widgets in given order per page
#   - "search"
#   - "recent"
#   - "taglist"
---

### 无网环境用Rpm包安装Docker
找一台可以联网的linux，下载docker的RPM依赖包而不进行安装（yum localinstall），将所有依赖的rpm环境打包好，再在无网环境中解压逐一安装（rpm: --force --nodeps）。
##### 系统版本：
> cat /etc/redhat-release

##### 添加软件源信息：
> yum-config-manager --add-repo http://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo

##### 更新 yum 缓存：
> yum makecache fast

##### 下载所有安装依赖到指定路径下：
```
mkdir -p  /home/dockerrpm/
yum install docker-ce --downloadonly --downloaddir=/home/dockerrpm/
```
解释：标准的yum命令提供了 --downloadonly(只下载，不安装) 的选项来达到这个目的。


下载的docker 依赖包很多，有110M。

##### 将所有依赖的rpm环境打包：
> tar czvf docker-ce-20.tar.gz ./dockerrpm/*

##### 无网环境安装：
创建安装脚本(install.sh)：
```
#! /bin/bash
tar xzvf docker-ce-20.tar.gz && cd dockerrpm && rpm -ivh *.rpm --force --nodeps
```
##### 解释：
前两步：解压，打开依赖文件夹
参数解释：
> rpm -ivh *.rpm --force --nodeps  
1.--nodeps 就是安装时不检查依赖关系，比如你这个rpm需要A，但是你没装A，这样你的包就装不上，用了--nodeps你就能装上了。  
2.--force 就是强制安装，比如你装过这个rpm的版本1，如果你想装这个rpm的版本2，就需要用--force强制安装。  

##### 查看docker状态：
> systemctl status docker


##### 参考文章：
Docker CE 镜像源站
https://developer.aliyun.com/article/110806  
教你如何在 CentOS 7 下 yum 方式安装 Docker 环境  
https://www.linuxprobe.com/centos-7-yum-docker.html  
How to use yum to download a RPM package without installing it  
https://www.xmodulo.com/yum-download-rpm-package.html  
https://linux.cn/article-5100-1.html  
rpm忽略依赖，强制安装  
https://www.cnblogs.com/guanghuiqq/p/13298267.html  
https://blog.csdn.net/xufengzhu/article/details/81131032  
