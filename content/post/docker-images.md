---
title: "Docker镜像的导入和导出"
date: 2022-01-18T14:35:31+08:00
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
# thumbnail: "img/placeholder.png" # Thumbnail image
# lead: "Example lead - highlighted near the title" # Lead text
# comments: false # Enable Disqus comments for specific page
# sidebar: "right" # Enable sidebar (on the right side) per page
# widgets: # Enable sidebar widgets in given order per page
#   - "search"
#   - "recent"
#   - "taglist"
---

### Docker 镜像的导出和导入
##### 保存镜像
使用docker save命令，保存镜像到本地。
```
docker save -o rocketmq.tar rocketmq
```
> -o：指定保存的镜像的名字；
> rocketmq.tar：保存到本地的镜像名称；
> rocketmq：镜像名字，通过"docker images"查看

##### 载入镜像
有了本地的镜像文件，在需要的时候可以使用docker load将本地保存的镜像导入docker中。
```
docker load --input rocketmq.tar 
或 
docker load < rocketmq.tar
```

##### 导出容器

```
docker export -o rocketmq.tar rocketmq
```
> -o :将输入内容写到文件。

##### 导入容器
```
docker import rocketmq.tar rocketmq
```

### 两种方法的区别
>export命令导出的tar文件略小于save命令导出的；
>export 导出(import导入)是根据容器拿到的镜像，再导入时会丢失镜像所有的历史，所以无法进行回滚操作(docker tag )；
>而save保存(load加载)的镜像，没有丢失镜像的历史，可以回滚到之前的层(layer)。(查看方式：docker images —tree)

### 适用场景
>若是只想备份images，使用save、load即可。
>若是在启动容器后，容器内容有变化，需要备份，则使用export、import。