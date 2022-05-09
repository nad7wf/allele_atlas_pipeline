CHR = [str(num).zfill(2) for num in range(1, config['Chr']+1)]
RP_ID = [config['ID']['RP']]
NRP_ID = [config['ID']['NRP']]
SUBSET_ALL = [config['Subset']['All']]
SUBSET_SUB = [config['Subset']['Subset']]

#CHR = ["02"]

rule all:
	input:
		#expand("results/RenameSamples_{id}_Chr{chr}.vcf.gz", id = RP_ID + NRP_ID, chr = CHR),
		#expand("results/Preformat_{id}_Chr{chr}.vcf.gz", id = RP_ID, chr = CHR),
		#expand("results/Preformat_{id}_Chr{chr}.vcf.gz", id = NRP_ID, chr = CHR),
		#expand("results/ImputeRP_{id}_Chr{chr}.vcf.gz", id = RP_ID, chr = CHR),
		#expand("results/ImputeNRP_{id}_Chr{chr}.vcf.gz", id = NRP_ID, chr = CHR),
		#expand("results/MergeVCFs_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		#expand("results/SNPEff_Ann_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		#expand("results/Bottleneck_genes_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		#expand("results/Housekeeping_genes_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		#expand("results/SubsetUS_{RP_id}_{NRP_id}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, chr = CHR),
		#expand("results/EstimateBlocks_{RP_id}_{NRP_id}_{subset}_Chr{chr}.blocks", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB, chr = CHR),
		#expand("results/Fst_{RP_id}_{NRP_id}_{subset}_Chr{chr}.windowed.weir.fst", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB, chr = CHR),
		expand("results/SNPsOnly_{RP_id}_{NRP_id}_{subset}_Chr{chr}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB, chr = CHR),
		expand("results/AlleleAtlas_{RP_id}_{NRP_id}_{subset}_Chr{chr}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_ALL + SUBSET_SUB, chr = CHR)

include: '../rules/custom/RenameSamples.smk'
include: '../rules/custom/PreformatRP.smk'
include: '../rules/custom/PreformatNRP.smk'
include: '../rules/beagle/ImputeRP.smk'
include: '../rules/beagle/ImputeNRP.smk'
include: '../rules/custom/MergeVCFs.smk'
include: '../rules/custom/Subset.smk'
include: '../rules/SNPEff/SNPEff.smk'
include: '../rules/custom/SNPsOnly.smk'
include: '../rules/pop_analysis/EstimateBlocks.smk'
include: '../rules/pop_analysis/Fst.smk'
include: '../rules/custom/AlleleAtlas.smk'
