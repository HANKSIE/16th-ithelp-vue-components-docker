# 用途
建立 [Mini-ghost/16th-ithelp-vue-components](https://github.com/Mini-ghost/16th-ithelp-vue-components.git) Docker 運行環境

# 環境依賴
- Bash
- Docker

# 開始您的atomic vue component之旅
```
cp .env.example .env && ./bin/god up
```

# 可用指令

### docker build + docker run
```
./bin/god up
```

### docker stop + docker rm
```
./bin/god down
```

### docker start
```
./bin/god start
```

### docker stop
```
./bin/god stop
```

### docker stop + docker rm + docker rmi
```
./bin/god reset
```