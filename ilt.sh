#!/bin/sh

# Automatic instruction latency tests for assembler instructions
# Made for my bachelor's thesis
# @Author Marek Sedlacek

# Import constants
source ./conf.sh

# Check if sudo
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

if ! [[ -z "$DEBUG" ]]; then
	echo "DEBUG IS ON!"
fi

# Printing output
echo 'Instruction latency tests:'

# Rewriting file if it was already created before
# Adding information such as date and test version
echo "INSTRUCTION LATENCY TESTS" > $OUTPUT_FILE
echo "^^^^^^^^^^^^^^^^^^^^^^^^^" >> $OUTPUT_FILE
echo "%DATE: $(date +'%d/%m/%Y %H:%M:%S')" >> $OUTPUT_FILE
echo "%VERSION: $VERSION" >> $OUTPUT_FILE

# Print the processor info to the output file
info 'Getting processor information'
echo "%PROCESSOR:" >> $OUTPUT_FILE
cat /proc/cpuinfo >> $OUTPUT_FILE

# Print the disk into to the output file
#info 'Getting hard disk information'
#echo "%DISKS:" >> $OUTPUT_FILE
#lsblk -o NAME,ROTA >> $OUTPUT_FILE

# Change directory (in case the wkdir is somewhere else than the tests)
info 'Navigating into correct directory'
cd $WKD

# Compile all .asm files into .out files
if [[ -z "$DEBUG" ]]; then
	info 'Compiling source codes (this will take a few minutes)'
	make $MAKE_ARGS
fi

# Run each binary and time it's processing time
# Save to file test100.txt and then process in python
# format: "ins,real,user,sys"

info 'Running latency tests'
for i in $(ls $SRC_DIR/*.out)
do
    for _ in {1..100}
    do
        printf $i | sed "s/\.out/;/g" | sed "s/.*\///g"
        (sh $ONE_CORE $CORE_NUM sh $TIME_FC $i) 2>&1 | grep -oh "[0-9]*,[0-9]*" | tr '\n' '; '
        echo ""
    done
done > $TEST100

# Get statistics
info 'Calculating statistics'
python3 stats.py >> $OUTPUT_FILE


# Remove created .out files
if [[ -z "$DEBUG" ]]; then
	info 'Removing all created binary files'
	for i in $(ls $SRC_DIR/*.out)
	do
		rm $i
	done
fi

# Remove creted txt files
info 'Removing created temporary files'
rm $TEST100

