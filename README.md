# reader

阅读3服务器版，不需要手机。

> Fork 自 [changshengyu/reader-dev](https://github.com/changshengyu/reader-dev) -> [hectorqin/reader](https://github.com/hectorqin/reader)，使用`v3.2.14-05250935`版本的`reader.jar`，放置在当前项目`bin/reader.jar`路径下。同时将Docker镜像中`java -jar bin/reader.jar`命令放在`/reader`路径下执行，即更换工作目录为`/reader`，让`logs`和`storage`目录统一在`/reader`目录下生成，方便 Railway 等仅支持单一 Volume 映射目录的在线服务。

[![Deploy on Railway](https://railway.com/button.svg)](https://railway.com/deploy/L8dvv7?referralCode=JrUwev&utm_medium=integration&utm_source=template&utm_campaign=generic)

## 功能

书源管理、书架管理、搜索、书海、看书、移动端适配、换源、翻页方式、手势支持、自定义主题、WebDAV 同步、文字替换过滤、听书、漫画、音频、本地书导入（TXT/EPUB/UMD/PDF）、书籍分组、RSS 订阅、定时更新书架、并发搜书、本地书仓、Kindle 阅读。

## Docker 部署

```bash
# 标准版（推荐）
docker pull endless084/reader:latest

# Slim 版
# docker pull endless084/reader:slim-latest

# OpenJ9 版（启动快、省内存）
# docker pull endless084/reader:openj9-latest
```

```bash
docker run -d \
  --name reader \
  -p 4396:8080 \
  -v /home/reader:/reader \
  -e SPRING_PROFILES_ACTIVE=prod \
  -e READER_APP_SECURE=true \
  -e READER_APP_SECUREKEY=adminpwd \
  -e READER_APP_INVITECODE=registercode \
  endless084/reader:latest
```

或使用 docker-compose：

```bash
wget https://raw.githubusercontent.com/longhuan1999/reader-dev/master/docker-compose.yaml
docker-compose up -d
```

## 自行构建

```bash
docker build -f Dockerfile.source -t reader:latest .
docker build -f Dockerfile.slim -t reader:slim-latest .
docker build -f Dockerfile.openj9 -t reader:openj9-latest .
```

## 感谢

- [changshengyu/reader-dev](https://github.com/changshengyu/reader-dev)
- [hectorqin/reader](https://github.com/hectorqin/reader)
- [阅读3.0](https://github.com/gedoor/legado)
