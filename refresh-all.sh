#!/bin/bash

for dir in \
  ZAGAZETTE \
  ; do
  cd /data/home/saflii/raw/$dir
  ./fetch-gazettes.sh
done
