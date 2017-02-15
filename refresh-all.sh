#!/bin/bash

date

for dir in \
  ZAGovGaz \
  ZAECPrGaz \
  ZAFSPrGaz \
  ZAGPPrGaz \
  ZALPPrGaz \
  ZAMPPrGaz \
  ZANCPrGaz \
  ZAKZPrGaz \
  ZANWPrGaz \
  ZAWCPrGaz \
  ; do
  if [ ! -d $dir ]; then continue; fi

  echo $dir
  cd /data/home/saflii/raw/$dir
  ./fetch-gazettes.sh
done
