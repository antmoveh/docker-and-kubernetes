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
CMD /bin/bash -c "echo Helloworld"
