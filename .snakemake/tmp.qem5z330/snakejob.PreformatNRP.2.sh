#!/bin/sh
# properties = {"type": "single", "rule": "PreformatNRP", "local": false, "input": ["resources/NRP/NRP_Chr01.vcf.gz", "resources/Soy775/Soy775_Chr01.vcf.gz"], "output": ["results/FilteredNRP_NRP_Chr01.vcf.gz", "results/PreformatNRP_NRP_Chr01.vcf.gz"], "wildcards": {"chr": "01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 2, "cluster": {"partition": "Lewis", "time": "0-00:45", "cpus": 1, "mem": "20G", "job-name": "PreformatNRP", "output": "reports/PreformatNRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/PreformatNRP_NRP_Chr01.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.qem5z330 resources/NRP/NRP_Chr01.vcf.gz resources/Soy775/Soy775_Chr01.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/d383c473 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules PreformatNRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.qem5z330/2.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.qem5z330/2.jobfailed; exit 1)

