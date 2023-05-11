#!/bin/bash

module load snakemake

if ! [ -d Results/Intermediary_files ] ; then mkdir -p Results/Intermediary_files ; fi
if ! [ -d Logs ] ; then mkdir -p Logs ; fi

# Check whether the --local or --cluster options are passed to the script, and ask if they where not.
if [ $# -eq 1 ] ; then
	if [[ $1 == "--local" ]] ; then 
		echo "Local run." ; snakemake --profile profiles/LOCAL ; 
	elif [[ $1 == "--cluster" ]] ; then 
		echo "Run on a computing cluster" ; snakemake --profile profiles/CLUSTER 
	else
		echo "Unknown option $1" ; exit 1
	fi
else
echo -e "Will the script run on a computing cluster ? (y/n)"
read ANSWER

case $ANSWER in
	y)
		echo "Using the cluster.yaml config file."
		snakemake --profile profiles/CLUSTER 
		;;
	n)
		echo "Local run."
		snakemake --profile profiles/LOCAL
		;;
	*)
		echo "Unknown answer."
		;;
esac
fi
