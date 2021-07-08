#!/bin/sh
# properties = {"type": "single", "rule": "SplitVCF", "local": false, "input": ["resources/remerged_datasets/KB100/KB100_Chr13.vcf.gz"], "output": ["results/KB100_Chr13.1.vcf.gz", "results/KB100_Chr13.2.vcf.gz", "results/KB100_Chr13.3.vcf.gz", "results/KB100_Chr13.4.vcf.gz", "results/KB100_Chr13.5.vcf.gz", "results/KB100_Chr13.6.vcf.gz", "results/KB100_Chr13.7.vcf.gz", "results/KB100_Chr13.8.vcf.gz", "results/KB100_Chr13.9.vcf.gz", "results/KB100_Chr13.10.vcf.gz", "results/KB100_Chr13.11.vcf.gz", "results/KB100_Chr13.12.vcf.gz", "results/KB100_Chr13.13.vcf.gz", "results/KB100_Chr13.14.vcf.gz", "results/KB100_Chr13.15.vcf.gz", "results/KB100_Chr13.16.vcf.gz", "results/KB100_Chr13.17.vcf.gz", "results/KB100_Chr13.18.vcf.gz", "results/KB100_Chr13.19.vcf.gz", "results/KB100_Chr13.20.vcf.gz"], "wildcards": {"sample": "KB100", "chr": "Chr13"}, "params": {}, "log": ["reports/KB100_Chr13.log"], "threads": 1, "resources": {}, "jobid": 13, "cluster": {"partition": "Lewis", "time": "0-05:00", "mem": "20G", "job-name": "SplitVCF", "output": "reports/SplitVCF-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/KB100_Chr13.1.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ffzung3b resources/remerged_datasets/KB100/KB100_Chr13.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/e283fd6b --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules SplitVCF --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ffzung3b/13.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ffzung3b/13.jobfailed; exit 1)

