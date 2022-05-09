rule Subset:
	input:
		vcf = expand("results/MergeVCFs_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_ALL),
		acc_list = expand("resources/{subset}.txt", subset = config['Subset']['Subset'])
	output:
		expand("results/MergeVCFs_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		### Touch VCF index to avoid 'index is older than file' warning. ###
		touch {input.vcf}.tbi

		### Subset VCF file by accession list. ###
		bcftools view \
			-S {input.acc_list} \
			--force-samples \
			{input.vcf} | \
                	### Calculte allele frequency for Alt alleles. ###
                	bcftools +fill-tags -Ou -- -t AF | \
                	### Remove alleles/positions with AF=0 or where there were no Ref allele calls. ###
                	bcftools view -Q 0.99999 -a -c1 |
			bgzip -l 9 > {output}

		### Index VCF file. ###
		bcftools index --tbi {output}
		"""
