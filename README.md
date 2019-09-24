# datan


### 本地构建测试

```bash
$ sh build.sh ${version}  #示例：构建0.1版本 -> sh build.sh 0.1

脚本源码 docker build -t datan:$1 .
```

### 本地启动测试

```bash
$ sh start-test.sh ${version} #示例：启动0.1版本 sh start-test.sh 0.1

脚本源码 docker run -it --rm -p 8888:8888 datan:$1 jupyter notebook --ip='0.0.0.0' --allow-root 
```

