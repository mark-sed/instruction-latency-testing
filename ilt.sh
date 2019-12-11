#/bin/sh

# Automatic instruction latency tests for assembler instructions
VERSION=1.0

OUTPUT_FILE=results.txt
RES_DIR=results
EMAIL="mr.mareksedlacek@gmail.com"
WKD="."
SRC_DIR="tests"
TEST100=".test100.txt"
MAKE_ARGS=all
OUT_PREF='* '
OUT_SUF='\n'


function info(){
    echo -ne "$OUT_PREF"$1"$OUT_SUF"
}

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
info 'Getting hard disk information'
echo "%DISKS:" >> $OUTPUT_FILE
lsblk -o NAME,ROTA >> $OUTPUT_FILE

# Change directory (in case the wkdir is somewhere else than the tests)
info 'Navigating into correct directory'
cd $WKD

# Compile all .asm files into .out files
info 'Compiling source codes (this will take a few minutes)'
make $MAKE_ARGS

# Run each binary and time it's processing time
# Save to file test100.txt and then process in python
# format: "ins,real,user,sys"

info 'Starting latency tests'
for i in $(ls $SRC_DIR/*.out)
do
    for _ in {1..100}
    do
        printf $i | sed "s/\.out/;/g" | sed "s/.*\///g"
        (time ./$i) 2>&1 | grep -oh "[0-9]*,[0-9]*" | tr '\n' '; '
        echo ""
    done
done > $TEST100

# Get statistics
info 'Calculating statistics'
python3 stats.py >> $OUTPUT_FILE

# Remove created .out files
info 'Removing all created binary files'
for i in $(ls $SRC_DIR/*.out)
do
    rm $i
done

# Remove creted txt files
info 'Removing created temporary files'
rm $TEST100

# Moving results into 
info 'Moving results into result folder'
mkdir -p $RES_DIR
mv $OUTPUT_FILE $RES_DIR/"results"$(date +'%d_%m_%Y_%H_%M_%S')".txt"

# Send file through email
info 'Sending results though email'
echo "" | mutt -s "[ILT] $(date +'%d/%m/%Y %H:%M:%S')" $EMAIL -a $OUTPUT_FILE

info 'DONE!'

