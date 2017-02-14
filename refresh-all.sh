#!/bin/bash

date

for dir in \
  ZAGAZETTE \
  ; do
  echo $dir
  cd /data/home/saflii/raw/$dir
  ./fetch-gazettes.sh
done
