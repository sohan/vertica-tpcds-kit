#!/bin/bash
source tpcds-env.sh

for h in `cat dn.txt`; do
  ssh $CLUSTER_USER@$h "$@"
done
