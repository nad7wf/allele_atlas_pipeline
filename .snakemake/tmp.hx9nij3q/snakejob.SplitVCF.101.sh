#!/bin/sh
# properties = {"type": "single", "rule": "SplitVCF", "local": false, "input": ["results/Preformat_NRP_Chr01.vcf.gz", "resources/beagle/splitvcf.jar"], "output": ["results/SplitVCF_NRP_Chr01.1.vcf.gz", "results/SplitVCF_NRP_Chr01.2.vcf.gz", "results/SplitVCF_NRP_Chr01.3.vcf.gz", "results/SplitVCF_NRP_Chr01.4.vcf.gz", "results/SplitVCF_NRP_Chr01.5.vcf.gz", "results/SplitVCF_NRP_Chr01.6.vcf.gz", "results/SplitVCF_NRP_Chr01.7.vcf.gz", "results/SplitVCF_NRP_Chr01.8.vcf.gz", "results/SplitVCF_NRP_Chr01.9.vcf.gz", "results/SplitVCF_NRP_Chr01.10.vcf.gz", "results/SplitVCF_NRP_Chr01.11.vcf.gz", "results/SplitVCF_NRP_Chr01.12.vcf.gz", "results/SplitVCF_NRP_Chr01.13.vcf.gz", "results/SplitVCF_NRP_Chr01.14.vcf.gz", "results/SplitVCF_NRP_Chr01.15.vcf.gz", "results/SplitVCF_NRP_Chr01.16.vcf.gz", "results/SplitVCF_NRP_Chr01.17.vcf.gz", "results/SplitVCF_NRP_Chr01.18.vcf.gz", "results/SplitVCF_NRP_Chr01.19.vcf.gz", "results/SplitVCF_NRP_Chr01.20.vcf.gz", "results/SplitVCF_NRP_Chr01.21.vcf.gz", "results/SplitVCF_NRP_Chr01.22.vcf.gz", "results/SplitVCF_NRP_Chr01.23.vcf.gz", "results/SplitVCF_NRP_Chr01.24.vcf.gz", "results/SplitVCF_NRP_Chr01.25.vcf.gz", "results/SplitVCF_NRP_Chr01.26.vcf.gz", "results/SplitVCF_NRP_Chr01.27.vcf.gz", "results/SplitVCF_NRP_Chr01.28.vcf.gz", "results/SplitVCF_NRP_Chr01.29.vcf.gz", "results/SplitVCF_NRP_Chr01.30.vcf.gz", "results/SplitVCF_NRP_Chr01.31.vcf.gz", "results/SplitVCF_NRP_Chr01.32.vcf.gz", "results/SplitVCF_NRP_Chr01.33.vcf.gz", "results/SplitVCF_NRP_Chr01.34.vcf.gz", "results/SplitVCF_NRP_Chr01.35.vcf.gz", "results/SplitVCF_NRP_Chr01.36.vcf.gz", "results/SplitVCF_NRP_Chr01.37.vcf.gz", "results/SplitVCF_NRP_Chr01.38.vcf.gz", "results/SplitVCF_NRP_Chr01.39.vcf.gz", "results/SplitVCF_NRP_Chr01.40.vcf.gz"], "wildcards": {"id": "NRP", "chr": "01"}, "params": {"prefix": "results/SplitVCF_NRP_Chr01"}, "log": [], "threads": 1, "resources": {}, "jobid": 101, "cluster": {"partition": "Lewis", "time": "0-02:00", "cpus": 1, "mem": "20G", "job-name": "SplitVCF", "output": "reports/SplitVCF-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/SplitVCF_NRP_Chr01.1.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.hx9nij3q results/Preformat_NRP_Chr01.vcf.gz resources/beagle/splitvcf.jar /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/d5dcf93c --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules SplitVCF --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && exit 0 || exit 1
