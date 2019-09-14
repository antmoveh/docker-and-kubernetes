# 配置服务集
numactl --interleave=all mongod --config /md/config/28002/config.conf
numactl --interleave=all mongod --config /md/config/28003/config.conf
numactl --interleave=all mongod --config /md/config/28004/config.conf


# 分片1服务集
numactl --interleave=all mongod --config /md/shard1/28005/shard1.conf
numactl --interleave=all mongod --config /md/shard1/28006/shard1.conf
numactl --interleave=all mongod --config /md/shard1/28007/shard1.conf


# 分片2服务集
numactl --interleave=all mongod --config /md/shard2/28008/shard2.conf
numactl --interleave=all mongod --config /md/shard2/28009/shard2.conf
numactl --interleave=all mongod --config /md/shard2/28010/shard2.conf


# 分片3服务集
numactl --interleave=all mongod --config /md/shard3/28011/shard3.conf
numactl --interleave=all mongod --config /md/shard3/28012/shard3.conf
numactl --interleave=all mongod --config /md/shard3/28013/shard3.conf


while true; do echo hello world; sleep 60; done
