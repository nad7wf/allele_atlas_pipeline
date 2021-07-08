rule ImputeNRP:
	input:
		NRP = expand("results/Preformat_{id}_Chr{{chr}}.vcf.gz", id = NRP_ID),
		RP = expand("results/ImputeRP_{id}_Chr{{chr}}.vcf.gz", id = RP_ID)
	output:
		out_file = expand("results/ImputeNRP_{id}_Chr{{chr}}.vcf.gz", id = NRP_ID),
		out_tmp_dir = temp(directory(expand("results/beagle/ImputeNRP_{id}_Chr{{chr}}", id = NRP_ID)))
	params:
		jar = "resources/beagle/beagle.28Jun21.220.jar",
		prefix = expand("results/ImputeNRP_{id}_Chr{{chr}}", id = NRP_ID)
	resources:
		memory = config['ImputeNRP']['mem'],
		threads = config['ImputeNRP']['cpus']
	shell:
		"""
		module load bcftools
		mkdir -p {output.out_tmp_dir}

		java -Xmx{resources.memory}G \
			-Djava.io.tmpdir={output.out_tmp_dir} \
			-jar {params.jar} \
			nthreads={resources.threads} \
			impute=true \
			ref={input.RP} \
			gt={input.NRP} \
			out={params.prefix}

                bcftools index --tbi {output.out_file}

		rm "{params.prefix}.log"
		"""
