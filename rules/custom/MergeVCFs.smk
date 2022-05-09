rule MergeVCFs:
	input:
		RP = expand("results/ImputeRP_{id}_Chr{{chr}}.vcf.gz", id = RP_ID),
		NRP = expand("results/ImputeNRP_{id}_Chr{{chr}}.vcf.gz", id = NRP_ID)
	output:
		expand("results/MergeVCFs_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_ALL)
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		### Horizontal merge of Ref Panel and Non-ref Panel. ###
		bcftools merge \
			-m all \
			-O u \
			{input.RP} \
			{input.NRP} | \
			bcftools annotate -x INFO,FORMAT | \
			bgzip -l 9 \
			> {output}

		### Index VCF file. ###
		bcftools index --tbi {output}
		"""
