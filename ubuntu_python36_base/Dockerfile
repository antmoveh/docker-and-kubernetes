FROM ubuntu:latest
MAINTAINER fu shen.ren.love@163.com
#用ubuntu国内源替换默认源
RUN rm /etc/apt/sources.list
COPY sources.list /etc/apt/sources.list

#安装python3.6必要的包。源镜像太精简了，ip ifconfig之类的都没有。后续安装python pip也需要一些。但是build_essential似乎不必须，先去了。如果后面安装numpy之类需要gcc了，再加上
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
#RUN apt-get install -y apt-transport-https vim iproute2 net-tools build-essential ca-certificates curl wget software-properties-common
RUN apt-get install -y apt-transport-https vim iproute2 net-tools ca-certificates curl wget software-properties-common

#安装python3.6 来自第三方
RUN add-apt-repository ppa:jonathonf/python-3.6
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install -y python3.6
RUN apt install -y python3.6-dev
RUN apt install -y python3.6-venv
#为3.6安装pip
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3.6 get-pip.py
#和自带的3.5共存
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.5 1
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.6 2
RUN update-alternatives --config python3
#安装Python环境依赖
ADD requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt
#创建项目工作目录
#RUN mkdir -p /data/workspace
#执行ADD RUN CMD等命令的工作目录
#WORKDIR /data
#docker内端口可以写多个
#EXPOSE 80
#print()时在控制台正常显示中文 环境变量
ENV PYTHONIOENCODING=utf-8
# 配置容器启动会执行的命令，不可被docker run 提供的参数覆盖
# ENTRYPOINT command param1 param2
# 创建一个可以从本地主机或其他容器挂载的挂载点，一般用来存放数据库和需要保持的数据等
# VOLUME["/data"]
# 指定容器运行时的用户名或UID
# USER deamon
# 配置当前镜像作为其他镜像的基础镜像时，所执行的命令
# ONBUILD ADD ./app/src 等价于在新镜像中添加ADD命令
#容器启动时运行脚本
COPY run.sh /bin/run.sh
RUN chmod +x /bin/run.sh
CMD /bin/bash -c /bin/run.sh
