#!/usr/bin/env bash

# PATH
FASTQ_DIR=/data/users/mamos/2526-unibe-rna-sequencing-project/data/toxoplasma_de/reads_Lung
OUT_DIR=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/sam
INDEX_BASENAME=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/index/index
SPLICE_SITE_FILE=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/splice_sites.txt

# MAP EACH FASTQ TO REF
for file_1 in `ls -1 $FASTQ_DIR/*_1.fastq.gz`; do
    file_2=${file_1%_1.fastq.gz}_2.fastq.gz
    sample_name=$(basename ${file_1%_1.fastq.gz})
    sbatch ${BASH_SOURCE[0]%/mapping.sh}/mapping.slurm $file_1 $file_2 $sample_name $INDEX_BASENAME $OUT_DIR $SPLICE_SITE_FILE
done