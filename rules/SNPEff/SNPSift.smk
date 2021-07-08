rule SNPSift:
	input:
		in_file = "results/SNPEff_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz",
		one_per_script = "/scratch/nad7wf/miniconda/pkgs/snpeff-5.0-hdfd78af_1/share/snpeff-5.0-1/scripts/vcfEffOnePerLine.pl",
		jar = "/scratch/nad7wf/miniconda/pkgs/snpsift-4.3.1t-hdfd78af_3/share/snpsift-4.3.1t-3/SnpSift.jar"
	output:
		vcf = "results/SNPSift_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz",
		idx = "results/SNPSift_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz.tbi",
		ann = "results/SNPSift_Ann_{RP_id}_{NRP_id}_Chr{chr}.vcf.gz"
	resources:
		memory = config['SNPSift']['mem']
	conda:
		"../../envs/snpeff.yml"
	shell:
		"""
		bcftools view {input.in_file} | \
			### Convert SNPEff annotations to one per line. ###
			{input.one_per_script} | \
			### Filter variants by primary transcript and modifying variants. ###
			java -jar {input.jar} filter \
			"(ANN[*].FEATUREID =~ 'Glyma\.\w+\.1') && (ANN[*].EFFECT =~ '(frameshift_variant|exon_loss_variant|duplication|inversion|feature_ablation|gene_fusion|rearranged_at_DNA_level|missense_variant|protein_protein_contact|structural_interaction_variant|rare_amino_acid_variant|splice_acceptor_variant|splice_donor_variant|stop_lost|start_lost|stop_gained|inframe_insertion|disruptive_inframe_insertion|inframe_deletion|disruptive_inframe_deletion)')" | \
			bgzip -l 9 > {output.vcf}

			### Index VCF file. ###
			bcftools index --tbi {output.vcf}

			### Extract annotations from VCF file. ###
			bcftools view {output.vcf} | \
				java -jar {input.jar} extractFields - \
				-e "NA" \
				CHROM POS REF ALT "ANN[*].GENE" "ANN[*].ALLELE" "ANN[*].EFFECT" "ANN[*].HGVS_P" | \
				bgzip -l 9 > {output.ann}
		"""
