#cd /data/workspace/wx && nohup python3 main.py runserver --host=0.0.0.0 --port=8888 >nohup.out 2>&1 &
cd /data/workspace/wx && nohup gunicorn -w 1 -b 0.0.0.0:8888 main:app >nohup.out 2>&1 &
while true; do echo hello world; sleep 60; done
