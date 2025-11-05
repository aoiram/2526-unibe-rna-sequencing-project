#!/usr/bin/env bash

#SBATCH --mail-type=begin,end,error
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --cpus-per-task=2
#SBATCH --mem=25G
#SBATCH --nodes=1
#SBATCH --time=2:00:00
#SBATCH --partition=pibu_el8
#SBATCH --job-name=quality_check

data_blood_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/data/toxoplasma_de/reads_Blood"
data_lung_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/data/toxoplasma_de/reads_Lung"
result_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/results/quality_check"

#source /data/users/lfalquet/SBC07107_25/scripts/module.sh

#create and go to the TP directory
mkdir result_folder
cd result_folder

for k in `ls -1 *.fastq.gz`;
do fastqc -t 2 ${k};
done

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar SE -phred33 -threads 4 JK2*_R1*.fastq.gz JK2_cleaned.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -phred33 -threads 4 D-4*_R1*.fastq.gz D-4*_R2*.fastq.gz D-4_1trim.fastq.gz D-4_1unpaired.fastq.gz D-4_2trim.fastq.gz D-4_2unpaired.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:100

fastqc -t 2 JK2_cleaned.fastq.gz
fastqc -t 2 D-4_*trim.fastq.gz

multiqc .