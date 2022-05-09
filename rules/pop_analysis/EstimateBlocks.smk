rule EstimateBlocks:
	input:
		expand("results/SNPsOnly_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)	
	output:
		blocks = expand("results/EstimateBlocks_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.blocks", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB),
		bed = expand("results/EstimateBlocks_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.bed.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	resources:
		mem = config['EstimateBlocks']['mem']
	params:
		output_prefix = expand("results/EstimateBlocks_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_SUB)
	conda:
		"../../envs/pop_analysis.yml"
	shell:
		"""
		### Create file of haplotype block boundaries. ###
		plink --blocks \
			no-pheno-req \
			no-small-max-span \
			--blocks-max-kb 5000 \
			--double-id \
			--memory {resources.mem} \
			--vcf {input} \
			--out {params.output_prefix}

		### Create BED file from Blocks file. ###
		sed '1d' ${params.output_prefix}.blocks.det | \
			sed -E "s/^ *([0-9]+)/Chr\1/" | \
			tr -s ' ' '\t' | \
			cut -f1-3 | \
			bgzip -l9 \
			> {output.bed}

		### Index BED file. ###
		tabix {output.bed}
		"""
