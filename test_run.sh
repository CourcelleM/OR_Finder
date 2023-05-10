#!/bin/bash

if module list -t 2>&1 | grep -q snakemake ; then loaded="yes" ; else loaded="no" ; fi
module load snakemake

snakemake --profile profiles/CLUSTER --dry-run 
if [ $loaded == "no" ] ; then module unload snakemake ; fi

echo 'Expected number of jobs for a new genome: 68 (+1 for the "All" rule)'
