redis-server /opt/redis/conf/redis-6390.conf &&
redis-server /opt/redis/conf/redis-6391.conf &&
redis-server /opt/redis/conf/redis-6392.conf &&

redis-cli -h 0.0.0.0 -p 6391 slaveof 127.0.0.1 6390 &&
redis-cli -h 0.0.0.0 -p 6392 slaveof 127.0.0.1 6390 &&

redis-sentinel /opt/redis/conf/redis-sentinel-26390.conf &
redis-sentinel /opt/redis/conf/redis-sentinel-26391.conf &
redis-sentinel /opt/redis/conf/redis-sentinel-26392.conf &
while true; do echo hello world; sleep 60; done
