rule RenameSamples:
	input:
		vcf = "resources/{id}/{id}_Chr{chr}.vcf.gz",
		corr = "resources/{id}/{id}_sample_name_correspondence_file.txt"
	output:
		"results/RenameSamples_{id}_Chr{chr}.vcf.gz"
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		gzip -dc {input.vcf} | \
			bcftools reheader  \
			-s {input.corr} - | \
			bgzip -l 9 > {output}

		bcftools index --tbi {output}
		"""
