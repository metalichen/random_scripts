##extact reads aligning to a list of contigs and their mates wherever they are
##$1: sorted bam file; $2: list of contig ids; $3 and $4: raw reads in fastq format
##NB: read names should be like this: ‘HISEQ:446:CBBTFANXX:3:2316:20576:88205 1:N:0:AGTTCC’  ¯\_(ツ)_/¯
while read i ; do samtools  view $1 $i | cut -f1 ; done < $2 > read_ids.txt #write a file with reads ids
sort read_ids.txt | uniq > read_ids_dedupl.txt  #deduplicate the read list
/scratch/1/gulnara/soft/bbmap/filterbyname.sh in1=$3 in2=$4 out1=extracted_reads_fw.fq out2=extracted_reads_re.fq names=read_ids_dedupl.txt include #extract contigs using a script from bbmaps
