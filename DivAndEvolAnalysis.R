##Analysis of diversity and molecular evolution in ABP
##JP Gallagher

#set working directory
setwd("C:/Users/Joe/Documents/Dropbox/MolEvolOfABP/Data_Analysis")

#add PopGenome library to environment
library(PopGenome)

#This makes an object of class GENOME from the fastas contained within the directory ConsensusSeqs
#using gff file D5.CDS_range.gff as a reference for features
#Note that these only contain CDS exons and exon chunks, not UTRs, introns, etc. 
SeqCap.GENOME.class <- readData("ConsensusSeqs",gffpath="D5.CDS_range.gff")

#Set populations, i.e. group species
#read in populations from outside file popList.txt
pops <- strsplit(scan(file = "popList.txt", what = "", sep = "\n"), "\t")
names(pops) <- sapply(pops, '[[', 1)
pops <- lapply(pops, '[', -1)
SeqCap.GENOME.class <- set.populations(SeqCap.GENOME.class,pops)

#Start by calculating pi for the cds
#Might have to redo this for whole gene
SeqCap.GENOME.class <- diversity.stats(SeqCap.GENOME.class)


