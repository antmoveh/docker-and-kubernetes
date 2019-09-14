cd /data/workspace/collection/service && nohup nameko run service  --broker amqp://guest:guest@172.17.43.109 > nohup.out 2>&1 &
#cd /data/workspace/invoice/service && nohup nameko run service  --broker amqp://guest:guest@172.17.43.109 > nohup.out 2>&1 &
cd /data/workspace/cms/service && nohup nameko run service  --broker amqp://guest:guest@172.17.43.109 > nohup.out 2>&1 &
while true; do echo hello world; sleep 60; done
