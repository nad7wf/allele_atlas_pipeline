rule MergeVCFs:
	input:
		RP = expand("results/ImputeRP_{id}_Chr{{chr}}.{subset}.vcf.gz", id = RP_ID, subset = SUBSET),
		NRP = expand("results/ImputeNRP_{id}_Chr{{chr}}.{subset}.vcf.gz", id = NRP_ID, subset = SUBSET),
		jar = "resources/beagle/mergevcf.jar"
	output:
		RP = expand("results/MergeVCFs_{id}_Chr{{chr}}.vcf.gz", id = RP_ID),
		NRP = expand("results/MergeVCFs_{id}_Chr{{chr}}.vcf.gz", id = NRP_ID),
		merged = expand("results/MergeVCFs_{RP_id}_{NRP_id}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID)
	conda:
		"../../envs/beagle.yml"
	shell:
		"""
		### Merge Ref Panel split VCF files for each Chr. ###
		java -jar {input.jar} \
			"Chr{wildcards.chr}" \
			{input.RP} | \
			bgzip -l 9 > {output.RP}

		### Merge Non-ref Panel split VCF files for each Chr. ###
		java -jar {input.jar} \
			"Chr{wildcards.chr}" \
			{input.NRP} | \
			bgzip -l 9 > {output.NRP}

		### Index merged VCF files. ###
		bcftools index --tbi {output.RP}
		bcftools index --tbi {output.NRP}

		### Horizontal merge of Ref Panel and Non-ref Panel. ###
		bcftools merge \
			-m all \
			-O u \
			{output.RP} \
			{output.NRP} | \
			bcftools annotate -x INFO,FORMAT | \
			bgzip -l 9 \
			> {output.merged}

		### Index VCF file. ###
		bcftools index --tbi {output.merged}
		"""
