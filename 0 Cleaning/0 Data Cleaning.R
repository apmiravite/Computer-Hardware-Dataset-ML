library(tidyverse)

#Loads the data from the website
hardware <- read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/cpu-performance/machine.data',
                     stringsAsFactors = F, header = F)

#Label the column names properly
colnames(hardware)<- c('Vendor', 'Model Name','MYCT','MMin','MMax','CACH','CHMin','CHMax','PRP','ERP')

#Optional: Add two more columns, CHAve and MAve
CHAve= (hardware$CHMin+hardware$CHMax)/2
MAve= (hardware$MMin+hardware$MMax)/2
hardware=cbind(hardware, CHAve, MAve)

#Show the dimensions of hardware dataframe
dim(hardware)
