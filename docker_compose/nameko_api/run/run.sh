#cd /data/workspace/wx && nohup python3 main.py runserver --host=127.0.0.1 --port=8888 >nohup.out 2>&1 &
cd /data/workspace/collection/api && nohup manage run --port=8888 --host=0.0.0.0 --debug --use_reloader >nohup.out 2>&1 &
#cd /data/workspace/invoice/api && nohup manage run --port=8889 --host=0.0.0.0 --debug --use_reloader >nohup.out 2>&1 &
cd /data/workspace/cms/api && nohup manage run --port=8889 --host=0.0.0.0 --debug --use_reloader >nohup.out 2>&1 &
while true; do echo hello world; sleep 60; done
