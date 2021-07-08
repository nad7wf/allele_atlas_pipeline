rule AlleleAtlas:
	input:
		vcf = "results/MergeVCFs_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz",
		ann = "results/SNPEff_Ann_{RP_id}_{NRP_id}_Chr{chr}.txt.gz",
		gff = "resources/Gmax_v2.gff.gz",
		script = "rules/custom/scripts/generate_allele_atlas.py"
	output:
		out_file = "results/AlleleAtlas_{RP_id}_{NRP_id}_Chr{chr}.txt.gz",
		bottleneck = "results/Bottleneck_genes_{RP_id}_{NRP_id}_Chr{chr}.txt.gz",
		housekeeping = "results/Housekeeping_genes_{RP_id}_{NRP_id}_Chr{chr}.txt.gz"
	conda:
		"../../envs/custom.yml"
	shell:
		"""
		zgrep -v "^##" {input.vcf} | \
			python3 {input.script} \
			--vcf - \
			--ann {input.ann} \
			--gff {input.gff} \
			--bottleneck {output.bottleneck} \
			--housekeeping {output.housekeeping} \
			--out {output.out_file}
		"""
