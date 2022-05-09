#!/bin/sh
# properties = {"type": "single", "rule": "SNPEff", "local": false, "input": ["results/MergeVCFs_RP_NRP_AllAccessions_Chr04.vcf.gz", "/scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/snpEff.jar", "/scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/snpEff.config", "/scratch/nad7wf/miniconda/pkgs/snpsift-4.3.1t-hdfd78af_3/share/snpsift-4.3.1t-3/SnpSift.jar", "/scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/scripts/vcfEffOnePerLine.pl"], "output": ["results/SNPEff_Ann_RP_NRP_Chr04.txt.gz"], "wildcards": {"chr": "04"}, "params": {}, "log": [], "threads": 1, "resources": {"memory": "30G"}, "jobid": 9, "cluster": {"partition": "Lewis,hpc5,General", "time": "0-05:00", "cpus": 1, "mem": "30G", "job-name": "SNPEff", "output": "reports/SNPEff-%j.slurm.out"}}
 cd /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline && \
PATH='/cluster/software/conda-envs/envs/snakemake-5.3.0/bin':$PATH /cluster/software/conda-envs/envs/snakemake-5.3.0/bin/python3.6 \
-m snakemake results/SNPEff_Ann_RP_NRP_Chr04.txt.gz --snakefile /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/workflow/allele_atlas.smk \
--force -j --keep-target-files --keep-remote --max-inventory-time 0 \
--wait-for-files /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ek5d2d99 results/MergeVCFs_RP_NRP_AllAccessions_Chr04.vcf.gz /scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/snpEff.jar /scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/snpEff.config /scratch/nad7wf/miniconda/pkgs/snpsift-4.3.1t-hdfd78af_3/share/snpsift-4.3.1t-3/SnpSift.jar /scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/scripts/vcfEffOnePerLine.pl /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/conda/ae562c43 --latency-wait 180 \
 --attempt 1 --force-use-threads --scheduler ilp \
\
\
--wrapper-prefix https://github.com/snakemake/snakemake-wrappers/raw/ \
 --configfiles /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/config/snakemake_config.yml  --allowed-rules SNPEff --nocolor --notemp --no-hooks --nolock \
--mode 2  --use-conda  && touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ek5d2d99/9.jobfinished || (touch /storage/hpc/group/bilyeu/nad7wf/allele_atlas_pipeline/.snakemake/tmp.ek5d2d99/9.jobfailed; exit 1)

