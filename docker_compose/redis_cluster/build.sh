export REDIS_CLUSTER_IP=0.0.0.0
docker build --rm --build-arg redis_version=4.0.9 -t redis/cluster .

