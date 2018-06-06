docker build 根据Dockerfile创建镜像
docker run -i -t ubuntu /bin/bash 根据镜像创建容器



拉取镜像和创建容器 docker-compose up -d


docker network create docker_net


docker network connect docker_net container_name


docker服务位于同一网络下可以互相访问
