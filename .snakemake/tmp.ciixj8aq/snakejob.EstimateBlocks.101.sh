#!/bin/sh
# properties = {"type": "single", "rule": "EstimateBlocks", "local": false, "input": ["results/SNPsOnly_RP_NRP_EliteUSOnly_Chr11.vcf.gz"], "output": ["results/EstimateBlocks_RP_NRP_EliteUSOnly_Chr11.blocks", "results/EstimateBlocks_RP_NRP_EliteUSOnly_Chr11.bed.gz"], "wildcards": {"chr": "11"}, "params": {"output_prefix": ["results/EstimateBlocks_RP_NRP_EliteUSOnly_Chr11"]}, "log": [], "threads": 1, "resources": {"mem": 10000}, "jobid": 101, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-12:00", "cpus": 1, "mem": "20G", "job-name": "EstimateBlocks", "output": "reports/EstimateBlocks-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/EstimateBlocks_RP_NRP_EliteUSOnly_Chr11.blocks --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ciixj8aq results/SNPsOnly_RP_NRP_EliteUSOnly_Chr11.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/ac755371 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules EstimateBlocks --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ciixj8aq/101.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ciixj8aq/101.jobfailed; exit 1)

