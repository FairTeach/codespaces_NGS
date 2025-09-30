#!/bin/bash

# Assign everyting ended in .fq to FILES variable
FILES=*.fq

# Loop over FILES and assign each to file variable
for file in $FILES
do 
    filename=$(basename "$file")
    extension="${filename##*.}"
    filename="${filename%.*}"
    echo "File on the loop:         ${file}"
    echo "Curated name of file:     ${filename}"
    echo "Extension:                ${extension}"
    
    # call FastQC quality analysis
    fastqc ${file}

    echo -e "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\n\n"

done

# Parse folder with MultiQC
# -f    Overwrite any existing reports
# .     Parse this directory and downastream
echo "Running MultiQC..."
echo "Capturing FastQC statistics"
multiqc -f .

#filename=$(basename "$f")
#extension="${filename##*.}"
#filename="${filename%.*}"
