#CHR = [str(num).zfill(2) for num in range(1, config['chr']+1)]
#SUBSET = range(1, 41)
RP_ID = [config['ID']['RP']]
NRP_ID = [config['ID']['NRP']]

CHR = "06"
#SUBSET = range(30, 31)

rule all:
	input:
		expand("results/RenameSamples_{id}_Chr{chr}.vcf.gz", id = RP_ID + NRP_ID, chr = CHR),
		expand("results/Preformat_{id}_Chr{chr}.vcf.gz", id = RP_ID, chr = CHR),
		expand("results/Preformat_{id}_Chr{chr}.vcf.gz", id = NRP_ID, chr = CHR),
		#expand("results/SplitVCF_{id}_Chr{chr}.{subset}.vcf.gz", id = RP_ID + NRP_ID, chr = CHR, subset = SUBSET),
		expand("results/ImputeRP_{id}_Chr{chr}.vcf.gz", id = RP_ID, chr = CHR),
		expand("results/ImputeNRP_{id}_Chr{chr}.vcf.gz", id = NRP_ID, chr = CHR),
		#expand("results/ImputeNRP_{id}_Chr{chr}.{subset}.vcf.gz", id = NRP_ID, chr = CHR, subset = SUBSET),
		#expand("results/MergeVCFs_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		expand("results/SNPEff_Ann_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		expand("results/AlleleAtlas_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		expand("results/Bottleneck_genes_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		expand("results/Housekeeping_genes_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR)

include: '../rules/custom/RenameSamples.smk'
include: '../rules/custom/PreformatRP.smk'
include: '../rules/custom/PreformatNRP.smk'
#include: '../rules/beagle/beagle_SplitVCF.smk'
include: '../rules/beagle/ImputeRP.smk'
include: '../rules/beagle/ImputeNRP.smk'
include: '../rules/custom/MergeVCFs.smk'
include: '../rules/SNPEff/SNPEff.smk'
include: '../rules/custom/AlleleAtlas.smk'
