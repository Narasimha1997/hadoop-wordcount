#!/bin/sh

#$1 native or cloud
#$2 Jar File
#$3 Class File
#$4 input_dir
#$5 output_dir

NATIVE_HADOOP_PATH=/usr/local/hadoop/bin 

native="native"


if [ "$1" = "$native" ]; then
   $NATIVE_HADOOP_PATH/hadoop jar $2 $3 $4 $5

else
   gsutil cp -r $4 gs://hadoop-files
   gcloud dataproc jobs submit hadoop --cluster prasanna-mapreduce-01 \
     --class $3 \
     --jars $2  -- gs://hadoop-files/$4 gs://hadoop-files/$5
fi 
