rule SNPEff:
	input:
		vcf = expand("results/MergeVCFs_{RP_id}_{NRP_id}_{subset}_Chr{{chr}}.vcf.gz", RP_id = RP_ID, NRP_id = NRP_ID, subset = SUBSET_ALL),
		eff_jar = "/scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/snpEff.jar",
		eff_config = "/scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/snpEff.config",
		sift_jar = "/scratch/nad7wf/miniconda/pkgs/snpsift-4.3.1t-hdfd78af_3/share/snpsift-4.3.1t-3/SnpSift.jar",
		one_per_script = "/scratch/nad7wf/miniconda/pkgs/snpeff-4.3.1t-0/share/snpeff-4.3.1t-0/scripts/vcfEffOnePerLine.pl"
	output:
		ann = expand("results/SNPEff_Ann_{RP_id}_{NRP_id}_Chr{{chr}}.txt.gz", RP_id = RP_ID, NRP_id = NRP_ID)
	resources:
		memory = config['SNPEff']['mem']
	conda:
		"../../envs/snpeff.yml"
	shell:
		"""
		java -Xmx{resources.memory} \
			-jar {input.eff_jar} \
			-c {input.eff_config} \
			-ud 2000 \
			-v -canon ensembl-Gmax2.0 \
			{input.vcf} | \
			{input.one_per_script} | \
			java -jar {input.sift_jar} filter \
			"ANN[*].EFFECT =~ '(frameshift_variant|exon_loss_variant|duplication|inversion|feature_ablation|gene_fusion|rearranged_at_DNA_level|missense_variant|protein_protein_contact|structural_interaction_variant|rare_amino_acid_variant|splice_acceptor_variant|splice_donor_variant|stop_lost|start_lost|stop_gained|inframe_insertion|disruptive_inframe_insertion|inframe_deletion|disruptive_inframe_deletion)'" | \
			java -jar {input.sift_jar} extractFields \
			-e "NA" - \
			CHROM POS REF ALT "ANN[*].GENE" "ANN[*].ALLELE" "ANN[*].EFFECT" "ANN[*].HGVS_P" | \
			bgzip -l 9 > {output.ann}
		"""
