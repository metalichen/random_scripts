# random_scripts

## gpx_to_tsv.py
Takes all gpx files from current folder and produces a tsv (tab-separated values) file containin the id, long, lat, elevation, and time of the waypoints from these files.  
Libraries used: gpxpy, glob.  

## extract_reads_by_contig.sh
Extracts reads aligning to a list of contigs and their mates wherever they are.  
Libraries used: samtools, bbmap.  

## batch_rename_files.R
An R script that renames files in a given folder based on a tsv table with new and old names (minus file extensions). The script preserves file extentions.  
Libraries used: dplyr, purrr.
