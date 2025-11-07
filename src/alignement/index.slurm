#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --output=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/slurm/slurm-alignement-index-%j.out
#SBATCH --cpus-per-task=2
#SBATCH --mem=12G
#SBATCH --nodes=1
#SBATCH --time=3:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_alignement_index

# PATH
REF_FILE=/data/users/mamos/data/mouse_genome/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz
INDEX_BASENAME=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/index/index

# CONTAINERS PATH
HISAT_CONTAINER=/containers/apptainer/hisat2_samtools_408dfd02f175cd88.sif

apptainer exec $HISAT_CONTAINER hisat2-build $REF_FILE $INDEX_BASENAME -p ${SLURM_CPUS_PER_TASK}