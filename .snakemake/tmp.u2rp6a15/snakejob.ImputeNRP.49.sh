#!/bin/sh
# properties = {"type": "single", "rule": "ImputeNRP", "local": false, "input": ["results/SplitVCF_NRP_Chr06.3.vcf.gz", "results/ImputeRP_RP_Chr06.3.vcf.gz"], "output": ["results/ImputeNRP_NRP_Chr06.3.vcf.gz"], "wildcards": {"chr": "06", "subset": "3"}, "params": {"jar": "/scratch/nad7wf/miniconda/pkgs/beagle-5.2_21Apr21.304-hdfd78af_0/share/beagle-5.2_21Apr21.304-0/beagle.jar", "prefix": ["results/ImputeNRP_NRP_Chr06.3"]}, "log": [], "threads": 1, "resources": {"memory": "200G", "threads": 1}, "jobid": 49, "cluster": {"partition": "Lewis", "time": "0-02:00", "cpus": 1, "mem": "200G", "job-name": "ImputeNRP", "output": "reports/ImputeNRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeNRP_NRP_Chr06.3.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.u2rp6a15 results/SplitVCF_NRP_Chr06.3.vcf.gz results/ImputeRP_RP_Chr06.3.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/d5dcf93c --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeNRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && exit 0 || exit 1

