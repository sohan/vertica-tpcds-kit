#!/bin/bash

# TODO: make sure you have set up dn.txt with your DataNode hostnames, 1 per line
set -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source tpcds-env.sh

cat dn.txt | while read h
do
  scp $SSH_OPTS -rp "$HOMEDIR/$MPP_TPCDS_DIR" $CLUSTER_USER@$h:$CLUSTER_HOMEDIR
  ssh $SSH_OPTS $CLUSTER_USER@$h "cd $CLUSTER_HOMEDIR/$MPP_TPCDS_DIR; ./init-tpcds.sh" &
done
wait
