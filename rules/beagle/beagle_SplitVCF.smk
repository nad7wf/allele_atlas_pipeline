rule SplitVCF:
	input:
		vcf = "results/Preformat_{id}_Chr{chr}.vcf.gz",
		jar = "resources/beagle/splitvcf.jar"
	output:
		expand("results/SplitVCF_{{id}}_Chr{{chr}}.{subset}.vcf.gz", subset = SUBSET)
	params:
		prefix = "results/SplitVCF_{id}_Chr{chr}"
	conda:
		"../../envs/beagle.yml"
	shell:
		"""
		overlap=$(($(bcftools index -n {input}) / 40 + 5000))

		zcat {input.vcf} | \
			java -jar {input.jar} \
			"Chr{wildcards.chr}" \
			"$overlap" \
			5000 \
			{params.prefix}
		"""
