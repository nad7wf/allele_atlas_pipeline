#############################################################################################################
### The extracted SNPEff/SNPSift output file is not quite in the correct format for the allele catalogue. ###
### This function accepts the annotation file as input and returns a reformatted dataframe.		  ###
### Major changes include:										  ###
###	Triplet to single-letter amino acid codes.							  ###
###	Aggregating annotations from multiallelic records into a single row.				  ###
#############################################################################################################

def prep_ann_file(dat):

	### Rename SNPEff columns. ###
	dat.rename(
		columns = {
			'ANN[*].GENE': 'GENE',
			'ANN[*].ALLELE': 'ALLELE',
			'ANN[*].EFFECT': 'EFFECT',
			'ANN[*].HGVS_P': 'AA'
		},
		inplace = True
	)
	
	### Replace triplet amino acid codes with single-letter codes. ###
	dat['AA'].replace(
		{
			"^p\.": "",
			"Arg": "R",
	        	"His": "H",
	        	"Lys": "K",
	        	"Asp": "D",
	        	"Glu": "E",
	        	"Ser": "S",
	        	"Thr": "T",
	        	"Asn": "N",
	        	"Gln": "Q",
	        	"Cys": "C",
	        	"Gly": "G",
	        	"Pro": "P",
	        	"Ala": "A",
	        	"Val": "V",
	        	"Ile": "I",
	        	"Leu": "L",
	        	"Met": "M",
	        	"Phe": "F",
	        	"Tyr": "Y",
	        	"Trp": "W"
		},
		regex = True, 
		inplace = True
	)
	
	### Concat Effect info columns into single string. ###
	dat['ANN'] = dat[['ALLELE', 'EFFECT', 'AA']].apply(
		lambda row: '|'.join(
			row.dropna().astype(str).values
			), 
		axis = 1
	)
	
	### Add Ref anotation to ANN column. ###
	dat['ANN'] = dat[['REF', 'ANN']].apply(
		lambda row: ','.join(['|'.join([row['REF'], 'Ref']), row['ANN']]),
		axis = 1
	)
	
	### Remove un-concatenated Effect info colums. ###
	dat.drop(
		['ALLELE', 'EFFECT', 'AA'],
		axis = 1,
		inplace = True
	)
	
	### Use variant position to group and combine multiple effects/variants for the same position. ###
	dat = dat.groupby(
		['CHROM', 'POS'],
		as_index = False
	).agg(
		{
			'REF': 'first',
			'ALT': 'first',
			'GENE': 'first',
			'ANN': ','.join
		}
	)

	return(dat)






#####################
### Begin script. ###
#####################


### Import packages. ###
import argparse as ap
import pandas as pd
import numpy as np
import re
import sys

### Parse command line arguments. ###
parser = ap.ArgumentParser()
parser.add_argument('--vcf', dest = 'vcf', type = ap.FileType('r'), default = '-')
parser.add_argument('--gff', dest = 'gff')
parser.add_argument('--ann', dest = 'ann')
parser.add_argument('--bottleneck', dest = 'bottleneck')
parser.add_argument('--housekeeping', dest = 'housekeeping')
parser.add_argument('--out', dest = 'out')
args = parser.parse_args()





##################################################################
### Massage VCF and Annotations file into Allele Atlas format. ###
##################################################################

### Read in and reformat annotation file. ###
ann = pd.read_csv(
	args.ann, 
	sep = '\t',
	na_values = "NA"
)

ann = prep_ann_file(ann)

### Import VCF file. ###
vcf = pd.read_csv(
	args.vcf, 
	sep = '\t'
).rename(
	columns = {'#CHROM': 'CHROM'}
).drop(
	['ID', 'QUAL', 'INFO', 'FILTER', 'FORMAT'], 
	axis = 1
)


### Merge VCF file with SNPEff annotations. ###
comb = pd.merge(
	ann, 
	vcf, 
	how = 'inner', 
	on = ['CHROM', 'POS', 'REF', 'ALT']
)


### Replace numeric genotype with variant sequence + effect. ###
for col in comb.columns[6:]:
	comb[col] = (comb['ANN'] + ',' + comb[col].str.split('|').str[0]).str.split(',') \
	.apply(
		lambda row: row[int(row[-1])] if int(row[-1]) < len(row[:-1]) else row[0]
	)

### Add column for Williams 82. ###
comb['PI_518671'] = comb.apply(lambda df: df['ANN'].split(',')[0], axis = 1)
comb['POS'] = comb['POS'].apply(str)

### Aggregate all the variant positions per gene into a single allele. ###
def aggregate_by_gene(df):
	return(df.iloc[:, np.r_[4, 1, 6:len(df.columns)]].groupby('GENE', as_index = False).agg(' '.join))

