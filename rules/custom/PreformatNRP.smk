rule PreformatNRP:
	input:
		NRP = expand("results/RenameSamples_{id}_Chr{{chr}}.vcf.gz", id = NRP_ID),
		RP = expand("results/Preformat_{id}_Chr{{chr}}.vcf.gz", id = RP_ID)
	output:
		expand("results/Preformat_{id}_Chr{{chr}}.vcf.gz", id = NRP_ID)
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		### Filter for positions present in RP. ###
		bcftools view -T {input.RP} -Ou {input.NRP} | \
		### Recode hets as missing data. ###
		bcftools filter -S . -e 'GT="het"' -Ou | \
		### Remove "inf" from QUAL column and trailing genotype info in FORMAT column.###
		bcftools annotate -x QUAL,FORMAT | \
		### The asterisk throws an error in SNPEff - replacing with <DEL>. ###
		awk 'BEGIN{{OFS=FS="\t"}} {{gsub("*", "<DEL>", $5); print}}' | \
		bgzip -l 9 > {output} && \

		### Index vcf file. ###
		bcftools index --tbi {output}
		"""
