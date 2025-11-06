#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --cpus-per-task=1
#SBATCH --mem=1G
#SBATCH --nodes=1
#SBATCH --time=00:10:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_multiqc

module load MultiQC/1.11-foss-2021a # MultiQC lib

result_dir=${1}

mkdir -p ${result_dir}/multiqc_report/

multiqc ${result_dir}/raw ${result_dir}/trimmed -o ${result_dir}/multiqc_report/

# run with /data/users/mamos/2526-unibe-rna-sequencing-project/