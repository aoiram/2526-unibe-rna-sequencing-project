#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --output=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/slurm/slurm-alignement-index-%j.out
#SBATCH --cpus-per-task=4
#SBATCH --mem=16G
#SBATCH --nodes=1
#SBATCH --time=03:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_alignement_index

# PATH
# MAKE SURE TO HAVE THE UNZIPPED VERSION OF REFERENCE (.fa and not .fa.gz)
REF_FILE=/data/users/mamos/data/mouse_genome/Mus_musculus.GRCm39.dna.primary_assembly.fa
INDEX_BASENAME=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/index/index
SPLICE_SITE_FILE=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/splice_sites.txt
EXON_FILE=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/exons.txt

# CONTAINERS PATH
CONTAINER=/containers/apptainer/hisat2_samtools_408dfd02f175cd88.sif

apptainer exec $CONTAINER hisat2-build $REF_FILE $INDEX_BASENAME -p ${SLURM_CPUS_PER_TASK} -ss ${SPLICE_SITE_FILE} --exon ${EXON_FILE}