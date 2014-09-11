## Coursera :: GettingAndCleaningData :: CourseProject :: run_analysis.R
## ======================================================================== 
## (4th September 2014)
## Author: Flic Anderson
##

## AIM:  clean data set & run analysis on resulting tidy data.
# ... 
# ... Merge training & test sets to create one data set
# ... extract only measurements on mean & standard deviation for ea. measurement 
# ... use descriptive activity names to name activities in the data set
# ... appropriately label data set with descriptive variable names 
# ... 
# ... From descriptively named dataset, create second, independent tidy data 
# ... set w/ average of each variable for each activity and each subject.
 
# set working directory
setwd("Z://CMEP/Rstats/Coursera_GettingAndCleaningData/CourseProject/")

# install/load necessary packages: 
#if (!require()){         # if package not loaded
#  install.packages("")   # install package if required
#  library()              # load package
#} 

# ------ LIST FILES --------#

# list all files in the directory
list.files()
  # list files in the train directory
  list.files("./train/")
  # list files in the test directory
  list.files("./test/")

#--------- READ IN-------------#

## ACTIVITY LABELS
  # read in activity labels & show dimensions
activities <- read.table("./activity_labels.txt"); dim(labels)
  # v1 - label number (1-6)
  # v2 - activity label string ("WALKING" : "LAYING")

## FEATURES VARIABLES
  # read in features variables & show dimensions
features <- read.table("./features.txt"); dim(features)
  # V1 - feature number (1-561)
  # V2 - feature name ("tBodyAcc-mean()-X" : "angle(Z,gravityMean)")

## TRAINING SET 
  # read in training set data to variable named train; then show dimensions
train <- read.table("./train/x_train.txt", col.names=features[,2]); dim(train)
  # 7352 rows, 561 columns

  # read in subject info for training set
train_subject <- read.table("./train/subject_train.txt", col.names="subject"); dim(train_subject)
  # 7352 rows, 1 column

  # read in training data set labels & show dimensions
train_labels <- read.table("./train/y_train.txt", col.names="activity"); dim(train_labels)
  # 7352 rows, 1 column



## TEST SET 
  # read in test set data to variable named test; then show dimensions
test <- read.table("./test/x_test.txt", col.names=features[,2]); dim(test)
  # 2947 rows, 561 columns

  # read in subject info for test set
test_subject <- read.table("./test/subject_test.txt", col.names="subject"); dim(test_subject)

  # 2947 rows, 1 column
  
  # read in test data set labels & show dimensions
test_labels <- read.table("./test/y_test.txt", col.names="activity"); dim(test_labels)
  # 2947 rows, 1 column

#--------- ATTACH ACTIVITY LABEL VALUES  -------------#

## ATTACH ACTIVITY LABEL VALUES TO DATA
  # add activity values as a column onto training set data
train <- cbind(train, train_subject, train_labels); dim(train)
  # add activity values as a column onto test set data
test <- cbind(test, test_subject, test_labels); dim(test)


#--------- MERGE -------------#

# collate train and test sets into one dataset using rbind: 
datA <- rbind(train, test); dim(datA)

#--------- EXTRACT THE MEASUREMENTS -------------#

  # features with "mean" to find mean measurements (but not meanFreq())
#grep("mean\\(", features[,2])
  # features with "std" to find standard deviation measurements
#grep("std", features[,2])

  # collate the mean and std measurement variables 
#c(grep("mean\\(", features[,2]), grep("std", features[,2]))
  
# sort the mean and standard deviation feature variable indices 
mean_std <- sort(c(grep("mean\\(", features[,2]), grep("std", features[,2])))

# extract only means & standard deviations (column indices stored in mean_std)
# and also subject number - from ncol(datA)-1 ; the penultimate column
# and activity values - from ncol(datA) ; the last column
datA <- datA[, c(mean_std, ncol(datA)-1, ncol(datA))]

# show new dimensions of extracted measurements data
dim(datA)

#--------- NAME THE ACTIVITIES -------------#

# this shows there's the 1:30 thing, all OK there
table(datA$subject) 
##### maybe rename this as "subjectID"

# make activity a factor in the dataset
datA$activity <- as.factor(datA$activity)
# set the levels of the new factor as the names of the activities
levels(datA$activity) <- activities[,2]

#--------- NAME THE VARIABLES -------------#

# nicely name columns 1:66 (not activity or subject)
# descriptive names

