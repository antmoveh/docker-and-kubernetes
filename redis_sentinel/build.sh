for port in `seq 6390 6392`; do \
  mkdir -p ./redis/conf \
  && PORT=${port} envsubst < ./redis.tmpl > ./redis/conf/redis-${port}.conf \
  && PORT=2${port} envsubst < ./sentinel.tmpl > ./redis/conf/redis-sentinel-2${port}.conf \
  && mkdir -p ./redis/data; \
done

echo "配置文件生成完成"
