#!/usr/bin/env bash

#SBATCH --mail-type=end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --output=/data/users/mamos/2526-unibe-rna-sequencing-project/results/quality_check/slurm/slurm-qc-%j.out
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --nodes=1
#SBATCH --time=1:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=rna_seq_quality_check

module load FastQC/0.11.9-Java-11 # QC lib
module load fastp/0.23.4-GCC-10.3.0 #FASTP lib

raw_file=${1} # without the strain number and extension
output_dir=${2}

mkdir -p $output_dir
mkdir -p ${output_dir}/raw
mkdir -p ${output_dir}/trimmed

fastqc -t ${SLURM_CPUS_PER_TASK} ${raw_file}_1.fastq.gz ${raw_file}_2.fastq.gz -o ${output_dir}/raw;

basename=$(echo $raw_file | xargs -n 1 basename)

fastp -i ${raw_file}_1.fastq.gz -I ${raw_file}_2.fastq.gz -o ${output_dir}/trimmed/${basename}_1_trimmed.fastq.gz -O ${output_dir}/trimmed/${basename}_2_trimmed.fastq.gz -j ${output_dir}/trimmed/${basename}_fastp.json -h ${output_dir}/trimmed/${basename}_fastp.html --thread ${SLURM_CPUS_PER_TASK} --trim_poly_g -l 50;

fastqc -t ${SLURM_CPUS_PER_TASK} ${output_dir}/trimmed/${basename}_1_trimmed.fastq.gz ${output_dir}/trimmed/${basename}_2_trimmed.fastq.gz -o ${output_dir}/trimmed;