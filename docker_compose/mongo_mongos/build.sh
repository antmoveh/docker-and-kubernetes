

rm -r ./run/run.sh

confdb="172.17.43.109:28002,172.17.43.109:28003,172.17.43.109:28004"
echo "# mongos" >> ./run/run.sh
for port in `seq 28020 28021`; do \
    mkdir -p md/mongos/${port}/log \
    && PORT=${port} conf=${confdb} envsubst < ./conf/mongos.tmpl > ./md/mongos/${port}/mongos.conf
    echo "mongos --config /md/mongos/${port}/mongos.conf" >> ./run/run.sh 
done

echo -e "\n" >> ./run/run.sh
echo "while true; do echo hello world; sleep 60; done" >> ./run/run.sh


host="172.17.43.109" envsubst < ./conf/addshard.tmpl > addshard.sh

chmod +x addshard.sh


echo "配置文件生成完成"
