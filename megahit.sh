
#!/bin/bash

cd PWD
conda activate megahit

#for coassembly of reads from both conditions
condition1=reads_1/*.fq
condition2=reads_2/*.fq

megahit -1 $condition1 -2 $condition2 -t 1 --tmp-dir PWD -o assembly/megahit_output

#Single read assembly 
reads=`ls reads | grep "R1.fastq" | sed 's/_1.fastq//g'`

for f in $reads
do 
	megahit -1 reads/"$f"_R1.fastq -2 reads/"$f"_R2.fastq -t 1 --tmp-dir PWDHERE -o assembly/"$f"_megahit_output
	echo "$f" 
done
