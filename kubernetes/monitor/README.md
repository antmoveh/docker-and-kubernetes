

```
kubectl apply -f prometheusAccount.yaml
kubectl apply -f prometheusConfig.yaml
kubectl apply -f prometheusServer.yaml
kubectl apply -f grafana.yaml
```

- 部署完成后打开prometheus和grafana页面
- grafana默认admin:admin
- 配置数据源选择prometheus 连接服务选server 填入prometheus地址
- 添加dashboard 选择315模板即可显示监控图标

- 参考链接
- [x] http://www.sunhaojie.com/archives/737
- [x] https://blog.51cto.com/kaliarch/2160569
- [x] https://github.com/redhatxl/k8s-prometheus-grafana