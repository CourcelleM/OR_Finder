# OR_Finder
A snakemake-encapsulated bioinformatics pipeline to extract olfactory receptor genes for mammalian genomes.

Full documentation to come !

Feel free to contact me @ maxime.courcelle1 @ gmail.com in the meantime.

# Installation
## Requirements
- [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) (version >= 6.1.0 < 8.0.0).
- [Singularity](https://github.com/sylabs/singularity/releases) (version >= 3.0).

## Clone this repository
```
git clone https://github.com/CourcelleM/OR_Finder
```

# How to use OR_Finder
## User configuration
### Required
In the **user_parameters** folder, you will find the **parameters.yaml** file. In this file you must enter:
- DATADIR: The path to your data (Don't forget the trailing '/')
- SUFFIX: The genome file suffix (i.e. ".fas", ".fna" or ".fasta"). Anything BEFORE that string in the filename will be considered as a sample identifier. The raw data for this analysis is an **uncompressed FASTA file**.

### Optional
In the same folder, you should edit the **cluster.yaml** file to adapt it to your cluster rules and account.
You will most likely have to change at least the **partition** and **queue** occurences according to your cluster's nomenclature.
In case your cluster do not use the slurm job manager, edit the CLUSTER PARAMETERS in **profiles/CLUSTER/config.yaml** to match the command line you would use to submit jobs.

## Running the script
### Test run
Executing the **test_run.sh** script will attempt a snakemake _dry-run_. No analysis are conducted but this may allow you to check that your data are detected correctly and the requirements are fulfilled.

### Running the analysis
Executing the **test_run.sh** script can be done interactively when no arguments are provided. In this case, a prompt will ask you whether you intend to run the analysis localy or on a computer cluster. The answer defines which profile snakemake will use to distribute jobs and parallelize the analysis. Profiles can be reviewed (and eventually edited) in the profiles directory.  
In case you prefer to run the script non-interactively, you can pass the "--local" or "--cluster" argument to use the corresponding profile.
- Local mode: Snakemake will not attempt to send jobs to remote machines and will instead conduct the analysis on the computer on which the script is running.
- Cluster mode: Snakemake Snakemake will only run the job manager locally (a very lightweight application which keeps track of the analysis' progress), and send all more demanding rules on remote nodes. By default, Snakemake expects the cluster workload manager to be SLURM (cf **User configuration**).

```
./run_snake.sh
```

# Known issues
## Singularity image not downloading
Singularity image download default remote change : https://apptainer.org/docs/user/latest/endpoint.html#no-default-remote
```
singularity remote add --no-login SylabsCloud cloud.sycloud.io
singularity remote use SylabsCloud
```
