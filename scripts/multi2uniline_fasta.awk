#!/bin/bash
# Env
script_name=$(basename "$0")

#Warning
if [[ $# -lt 1 ]] ; then
echo -e "\033[1mUsage\033[0m : $script_name multi-line.fasta > uni-line.fasta"
exit 1
fi

#Script
gawk '
BEGIN { FS="\n"; RS=">" } 
NR>1{print ">" $1
for (i=2; i<NF; i++) printf $i ; print $NF
}' $1
