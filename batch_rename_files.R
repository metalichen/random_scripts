#!/usr/bin/env Rscript
################################################################################################
#### This script batch-renames files in a given folder based on a tsv file with new names
#### Usage: run the script from the command line. The script takes two arguments:
#### Rscript code/batch_rename_files.R <PATH_TO_FOLDER> <TSV_TABLE>
#### Tsv table should follow format "OLD PREFIX\tNEW PREFIX", e.g.
#### "201ACAA397 gnat_alg_f1_r1_GTX0247"
#### NB: the script designed to keep the file extentions intact. 
#### Do not include file extentions in the tsv file!
#### NB: the script RENAMES the files. Make sure to keep the raw data files in some safe place
################################################################################################

args = commandArgs(trailingOnly=TRUE)

library(dplyr)
library(purrr)
#read file list
dir<-args[1]
files<-list.files(dir)

#read the file with new names. 
#Should be a tsv table, each line following the pattern "OLD PREFIX\tNEW PREFIX", e.g.
#201ACAA397 gnat_alg_f1_r1_GTX0247

names<-read.delim(args[2],header=F)
colnames(names)<-c("old_prefix","new_prefix")

#filter only files whose prefix is in the file_renaming.txt
files_data_frame<-data.frame(files)
files_data_frame$old_prefix<-as.character(map(strsplit(as.character(files_data_frame$file), split = "\\."), 1))
files_data_frame$extension<-as.character(map(strsplit(as.character(files_data_frame$file), split = "\\."), 2))
files_to_rename<-inner_join(files_data_frame,names)

#rename
for (row in 1:nrow(files_to_rename)){
  old_name<-paste(dir,as.character(files_to_rename[row,"files"]),sep='/')
  new_name<-paste(dir,"/",files_to_rename[row,"new_prefix"],".",files_to_rename[row,"extension"],sep='')
  file.rename(from=old_name,to=new_name)
  
}