comb = aggregate_by_gene(comb) \
.melt(
	id_vars = ['GENE', 'POS'],
	var_name = 'ACCESSION',
	value_name = 'EFFECT'
)





########################################################################
### This section generates the binary Ancestor code for each allele. ###
########################################################################


### Extract North American ancestors from dataframe. ###
ancestor_list = ['PI_548362','PI_548379','PI_548445','PI_548406','PI_548488','PI_548298','PI_548348','PI_548477','PI_548391','HN071_PI548657','PI_548603','PI_548485','PI_548311','USB-002_FC033243','PI_548456','PI_548382']
ancestor_df = comb.query('ACCESSION in @ancestor_list').copy()


### Sort ancestor dataframe in order of their contribution to US germplasm (according to Bandillo et al). ###
ancestor_df['idx'] = ancestor_df['ACCESSION'].map(dict(zip(ancestor_list, range(len(ancestor_list)))))
ancestor_df.sort_values('idx', inplace = True)
ancestor_df.drop('idx', axis = 1, inplace = True)

### Find genes where all 16 ancestors have the same allele (bottleneck genes) and print them to file.
allele_count = ancestor_df.groupby(['GENE', 'EFFECT'])['ACCESSION'].count().reset_index().query('ACCESSION == 16')
allele_count.to_csv(
	args.bottleneck,
	sep = '\t',
	columns = ['GENE'],
	header = False,
	index = False,
	compression = 'gzip'
)


### For each allele, determine which of the ancestors it matches. ###
def match_ancestor_alleles(gene_name):
	anc_alleles = ancestor_df.loc[(ancestor_df['GENE'] == gene_name), 'EFFECT'].tolist()
	return(
		comb.loc[(comb['GENE'] == gene_name)] \
		.groupby('EFFECT') \
		.apply(
			lambda EFFECT: ''.join([str(int(EFFECT.name == aa)) for aa in anc_alleles])
		)
	)

matched_alleles = comb.groupby(
	'GENE',
).apply(
	lambda GENE: match_ancestor_alleles(GENE.name)
).to_frame(
	name = 'ANC_CODE'
).reset_index()

comb = comb.merge(
	matched_alleles,
	how = 'left',
	on = ['GENE', 'EFFECT']
)


### Write list of bottleneck genes to file. ###
#comb.loc[(comb['ACCESSION'] == 'PI_548362') & (comb['ANC_CODE'] == '111111111111111')] \
#.to_csv(
#	args.bottleneck,
#	sep = '\t',
#	columns = ['GENE'],
#	header = False,
#	index = False,
#	compression = 'gzip'
#)






##################################################################################################################################
### Any gene where there is not modifying variation is considered a housekeeping gene and needs to be added from the GFF file. ###
##################################################################################################################################

### Read in genes from GFF file. ###
gff = pd.read_csv(
       args.gff,
       sep = '\t',
       comment = '#',
       header = None
).iloc[:, 8] \
.str.extract("^ID=(Glyma\.\d{2}G\d+)")

### Rename column to 'GENE'. ###
gff = gff.rename({0: 'GENE'}, axis = 1) \
.drop_duplicates() 

### Filter for genes with no variation. ###
gff = gff[~gff.GENE.isin(comb.GENE)]

### Add filler value '-' for other columns in 'comb' dataframe. ###
gff[['POS', 'EFFECT', 'ANC_CODE']] = pd.DataFrame([['-', '-', '-']], index = gff.index)

### Function to add each housekeeping gene once per accession. ###
def add_housekeeping_genes(acc_df, acc_name):
	gff_group = gff.copy()
	gff_group['ACCESSION'] = pd.DataFrame([[acc_name]], index = gff_group.index)
	return(
		pd.concat([acc_df, gff_group])
	)

comb = comb.groupby('ACCESSION', group_keys = False) \
.apply(lambda ACCESSION: add_housekeeping_genes(ACCESSION, ACCESSION.name)) \
.sort_values(['ACCESSION', 'GENE']) \
.reset_index(drop = True)

### Write list of housekeeping genes to file. ###
gff.to_csv(
	args.housekeeping,
	sep = '\t',
	columns = ['GENE'],
	header = False,
	index = False,
	compression = 'gzip'
)






################################################################################
### Reorder dataframe by ACCESSION and write dataframe to final output file. ###
################################################################################

### Reorder dataframe so ACCESSION is column 1. ###
comb_cols = comb.columns.values.tolist()
comb_cols.pop(comb_cols.index('ACCESSION'))
comb = comb[['ACCESSION'] + comb_cols]

### Write final dataframe to output file. ###
comb.to_csv(
	args.out,
	sep = '\t',
	index = False,
	compression = 'gzip'
)
