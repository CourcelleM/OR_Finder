#!/bin/bash

if module list -t 2>&1 | grep -q snakemake ; then loaded="yes" ; else loaded="no" ; fi
module load snakemake/7.15.1-conda

snakemake -s scripts/OR_script.snake --cores 1 --use-conda --configfile scripts/config.yaml --cluster-config scripts/cluster.yaml --cluster "sbatch -J {cluster.job-name} -A agap -p {cluster.queue} {cluster.time} {cluster.nodes} {cluster.cpus} {cluster.out}" --jobs 100 --dry-run --reason
if [ $loaded == "no" ] ; then module unload snakemake/7.15.1-conda ; fi
