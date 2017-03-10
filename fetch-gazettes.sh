#!/bin/bash
#
# Script to echo gazettes from opengazettes.org.za into SAFLII.
#
# Uses the full JSON listing from http://archive.opengazettes.org.za/index/gazette-index-latest.jsonlines
# to generate a registry.txt file and a pdf-urls.txt file.
# Then downloads files in pdf-urls.txt that aren't already on the disk.
set -e

# get the latest master list
echo "Fetching gazette list"
rm -f gazette-index-latest.jsonlines
wget --no-verbose -a pdf-download.log http://archive.opengazettes.org.za/index/gazette-index-latest.jsonlines

# generate the Registry.txt and pdf-urls.txt files
echo "Generating Registry.txt"
python fetch-gazettes.py

# get the PDFs
echo "Downloading PDFs"
wget --no-verbose --no-clobber -i pdf-urls.txt -P Data -a pdf-download.log

echo "Done, bye."
