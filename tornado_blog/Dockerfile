FROM base/ubuntu_python36:latest
MAINTAINER fu shen.ren.love@163.com


#安装Python环境依赖
RUN pip install --upgrade pip
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
#创建项目工作目录
RUN mkdir -p /data/workspace
#执行ADD RUN CMD等命令的工作目录
WORKDIR /data
#docker内端口可以写多个
EXPOSE 80 8888
#print()时在控制台正常显示中文 环境变量
ENV LANG C.UTF-8
ENV PYTHONIOENCODING=utf-8
CMD /bin/bash -c "echo Helloworld"
