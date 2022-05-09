#!/bin/sh
# properties = {"type": "single", "rule": "RenameSamples", "local": false, "input": ["resources/RP/RP_Chr01.vcf.gz", "resources/RP/RP_sample_name_correspondence_file.txt"], "output": ["results/RenameSamples_RP_Chr01.vcf.gz"], "wildcards": {"id": "RP", "chr": "01"}, "params": {}, "log": [], "threads": 1, "resources": {}, "jobid": 1, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-02:00", "cpus": 1, "mem": "10G", "job-name": "RenameSamples", "output": "reports/RenameSamples-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/RenameSamples_RP_Chr01.vcf.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.gm274vru resources/RP/RP_Chr01.vcf.gz resources/RP/RP_sample_name_correspondence_file.txt /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/b21b0d43 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules RenameSamples --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.gm274vru/1.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.gm274vru/1.jobfailed; exit 1)

