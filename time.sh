#!/bin/bash

# Timing script for Automatic instruction latency tests
# Runs time script and then times the run time using timestamps
# Made for my bachelor's thesis
# @Author Marek Sedlacek

time ./$1

START=$(date +%s%N)
./$1
END=$(date +%s%N)
RES="$(($END-$START))"
bc <<< "scale=10; $RES/1000000000" | awk '{printf "my\t0m%fs\n", $0}' | tr '.' ','
