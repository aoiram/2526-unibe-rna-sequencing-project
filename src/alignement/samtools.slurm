#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --output=/data/users/mamos/2526-unibe-rna-sequencing-project/results/alignement/slurm/slurm-samtools-%j.out
#SBATCH --cpus-per-task=6
#SBATCH --mem=32G
#SBATCH --nodes=1
#SBATCH --time=02:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_alignement_samtools

module load SAMtools/1.13-GCC-10.3.0

SAM_FILE=$1
REF_FILE=$2
OUT_FILE=$3
UNSORTED_FILE=${OUT_FILE%.bam}.unsorted.bam

#index reference for samtools (make the fai)
samtools faidx $REF_FILE

#convert sam to bam
samtools view -b -@ ${SLURM_CPUS_PER_TASK} -t ${REF_FILE}.fai ${SAM_FILE} > ${UNSORTED_FILE}

#sort
samtools sort -@ ${SLURM_CPUS_PER_TASK} -o $OUT_FILE ${UNSORTED_FILE}
rm ${UNSORTED_FILE}

#index bam (make the bai)
samtools index -@ ${SLURM_CPUS_PER_TASK} $OUT_FILE