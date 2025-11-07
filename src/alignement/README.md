# Script run order
1. run `sbatch index.slurm`
2. run `sbatch hisat2_process_gtf.slurm`
3. run `./mapping.sh`
4. run `./samtools.sh`

# Important notes

genome (fasta) files needs to be unzipped to build the index. Same for the annotation (gtf) for the splice sites extraction

# Notes or usefull commands
I'll sort it one day (maybe not ^^')
```bash
# COPY OF REF AND ANNOT
rsync -Lav rsync://ftp.ebi.ac.uk/ensemblorg/pub/release-115/gtf/mus_musculus/ your_folder
#sync -Lav rsync://ftp.ebi.ac.uk/ensemblorg/pub/release-115/fasta/mus_musculus/dna/ your_folder

# INTERACTIVE RUN FOR SHELL RUN OF CONTAINERS
srun --cpus-per-task=1 --mem=4G --time=01:00:00 --pty --partition=pibu_el8 bash


# UNZIP FASTA AND GTF
gunzip -c ../data/mouse_annotation/Mus_musculus.GRCm39.115.gtf.gz > your_folder
gunzip -c ../data/mouse_genome/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz > your_folder
```