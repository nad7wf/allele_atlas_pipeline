rule ImputeRP:
	input:
		expand("results/Preformat_{id}_Chr{{chr}}.vcf.gz", id = RP_ID)
	output:
		out_file = expand("results/ImputeRP_{id}_Chr{{chr}}.vcf.gz", id = RP_ID),
		out_tmp_dir = temp(directory(expand("results/beagle/ImputeRP_{id}_Chr{{chr}}", id = RP_ID)))
	params:
		jar = "resources/beagle/beagle.28Jun21.220.jar",
		prefix = expand("results/ImputeRP_{id}_Chr{{chr}}", id = RP_ID)
	resources:
		memory = config['ImputeRP']['mem'],
		threads = config['ImputeRP']['cpus']
	shell:
		"""
		module load bcftools
		mkdir -p {output.out_tmp_dir}

		java -Xmx{resources.memory}G \
			-Djava.io.tmpdir={output.out_tmp_dir} \
			-jar {params.jar} \
			nthreads={resources.threads} \
			gt={input} \
			out={params.prefix}

		bcftools index --tbi {output.out_file}

		rm "{params.prefix}.log"
		"""
