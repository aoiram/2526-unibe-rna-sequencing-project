#!/usr/bin/env bash

# PATH
SAM_DIR=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/sam
OUT_DIR=/data/users/${USER}/2526-unibe-rna-sequencing-project/results/alignement/bam
REF_FILE=/data/users/mamos/data/mouse_genome/Mus_musculus.GRCm39.dna.primary_assembly.fa

# MAP EACH FASTQ TO REF
for file in `ls -1 $SAM_DIR/*.sam`; do
    sbatch ${BASH_SOURCE[0]%/samtools.sh}/samtools.slurm $file $REF_FILE ${OUT_DIR}/$(basename ${file%.sam}).bam
done