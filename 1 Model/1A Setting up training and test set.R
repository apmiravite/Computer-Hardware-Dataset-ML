library(tidyverse)
library(caTools) #Don't forget to import me

#From part 0
hardware <- read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/cpu-performance/machine.data',
                     stringsAsFactors = F, header = F)
colnames(hardware)<- c('Vendor', 'Model Name','MYCT','MMin','MMax','CACH','CHMin','CHMax','PRP','ERP')
CHAve= (hardware$CHMin+hardware$CHMax)/2
MAve= (hardware$MMin+hardware$MMax)/2
hardware=cbind(hardware, CHAve, MAve)
dim(hardware)

set.seed(1) # generates random number
# spliting the data as training and testing in ratio of 0.8/0.2
split= sample(209,167) 

#Training set
training_set = hardware[split,] # storing the training set values
dim(training_set) # Checking the dimension of training set

#Test set
test_set=hardware[-split,] # store the remaining data
dim(test_set) # checking the dimension of the test set
