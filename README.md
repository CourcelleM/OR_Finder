# OR_Finder
A snakemake-encapsulated bioinformatics pipeline to extract olfactory receptor genes for mammalian genomes.

Full documentation to come !

Feel free to contact me @ maxime.courcelle1 @ gmail.com in the meantime.

# Installation
## Requirements
- [Snakemake](https://snakemake.readthedocs.io/en/stable/index.html) (version >= 3.9.0).
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
- SUFFIX: The genome file suffix (i.e. ".fas", ".fna" or ".fasta"). Anything BEFORE that string in the filename will be considered as a sample identifier.

### Optional
In the same folder, you should edit the **cluster.yaml** file to adapt it to your cluster rules and account.
You will most likely have to change at least the **partition** and **queue** occurences according to your cluster's nomenclature.
In case your cluster do not use the slurm job manager, edit the CLUSTER PARAMETERS in **profiles/CLUSTER/config.yaml** to match the command line you would use to submit jobs.

## Running the script




Singularity image download default remote change : https://apptainer.org/docs/user/latest/endpoint.html#no-default-remote
