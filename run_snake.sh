#!/bin/bash

module load snakemake/7.15.1-conda

if ! [ -d Results/Intermediary_files ] ; then mkdir -p Results/Intermediary_files ; fi
if ! [ -d Logs ] ; then mkdir -p Logs ; fi

snakemake -s scripts/OR_script.snake --cores 1 --use-conda --configfile scripts/config.yaml --cluster-config scripts/cluster.yaml --cluster "sbatch -J {cluster.job-name} -A agap -p {cluster.queue} {cluster.time} {cluster.mem} {cluster.nodes} {cluster.cpus} {cluster.out}" --jobs 100
