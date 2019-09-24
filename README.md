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

### Notebook测试代码块

```python
from sklearn.datasets import load_iris
dataset = load_iris()
from pyecharts import Line
chart = Line("test")
chart.add("t",dataset.data[0],dataset.data[1])
chart

```

### 启动预加载代码块映射测试

docker run -it --rm -p 8888:8888  -v test.py:/root/.ipython/profile_default/startup/01-test.py datan:${version} jupyter notebook --ip='0.0.0.0' --allow-root


### 自动重启

docker run --name datan -d -p 8888:8888 -v test.py:/root/.ipython/profile_default/startup/01-test.py --restart=always datan:${version} jupyter notebook --ip='0.0.0.0' --allow-root


### 自动重启并取消密码 

docker run --name datan -d -p 8888:8888 -v jupyter_notebook_config.py:/root/.jupyter/jupyter_notebook_config.py -v test.py:/root/.ipython/profile_default/startup/01-test.py --restart=always datan:${version} jupyter notebook --ip='0.0.0.0' --allow-root


### 优势

1. 环境标准，流程标准，随时恢复到可用版本，不用担心环境被pip等导致错乱
2. 无忧自动重启机制
