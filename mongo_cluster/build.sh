rm -r ./run/run.sh


host="172.17.43.109"




p=""
echo "# 配置服务集" >> ./run/run.sh
for port in `seq 28002 28004`; do \
    mkdir -p md/config/${port}/log \
    && mkdir -p md/config/${port}/db \
    && PORT=${port} envsubst < ./conf/config.tmpl > ./md/config/${port}/config.conf
    echo "numactl --interleave=all mongod --config /md/config/${port}/config.conf" >> ./run/run.sh
    p=${p}${port}
done
echo -e "\n" >> ./run/run.sh
host=${host} id="configs" port0=${p:0:5} port1=${p:5:5} port2=${p:10:5} envsubst < ./conf/replicaset.tmpl >> replicaset.sh




p=""
shard="shard1"
echo "# 分片1服务集" >> ./run/run.sh
for port in `seq 28005 28007`; do \
    mkdir -p md/${shard}/${port}/log \
    && mkdir -p md/${shard}/${port}/db \
    && PORT=${port} name=${shard} envsubst < ./conf/shard.tmpl > ./md/${shard}/${port}/${shard}.conf
    echo "numactl --interleave=all mongod --config /md/${shard}/${port}/${shard}.conf" >> ./run/run.sh
    p=${p}${port}
done
echo -e "\n" >> ./run/run.sh
host=${host} id=${shard} port0=${p:0:5} port1=${p:5:5} port2=${p:10:5} envsubst < ./conf/replicaset.tmpl >> replicaset.sh




p=""
shard="shard2"
echo "# 分片2服务集" >> ./run/run.sh
for port in `seq 28008 28010`; do \
    mkdir -p md/${shard}/${port}/log \
    && mkdir -p md/${shard}/${port}/db \
    && PORT=${port} name=${shard} envsubst < ./conf/shard.tmpl > ./md/${shard}/${port}/${shard}.conf
    echo "numactl --interleave=all mongod --config /md/${shard}/${port}/${shard}.conf" >> ./run/run.sh
    p=${p}${port}
done
echo -e "\n" >> ./run/run.sh
host=${host} id=${shard} port0=${p:0:5} port1=${p:5:5} port2=${p:10:5} envsubst < ./conf/replicaset.tmpl >> replicaset.sh



p=""
shard="shard3"
echo "# 分片3服务集" >> ./run/run.sh
for port in `seq 28011 28013`; do \
    mkdir -p md/${shard}/${port}/log \
    && mkdir -p md/${shard}/${port}/db \
    && PORT=${port} name=${shard} envsubst < ./conf/shard.tmpl > ./md/${shard}/${port}/${shard}.conf
    echo "numactl --interleave=all mongod --config /md/${shard}/${port}/${shard}.conf" >> ./run/run.sh
    p=${p}${port}
done
echo -e "\n" >> ./run/run.sh
host=${host} id=${shard} port0=${p:0:5} port1=${p:5:5} port2=${p:10:5} envsubst < ./conf/replicaset.tmpl >> replicaset.sh

chmod +x replicaset.sh

echo "while true; do echo hello world; sleep 60; done" >> ./run/run.sh
echo "配置文件生成完成"
