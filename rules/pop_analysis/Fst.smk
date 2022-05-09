rule Fst:
	input:
		vcf = expand("results/SNPsOnly_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB),
		ancestor_pop = "resources/ancestor_only_population_file.txt",
		elite_pop = "resources/elite_only_population_file.txt"
	output:
		expand("results/Fst_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.windowed.weir.fst", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	params:
		out_prefix = expand("results/Fst_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	conda:
		"../../envs/pop_analysis.yml"
	shell:
		"""
		vcftools \
			--weir-fst-pop {input.ancestor_pop} \
			--weir-fst-pop {input.elite_pop} \
			--fst-window-size 100000 \
			--fst-window-step 0 \
			--gzvcf {input.vcf} \
			--out {params.out_prefix}
		"""
