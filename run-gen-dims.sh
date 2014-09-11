#!/bin/bash
set -ex

source tpcds-env.sh

HOST=`head -n 1 dn.txt`

ssh $SSH_OPTS $CLUSTER_USER@$HOST "cd $CLUSTER_HOMEDIR/$MPP_TPCDS_DIR; ./gen-dims.sh"
