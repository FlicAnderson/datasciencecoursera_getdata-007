## Coursera :: GettingAndCleaningData :: CourseProject :: run_analysis.R
## ======================================================================== 
## (4th September 2014)
## Author: Flic Anderson
##

## AIM:  clean data set & run analysis on resulting tidy data.
# ... Merge training & test sets to create one data set, extract only measurements 
# ... on the mean and standard deviation for each measurement, use descriptive  
# ... activity names to name activities in the data set, and appropriately label
# ... data set with descriptive variable names. 
# ... From descriptively named dataset, create a second, independent tidy data 
# ... set w/ average of each variable for each activity and each subject.

## ...  

setwd("Z://CMEP/Rstats/Coursera_GettingAndCleaningData/CourseProject/")

# source functions: 