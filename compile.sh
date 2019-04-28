#!/bin/sh

HADOOP_CORE_JAR="hadoop-core-1.1.2.jar"
HADOOP_RUNTIME="/usr/local/hadoop/bin/"


mkdir classes

echo "Compiling $1"
javac -classpath $HADOOP_CORE_JAR -d classes $1

echo "Creating .jar"
jar -cvf $2.jar -C classes/ .





