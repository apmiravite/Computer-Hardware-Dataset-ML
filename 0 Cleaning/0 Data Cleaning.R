library(tidyverse)
libary(caTools)

#Loads the data from the website
hardware <- read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/cpu-performance/machine.data',
                     stringsAsFactors = F, header = F)

#Label the column names properly
colnames(hardware)<- c('Vendor', 'Model Name','MYCT','MMin','MMax','CACH','CHMin','CHMax','PRP','ERP')

#Transformations: Apply the necesary transfromations as in Ein-Dor(1987).
CHAve= as.integer((hardware$CHMin+hardware$CHMax)/2)+1
MAve= ((hardware$MMin+hardware$MMax)/2)*(10**-3)

SPEED= (1/hardware$MYCT)
CHCAP= CHAve*SPEED*10
SQRERF= hardware$ERP**0.5
CACHE= hardware$CACH*(10**-1)

#Normalize the data. We will use this later
MAve_norm = scale(MAve)
CHCAP_norm = scale(CHCAP)
CACHE_norm = scale(CACHE)
SQRERF_norm = scale(SQRERF)

#append the new columns to the table
hardware=cbind(hardware, CACHE, CHAve, MAve, SPEED, CHCAP, SQRERF, CHCAP_norm, MAve_norm, CACH_norm, SQRERF_norm)

#Show the dimensions of hardware dataframe
dim(hardware)
