#!/bin/bash

module load snakemake/7.15.1-conda

if ! [ -d Results/Intermediary_files ] ; then mkdir -p Results/Intermediary_files ; fi
if ! [ -d Logs ] ; then mkdir -p Logs ; fi

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
