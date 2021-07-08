#!/bin/sh
# properties = {"type": "single", "rule": "SplitVCF", "local": false, "input": ["results/SubAsterisk_NRP_Chr15.vcf.gz", "resources/beagle/splitvcf.jar"], "output": ["results/SplitVCF_NRP_Chr15.1.vcf.gz", "results/SplitVCF_NRP_Chr15.2.vcf.gz", "results/SplitVCF_NRP_Chr15.3.vcf.gz", "results/SplitVCF_NRP_Chr15.4.vcf.gz", "results/SplitVCF_NRP_Chr15.5.vcf.gz", "results/SplitVCF_NRP_Chr15.6.vcf.gz", "results/SplitVCF_NRP_Chr15.7.vcf.gz", "results/SplitVCF_NRP_Chr15.8.vcf.gz", "results/SplitVCF_NRP_Chr15.9.vcf.gz", "results/SplitVCF_NRP_Chr15.10.vcf.gz", "results/SplitVCF_NRP_Chr15.11.vcf.gz", "results/SplitVCF_NRP_Chr15.12.vcf.gz", "results/SplitVCF_NRP_Chr15.13.vcf.gz", "results/SplitVCF_NRP_Chr15.14.vcf.gz", "results/SplitVCF_NRP_Chr15.15.vcf.gz", "results/SplitVCF_NRP_Chr15.16.vcf.gz", "results/SplitVCF_NRP_Chr15.17.vcf.gz", "results/SplitVCF_NRP_Chr15.18.vcf.gz", "results/SplitVCF_NRP_Chr15.19.vcf.gz", "results/SplitVCF_NRP_Chr15.20.vcf.gz"], "wildcards": {"id": "NRP", "chr": "15"}, "params": {"prefix": "results/SplitVCF_NRP_Chr15"}, "log": [], "threads": 1, "resources": {}, "jobid": 75, "cluster": {"partition": "Lewis", "time": "0-02:00", "cpus": 1, "mem": "20G", "job-name": "SplitVCF", "output": "reports/SplitVCF-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/SplitVCF_NRP_Chr15.1.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.go8ydgdu results/SubAsterisk_NRP_Chr15.vcf.gz resources/beagle/splitvcf.jar /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/6862ade5 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules SplitVCF --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.go8ydgdu/75.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.go8ydgdu/75.jobfailed; exit 1)

