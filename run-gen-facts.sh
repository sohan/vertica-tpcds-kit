#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line

cat dn.txt | while read h
do 
  ssh $h "cd $CLUSTER_HOMEDIR/$MPP_TPCDS_DIR; ./gen-facts.sh" < /dev/null &
done
