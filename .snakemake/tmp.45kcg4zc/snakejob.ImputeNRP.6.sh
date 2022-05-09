#!/bin/sh
# properties = {"type": "single", "rule": "ImputeNRP", "local": false, "input": ["results/Preformat_NRP_Chr06.vcf.gz", "results/ImputeRP_RP_Chr06.vcf.gz"], "output": ["results/ImputeNRP_NRP_Chr06.vcf.gz", "results/beagle/ImputeNRP_NRP_Chr06"], "wildcards": {"chr": "06"}, "params": {"jar": "resources/beagle/beagle.28Jun21.220.jar", "prefix": ["results/ImputeNRP_NRP_Chr06"]}, "log": [], "threads": 1, "resources": {"memory": 28, "threads": 1}, "jobid": 6, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-02:00", "cpus": 1, "mem": "30G", "job-name": "ImputeNRP", "output": "reports/ImputeNRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeNRP_NRP_Chr06.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.45kcg4zc results/Preformat_NRP_Chr06.vcf.gz results/ImputeRP_RP_Chr06.vcf.gz --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeNRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.45kcg4zc/6.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.45kcg4zc/6.jobfailed; exit 1)

