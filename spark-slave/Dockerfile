FROM		centos:7
MAINTAINER	Yue Ma <yma@dataman-inc.com>

ENV		SPARK_MASTER_PORT=7077
ENV		SPARK_MASTER_WEBUI_PORT=8080
ENV		SPARK_WORKER_CORES=1
ENV		SPARK_WORKER_INSTANCES=1
ENV		SPARK_WORKER_MEMORY=2g
ENV		SPARK_WORKER_PORT=7078

RUN		yum -y update && \
		yum -y install java-1.7.0-openjdk.x86_64

ENV		JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-1.7.0.95-2.6.4.0.el7_2.x86_64/jre
ENV		PATH=$PATH:$JAVA_HOME/bin

RUN		curl -o scala-2.10.4.tgz http://www.scala-lang.org/files/archive/scala-2.10.4.tgz && \
		tar -zxf scala-2.10.4.tgz && \
		mv scala-2.10.4 /usr/lib && \
		ln -s /usr/lib/scala-2.10.4 /usr/lib/scala && \
		rm -rf scala-2.10.4.tgz

ENV		SCALA_HOME=/usr/lib/scala
ENV		PATH=$PATH:$SCALA_HOME/bin

RUN		curl -o spark-1.6.0-bin-hadoop2.6.tgz http://apache.fayea.com/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz && \
		tar -zxf spark-1.6.0-bin-hadoop2.6.tgz && \
		mkdir -p /opt/spark/dist && \
		mv spark-1.6.0-bin-hadoop2.6/* /opt/spark/dist && \
		rm -rf spark-1.6.0-bin-hadoop2.6.tgz

# TCP 7078
# TCP 8081
EXPOSE		7078 8081

WORKDIR		/opt/spark/dist

ADD		slave-entrypoint.sh /opt/spark/dist/slave-entrypoint.sh

CMD		["./slave-entrypoint.sh"]