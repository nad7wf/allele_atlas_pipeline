#!/bin/sh
# properties = {"type": "single", "rule": "SubAsterisk", "local": false, "input": ["resources/NRP/NRP_Chr14.vcf.gz"], "output": ["results/SubAsterisk_NRP_Chr14.vcf.gz"], "wildcards": {"id": "NRP", "chr": "14"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 34, "cluster": {"partition": "Lewis", "time": "0-00:45", "cpus": 1, "mem": "20G", "job-name": "SubAsterisk", "output": "reports/SubAsterisk-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/SubAsterisk_NRP_Chr14.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.o03eao53 resources/NRP/NRP_Chr14.vcf.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/d383c473 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules SubAsterisk --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.o03eao53/34.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.o03eao53/34.jobfailed; exit 1)

