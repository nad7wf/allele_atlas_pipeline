#!/bin/sh
# properties = {"type": "single", "rule": "ImputeRP", "local": false, "input": ["results/SplitVCF_Soy775_Chr20.1.vcf.gz"], "output": ["results/ImputeRP_Soy775_Chr20.1.vcf.gz"], "wildcards": {"chr": "20", "subset": "1"}, "params": {"jar": "/scratch/nad7wf/miniconda/pkgs/beagle-5.1_24Aug19.3e8-hdfd78af_1/share/beagle-5.1_24Aug19.3e8-1/beagle.jar", "prefix": ["results/ImputeRP_Soy775_Chr20.1"]}, "log": [], "threads": 1, "resources": {"memory": "200G"}, "jobid": 461, "cluster": {"partition": "Lewis", "time": "0-06:00", "cpus": 1, "mem": "200G", "job-name": "ImputeRP", "output": "reports/ImputeRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeRP_Soy775_Chr20.1.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.76jte2md results/SplitVCF_Soy775_Chr20.1.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/6862ade5 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.76jte2md/461.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.76jte2md/461.jobfailed; exit 1)

