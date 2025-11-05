#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --nodes=1
#SBATCH --time=1:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_quality_check_$1

module load FastQC/0.11.9-Java-11 # QC lib

fastqc -t 2 ${1} -o $2;