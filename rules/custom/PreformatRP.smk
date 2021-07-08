rule PreformatRP:
	input:
		expand("results/RenameSamples_{id}_Chr{{chr}}.vcf.gz", id = RP_ID)
	output:
		expand("results/Preformat_{id}_Chr{{chr}}.vcf.gz", id = RP_ID)
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		### Recode hets as missing data. ###
		bcftools filter -S . -e 'GT="het"' -Ou {input} | \
		### Calculte allele frequency for Alt alleles. ###
		bcftools +fill-tags -Ou -- -t AF | \
		### Remove alleles/positions with AF=0 or where there were no Ref allele calls. ###
		bcftools view -Q 0.99999 -a -c1 -Ou | \
		### Remove "inf" from QUAL column and trailing genotype info in FORMAT column.###
		bcftools annotate -x QUAL,FORMAT | \
		### The asterisk throws an error in SNPEff - replacing with <DEL>. ###
		awk 'BEGIN{{OFS=FS="\t"}} {{gsub("*", "<DEL>", $5); print}}' | \
		bgzip -l 9 > {output}

		### Index vcf file. ###
		bcftools index --tbi {output}
		"""
