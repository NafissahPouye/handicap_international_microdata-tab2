library(readxl)      #for excel, csv sheets manipulation
library(sdcMicro)    #sdcMicro package with functions for the SDC process 
library(tidyverse)   #for data cleaning

#Import data
setwd("C:/Users/LENOVO T46OS/Desktop/handicap_international_microdata_tab2")
data <- read_excel("data.xlsx")

#GeoPoll dataset
selectedKeyVars <- c('Q3',	'Q4',	'Q5',	'Q6'
)

#Convert variables into factors
cols =  c('Q3',	'Q4',	'Q5',	'Q6')
data[,cols] <- lapply(data[,cols], factor)

# Convert the sub file into dataframe
fileRes<-data[,selectedKeyVars]
fileRes <- as.data.frame(fileRes)

#Assess the disclosure risk
objSDC <- createSdcObj(dat = fileRes, keyVars = selectedKeyVars)
print(objSDC, "risk")
report(objSDC, filename = "index", internal = TRUE) 



