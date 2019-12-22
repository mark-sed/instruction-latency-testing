#!/bin/bash

# Part of Instruction latency tests
# Sends results through email and saves them into results folder
# Made for my bachelor's thesis
# @Author Marek Sedlacek

# Import constants
source ./conf.sh

# Moving results into results folder
TIME_NOW=$(date +'%d_%m_%Y_%H_%M_%S')
MV_FILE=results/"results"$TIME_NOW".txt"
info 'Moving results into result folder'
mkdir -p $RES_DIR
mv $OUTPUT_FILE $MV_FILE

# Sending result file throught email
if [[ -z "$DEBUG" ]]; then
	info 'Sending results though email'
	echo "" | mutt -s "[ILT] $TIME_NOW" $EMAIL -a $MV_FILE
fi

info "DONE!"

