# spark-standalone-on-mess

在数人云上部署一个 standalone 模式的 spark。

* spark 版本：1.6.0-hadoop2.6  
* scala 版本：2.10.4

## 1 数人云应用部署

1. Spark master:

	镜像：index.shurenyun.com/spark-master:1.6.0-hadoop2.6.0  
	
	应用模式：HOST

2. Spark slave:

	镜像：index.shurenyun.com/spark-slave:1.6.0-hadoop2.6.0  
	
	应用模式：HOST
	
	环境变量：SPARK_MASTER_URL=spark://spark-master-ip:port  

## 2 ZOOKEEPER 配置

如果 master 需要通过 zookeeper 做高可用，需要增加以下环境变量  

```SPARK_DAEMON_JAVA_OPTS="-Dspark.deploy.recoveryMode=ZOOKEEPER -Dspark.deploy.zookeeper.url=zk-ip1:2181,zk-ip2:2181,zk-ip3:2181"```  

同时，slave 的变量取值为

```SPARK_MASTER_URL=spark://spark-master-ip1:7077,spark-master-ip2:7077 ```  
  
## 3 测试  

1. 访问以下网址，可以查看 spark 集群状态：

```http://spark-master-ip:8080```  

2. 通过以下命令启动 spark-shell：

```bin/spark-shell --master=${SPARK_MASTER_URL}```
