cd /data/workspace/blog && nohup python3 main.py --master=true --port=9090 >nohup.out 2>&1 &
while true; do echo ...; sleep 60; done
