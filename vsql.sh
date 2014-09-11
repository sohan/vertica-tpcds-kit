#!/bin/bash
source tpcds-env.sh

h=`head -n 1 dn.txt`

ssh $CLUSTER_USER@$h "/opt/vertica/bin/vsql -U ${VERTICA_USER} -w ${VERTICA_PW} -h ${VERTICA_HOST} -d ${VERTICA_DB} -p ${VERTICA_PORT} -c \"$1\""
