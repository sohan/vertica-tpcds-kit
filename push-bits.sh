#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line
set -e

cat dn.txt | while read h
do
  rsync -avz $HOME/tpcds-kit $h:$HOME
  rsync -avz $HOME/impala-tpcds-kit $h:$HOME
done
