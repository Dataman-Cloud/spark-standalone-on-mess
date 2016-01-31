#! /bin/bash

bin/spark-class org.apache.spark.deploy.worker.Worker -p ${SPARK_WORKER_PORT} ${SPARK_MASTER_URL}