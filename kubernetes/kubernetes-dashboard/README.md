```
kubectl apply -f kubernetes-dashboard.yaml
```
*出现open /certs/dashboard.crt: no such file or directory错误*

- 通过生成自签名证书修复此问题，过程如下
```
kubectl delete -f kubernetes-dashboard.yaml
mkdir /certs && cd /certs
openssl req -newkey rsa:4096 -nodes -sha256 -keyout dashboard.key -x509 -days 365 -out dashboard.crt
按照提示填入信息,完成后会生成dashboard.key dashboard.crt两个文件
kubectl create secret generic kubernetes-dashboard-certs --from-file=/certs -n kube-system
重新部署dashboard
kubectl apply -f kubernetes-dashboard.yaml
如此便可正常启动
```
---
- 使用浏览器https://ip:30011即可访问，自签名证书允许访问即可
- dashboard管理员登录需要token,使用如下命令生成token

```
kubectl apply -f admin-role.yaml
kubectl -n kube-system describe secret `kubectl -n kube-system get secret|grep admin-token|cut -d " " -f1`|grep "token:"|tr -s " "|cut -d " " -f2
```
- 注: token是经过base64编码的此命令获取的token可直接使用


- 参考链接
- [x] https://andrewpqc.github.io/2018/04/24/setup-k8s-dashboard-on-cluster/ 
- [x] https://jimmysong.io/kubernetes-handbook/practice/dashboard-upgrade.html
- [x] https://github.com/rootsongjc/kubernetes-handbook/tree/master/manifests/dashboard-1.7.1