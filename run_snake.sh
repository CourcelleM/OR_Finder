#!/bin/bash

module load snakemake/7.15.1-conda

if ! [ -d Results/Intermediary_files ] ; then mkdir -p Results/Intermediary_files ; fi
if ! [ -d Logs ] ; then mkdir -p Logs ; fi

echo -e "Will the script run on a computing cluster ? (y/n)"
read ANSWER

case $ANSWER in
	y)
		echo "Using the cluster.yaml config file."
		snakemake -s scripts/OR_script.snake --profile scripts/config_cluster.yaml
		;;
	n)
		echo "Local run."
		snakemake -s scripts/OR_script.snake --profile scripts/config.yaml
		;;
	*)
		echo "Unknown answer."
		;;
esac
