### Copy reference and annotation (optional)
```bash
rsync -Lav rsync://ftp.ebi.ac.uk/ensemblorg/pub/release-115/gtf/mus_musculus/ your_folder
#sync -Lav rsync://ftp.ebi.ac.uk/ensemblorg/pub/release-115/fasta/mus_musculus/dna/ your_folder
```

# WE HAVE TO UNZIP FASTA FILE TO INDEX IT


1. run `sbatch index.slurm`
2. run `./alignement.sh`

I'll sort it one day (maybe (not))
```bash
GTF_FILE=/data/users/mamos/data/mouse_annotation/Mus_musculus.GRCm39.115.gtf.gz

srun --cpus-per-task=1 --mem=4G --time=01:00:00 --pty --partition=pibu_el8 bash


# gunzip -c ../data/mouse_annotation/Mus_musculus.GRCm39.115.gtf.gz > ../data/mouse_annotation/Mus_musculus.GRCm39.115.gtf


# gunzip -c ../data/mouse_genome/Mus_musculus.GRCm39.dna.primary_assembly.fa.gz > ../data/mouse_genome/Mus_musculus.GRCm39.dna.primary_assembly.f


```