#!/bin/sh
# properties = {"type": "single", "rule": "SubsetUS", "local": false, "input": ["results/AlleleAtlas_RP_NRP_Chr20.txt.gz"], "output": ["results/SubsetUS_RP_NRP_Chr20.txt.gz"], "wildcards": {"RP_id": "RP", "NRP_id": "NRP", "chr": "20"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 200, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-02:00", "cpus": 1, "mem": "1G"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/SubsetUS_RP_NRP_Chr20.txt.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.184s9tjn results/AlleleAtlas_RP_NRP_Chr20.txt.gz /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/b21b0d43 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules SubsetUS --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.184s9tjn/200.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.184s9tjn/200.jobfailed; exit 1)

