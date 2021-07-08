rule SNPEff:
	input:
		vcf = expand("results/MergeVCFs_{RP_id}_{NRP_id}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID),
		jar = "/scratch/nad7wf/miniconda/pkgs/snpeff-5.0-hdfd78af_1/share/snpeff-5.0-1/snpEff.jar",
		config = "/scratch/nad7wf/miniconda/pkgs/snpeff-5.0-hdfd78af_1/share/snpeff-5.0-1/snpEff.config"
	output:
		expand("results/SNPEff_{RP_id}_{NRP_id}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID)
	resources:
		memory = config['SNPEff']['mem']
	conda:
		"../../envs/snpeff.yml"
	shell:
		"""
		java -Xmx{resources.memory} \
			-jar {input.jar} \
			-c {input.config} \
			-ud 2000 \
			-v Gmax.2.0 \
			{input.vcf} | \
			bgzip -l 9 > {output}

		bcftools index --tbi {output}
		"""
