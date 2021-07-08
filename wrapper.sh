#!/bin/bash

#SBATCH --partition=Lewis
#SBATCH --mem=500M
#SBATCH --time=0-10:00
#SBATCH --mail-user=nad7wf@mail.missouri.edu
#SBATCH --mail-type=END,FAIL
#SBATCH --job-name="Master"
#SBATCH --output="reports/Master-%j.out"

#### Load Modules ####
module load snakemake/5.3.0
module load miniconda3

#### Make job fail upon error ####
set -o nounset
set -o errexit
set -x

#### Execute master snakemake job ####
snakemake \
	--jobs 100 \
	--use-conda \
	--latency-wait 180 \
	--rerun-incomplete \
	--cluster-config config/cluster_config.yml \
	--configfile config/snakemake_config.yml \
	--snakefile workflow/allele_atlas.smk \
	--cluster="sbatch --ntasks={cluster.cpus} --mem={cluster.mem} --time={cluster.time} --partition={cluster.partition} --job-name={cluster.job-name} --output={cluster.output}"
