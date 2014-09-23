#!/bin/bash                           
set -ex

source tpcds-env.sh

h=`head -n 1 dn.txt`

python impala/run_queries.py \
  --impala-host ${h} \
  "$@"
