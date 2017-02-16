#!/bin/bash

date

for name in \
  ZAGovGaz \
  ZAECPrGaz \
  ZAFSPrGaz \
  ZAGPPrGaz \
  ZALMPrGaz \
  ZAMPPrGaz \
  ZANCPrGaz \
  ZAKZPrGaz \
  ZANWPrGaz \
  ZAWCPrGaz \
  ; do
  dir=/data/home/saflii/raw/$name
  if [ ! -d $dir ]; then continue; fi

  echo $name
  cd $dir
  ./fetch-gazettes.sh
done
