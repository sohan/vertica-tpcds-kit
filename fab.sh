#!/bin/bash
source tpcds-env.sh

for h in `cat dn.txt`; do
  ssh $SSH_OPTS $CLUSTER_USER@$h "$@"
done
