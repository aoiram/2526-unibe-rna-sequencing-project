#!/usr/bin/env bash

data_blood_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/data/toxoplasma_de/reads_Blood"
data_lung_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/data/toxoplasma_de/reads_Lung"
result_blood_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/results/quality_check/blood"
result_lung_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/results/quality_check/lung"

#create and go to the TP directory
mkdir $result_blood_folder
mkdir $result_lung_folder

for k in `ls -1 $data_blood_folder/*.fastq.gz`;
do sbatch ./src/quality_check.slurm $k $result_blood_folder;
done

for k in `ls -1 $data_lung_folder/*.fastq.gz`;
do sbatch ./src/quality_check.slurm $k $result_lung_folder;
done

#java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar SE -phred33 -threads 4 JK2*_R1*.fastq.gz JK2_cleaned.fastq.gz ILLUMINACLIP:TruSeq3-SE:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:51
#
#java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.39.jar PE -phred33 -threads 4 D-4*_R1*.fastq.gz D-4*_R2*.fastq.gz D-4_1trim.fastq.gz D-4_1unpaired.fastq.gz D-4_2trim.fastq.gz D-4_2unpaired.fastq.gz LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:50
#
#fastqc -t 2 JK2_cleaned.fastq.gz
#fastqc -t 2 D-4_*trim.fastq.gz
#
#multiqc .