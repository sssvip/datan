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

docker run -it --rm -p 8888:8888  -v test.py:/root/.ipython/profile_default/startup/01-test.py datan:$1 jupyter notebook --ip='0.0.0.0' --allow-root