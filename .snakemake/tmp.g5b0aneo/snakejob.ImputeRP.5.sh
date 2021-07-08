#!/bin/sh
# properties = {"type": "single", "rule": "ImputeRP", "local": false, "input": ["results/SplitVCF_Soy775_Chr01.1.vcf.gz"], "output": ["results/ImputeRP_Soy775_Chr01.1.vcf.gz"], "wildcards": {"chr": "01", "subset": "1"}, "params": {"jar": "/scratch/nad7wf/miniconda/pkgs/beagle-5.2_21Apr21.304-hdfd78af_0/share/beagle-5.2_21Apr21.304-0/beagle.jar", "prefix": ["results/ImputeRP_Soy775_Chr01.1"]}, "log": [], "threads": 1, "resources": {"memory": "120G"}, "jobid": 5, "cluster": {"partition": "Lewis", "time": "0-03:00", "cpus": 1, "mem": "200G", "job-name": "ImputeRP", "output": "reports/ImputeRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeRP_Soy775_Chr01.1.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.g5b0aneo results/SplitVCF_Soy775_Chr01.1.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/e283fd6b --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.g5b0aneo/5.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.g5b0aneo/5.jobfailed; exit 1)

