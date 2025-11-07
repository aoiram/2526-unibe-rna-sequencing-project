#!/usr/bin/env bash

data_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/data/toxoplasma_de/reads_Lung"
result_folder="/data/users/${USER}/2526-unibe-rna-sequencing-project/results/quality_check/lung"

#create and go to the TP directory
mkdir -p $result_folder

for k in `ls -1 $data_folder/*1.fastq.gz | awk '{print substr($0, 1, length($0)-11)}'`;
do
    sbatch ./src/quality_check.slurm $k $result_folder;
done