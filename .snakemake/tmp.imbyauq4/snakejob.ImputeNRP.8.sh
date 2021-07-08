#!/bin/sh
# properties = {"type": "single", "rule": "ImputeNRP", "local": false, "input": ["results/SplitVCF_NRP_Chr01.2.vcf.gz", "results/ImputeRP_Soy775_Chr01.2.vcf.gz"], "output": ["results/ImputeNRP_NRP_Chr01.2.vcf.gz"], "wildcards": {"chr": "01", "subset": "2"}, "params": {"jar": "/scratch/nad7wf/miniconda/pkgs/beagle-5.2_21Apr21.304-hdfd78af_0/share/beagle-5.2_21Apr21.304-0/beagle.jar", "prefix": ["results/ImputeNRP_NRP_Chr01.2"]}, "log": [], "threads": 1, "resources": {"memory": "200G", "threads": 1}, "jobid": 8, "cluster": {"partition": "Lewis", "time": "0-02:00", "cpus": 1, "mem": "200G", "job-name": "ImputeNRP", "output": "reports/ImputeNRP-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/ImputeNRP_NRP_Chr01.2.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.imbyauq4 results/SplitVCF_NRP_Chr01.2.vcf.gz results/ImputeRP_Soy775_Chr01.2.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/d5dcf93c --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules ImputeNRP --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.imbyauq4/8.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.imbyauq4/8.jobfailed; exit 1)

