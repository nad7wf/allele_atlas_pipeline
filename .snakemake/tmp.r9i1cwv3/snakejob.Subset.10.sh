#!/bin/sh
# properties = {"type": "single", "rule": "Subset", "local": false, "input": ["results/MergeVCFs_RP_NRP_AllAccessions_Chr04.vcf.gz", "resources/EliteUSOnly.txt"], "output": ["results/MergeVCFs_RP_NRP_EliteUSOnly_Chr04.vcf.gz"], "wildcards": {"chr": "04"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 10, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-02:00", "cpus": 1, "mem": "1G"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/MergeVCFs_RP_NRP_EliteUSOnly_Chr04.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.r9i1cwv3 results/MergeVCFs_RP_NRP_AllAccessions_Chr04.vcf.gz resources/EliteUSOnly.txt /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/b21b0d43 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules Subset --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.r9i1cwv3/10.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.r9i1cwv3/10.jobfailed; exit 1)

