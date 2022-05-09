#!/bin/sh
# properties = {"type": "single", "rule": "ImputeRP", "local": false, "input": ["results/Preformat_RP_Chr09.vcf.gz"], "output": ["results/ImputeRP_RP_Chr09.vcf.gz", "results/beagle/ImputeRP_RP_Chr09"], "wildcards": {"chr": "09"}, "params": {"jar": "resources/beagle/beagle.28Jun21.220.jar", "prefix": ["results/ImputeRP_RP_Chr09"]}, "log": [], "threads": 1, "resources": {"memory": 65, "threads": 15}, "jobid": 89, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-04:00", "cpus": 15, "mem": "70G", "job-name": "ImputeRP", "output": "reports/ImputeRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeRP_RP_Chr09.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.gm274vru results/Preformat_RP_Chr09.vcf.gz --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.gm274vru/89.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.gm274vru/89.jobfailed; exit 1)

