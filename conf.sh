#!/bin/sh

# Constants for Automatic instruction latency tests
# Made for my bachelor's thesis
# @Author Marek Sedlacek

#DEBUG=1 # Uncomment or comment if running in debug mode (no mail sending, no making, just tests) 
VERSION=1.3

OUTPUT_FILE=results.txt
RES_DIR=results
EMAIL="mr.mareksedlacek@gmail.com"
WKD="."
SRC_DIR="tests"
TEST100=".test100.txt"
MAKE_ARGS=all
OUT_PREF='* '
OUT_SUF='\n'
ONE_CORE='one_core.sh'
TIME_FC=time.sh
CORE_NUM=0

function info(){
    echo -ne "$OUT_PREF"$1"$OUT_SUF"
}
