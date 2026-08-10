##filtering matrix to include only the eykaryotes
library(xlsx)
library(tidyverse)

pfam_version_35 <- read.table('unfiltered_allspecies_vs_pfams_binary.tsv', header=T, row.names = 1) #read the  the binary matrix made using block 1 of 'PFAM- ENC analysis' on python
eukaryotic_species <- read_excel('Supplementary File 6 full eukspecies.xlsx')
eukaryotic_species <- eukaryotic_species[1]
euk_species <- c()
for (i in eukaryotic_species){
  i <- paste("X",i,sep="")
  euk_species <- c(euk_species,i)
  return(euk_species)
}
euk_species_inboth <- all_of(intersect(colnames(pfam_version_35), euk_species))
euk_mat <- pfam_version_35 %>% select(euk_species_inboth)
t_eukaryotes <- t(euk_mat)
##make a new matrix with eukaryotic pfams
dim(t_eukaryotes)

#write.csv(binary_pfams_eukonly, "eukaryoti matrix.csv")
