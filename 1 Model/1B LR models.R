library(tidyverse)
libary(caTools)

#From part 0
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
hardware=cbind(hardware, CACHE, CHAve, MAve, SPEED, CHCAP, SQRERF, CHCAP_norm, MAve_norm, CACHE_norm, SQRERF_norm)

#Show the dimensions of hardware dataframe
dim(hardware)

#From part 1A
set.seed(1) # generates random number
# spliting the data as training and testing in ratio of 0.8/0.2
split= sample(209,167) 

#Training set
training_set = hardware[split,] # storing the training set values
dim(training_set) # Checking the dimension of training set

#Test set
test_set=hardware[-split,] # store the remaining data
dim(test_set) # checking the dimension of the test set

#Additional codes start here

#LR
linear_train=lm(formula=SQRERF~MAve+CACHE+CHCAP, data=training_set)
summary(linear_train)

linear_norm_train=lm(formula=SQRERF_norm~MAve_norm +CACHE_norm+CHCAP_norm, data=training_set)
summary(linear_norm_train)
