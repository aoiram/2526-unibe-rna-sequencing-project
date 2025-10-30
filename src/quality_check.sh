#!/usr/bin/env bash

#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=1M
#SBATCH --time=00:02:10
#SBATCH --partition=pibu_el8
#SBATCH --job-name=go_to_sleep
#SBATCH --mail-user=mario.amos@students.unibe.ch
#SBATCH --mail-type=begin,end

# TODO something, someday, somehow