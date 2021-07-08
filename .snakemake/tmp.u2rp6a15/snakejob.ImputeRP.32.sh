#!/bin/sh
# properties = {"type": "single", "rule": "ImputeRP", "local": false, "input": ["results/SplitVCF_RP_Chr06.26.vcf.gz"], "output": ["results/ImputeRP_RP_Chr06.26.vcf.gz"], "wildcards": {"chr": "06", "subset": "26"}, "params": {"jar": "/scratch/nad7wf/miniconda/pkgs/beagle-5.1_24Aug19.3e8-hdfd78af_1/share/beagle-5.1_24Aug19.3e8-1/beagle.jar", "prefix": ["results/ImputeRP_RP_Chr06.26"]}, "log": [], "threads": 1, "resources": {"memory": "175G", "threads": 15}, "jobid": 32, "cluster": {"partition": "Lewis", "time": "0-04:00", "cpus": 15, "mem": "200G", "job-name": "ImputeRP", "output": "reports/ImputeRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeRP_RP_Chr06.26.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.u2rp6a15 results/SplitVCF_RP_Chr06.26.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/d5dcf93c --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && exit 0 || exit 1

