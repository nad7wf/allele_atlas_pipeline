rule SNPsOnly:
	input:
		expand("results/MergeVCFs_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	output:
		expand("results/SNPsOnly_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		### Touch index file to prevent 'index is older than file' warning. ###
		touch {input}.tbi

		### Extract biallelic SNPs only. ###
		bcftools view \
			--min-alleles 2 \
			--max-alleles 2 \
			--types snps \
			-Ou \
			{input} | \
		bcftools annotate \
			--set-id \
			+'%POS' | \
		bgzip -l 9 \
			> {output}

		### Index VCF file. ###
		bcftools index --tbi {output}
		"""
