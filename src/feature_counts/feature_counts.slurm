#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --output=/data/users/mamos/2526-unibe-rna-sequencing-project/results/feature_counts/slurm/slurm-feature-count-%j.out
#SBATCH --cpus-per-task=8
#SBATCH --mem=4G
#SBATCH --nodes=1
#SBATCH --time=02:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_feature_counts

GTF_FILE=/data/users/mamos/data/mouse_annotation/Mus_musculus.GRCm39.115.gtf
CONTAINER=/containers/apptainer/subread_2.0.6.sif
SORTED_BAM=/data/users/${USER}/2526-unibe-rna-sequencing-project/results/alignement/bam/*.bam

apptainer exec $CONTAINER featureCounts -a ${GTF_FILE} \
-o counts.txt \
-T ${SLURM_CPUS_PER_TASK} \
-s 2 \
-p \
$(ls $SORTED_BAM)