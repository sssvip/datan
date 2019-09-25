FROM python:3.7

MAINTAINER <David>
MAINTAINER <you>

# copy 依赖文件
#ADD requirements.txt /datan_env/requirements.txt
# 统一执行安装
# 此步骤会较慢，这里是方便维护做的妥协，如果将requirements.txt 文本拆解放进Dockerfile可以命中构建缓存，
# 加快每次构建，不过为了环境干净，初次构建的几分钟是可以接受的。
#RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir -r /datan_env/requirements.txt

# 采用全申明方式构建，可以加快每次缓存    
# notebook
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir jupyter==1.0.0
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir pyecharts==0.5.11 jupyter-echarts-pypkg==0.1.2
#sklearn
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir scikit-learn==0.19.2 pandas==0.23.4 numpy==1.16.4 seaborn==0.9.0 jieba==0.39 scipy==1.1.0 
# web及数据库
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir PyMySQL==0.9.3 Flask==1.0.2 requests==2.22.0 
# 安装并启用插件
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir jupyter_contrib_nbextensions==0.5.1
RUN jupyter contrib nbextension install --user

# 2019-09-25新增
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir DBUtils==1.3 elasticsearch==7.0.4
RUN pip install -i https://mirrors.aliyun.com/pypi/simple --no-cache-dir gevent==1.4.0 PyHamcrest==1.9.0 pyecharts_snapshot==0.2.0 echarts-countries-pypkg==0.1.6 echarts-china-provinces-pypkg==0.0.3 echarts-china-cities-pypkg==0.0.9 echarts-china-counties-pypkg==0.0.2 echarts-china-misc-pypkg==0.0.1 echarts-themes-pypkg==0.0.3

# 2019-09-25新增
ADD echarts-themes-js /root/.local/share/jupyter/nbextensions/echarts-themes-js

#前面的命令尽可能不动，每次新需求尽可能在后面加，能加快构建速度

#------------------------------------------------------新需求分割线------------------------------------------------------

# 工作空间
WORKDIR /notebookdir

# 暴露端口
EXPOSE 8888

# 默认启动命令
CMD ["sh","-C","jupyter notebook --ip='0.0.0.0' --allow-root --notebook-dir='/notebookdir' "]
