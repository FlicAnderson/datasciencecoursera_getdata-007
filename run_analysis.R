## Coursera :: GettingAndCleaningData :: CourseProject :: run_analysis.R
## ======================================================================== 
## (12th September 2014)
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
 
# ----------------------------------SETUP------------------------------------- #

# empty environment
rm(list=ls())

# install/load necessary packages: 
if (!require(tidyr)){         # if package not loaded
  install.packages("tidyr")   # install package if required
  library(tidyr)              # load package
} 

# =================================STEP-1===================================== #

## READ IN ACTIVITY LABELS
  # read in activity labels 
activities <- read.table("./activity_labels.txt")
  # v1 - label number (1-6)
  # v2 - activity label string ("WALKING" : "LAYING")

## READ IN FEATURES VARIABLES
  # read in features variables
features <- read.table("./features.txt")
  # V1 - feature number (1-561)
  # V2 - feature name ("tBodyAcc-mean()-X" : "angle(Z,gravityMean)")

## READ IN TRAINING SET 
  # read in training set data to variable named train
train <- read.table("./train/X_train.txt", col.names=features[,2])
  # read in subject info for training set
train_subject <- read.table("./train/subject_train.txt", col.names="subject")
  # read in training data set labels 
train_labels <- read.table("./train/y_train.txt", col.names="activity")

## READ IN TEST SET 
  # read in test set data to variable named test
test <- read.table("./test/X_test.txt", col.names=features[,2])
  # read in subject info for test set
test_subject <- read.table("./test/subject_test.txt", col.names="subject")
  # read in test data set labels 
test_labels <- read.table("./test/y_test.txt", col.names="activity")

## ATTACH ACTIVITY LABEL VALUES AND SUBJECT INFO TO DATA
  # add activity values as a column onto training set data
train <- cbind(train, train_subject, train_labels)
  # add activity values as a column onto test set data
test <- cbind(test, test_subject, test_labels)

## MERGE TEST AND TRAINING SETS
  # collate train and test sets into one dataset using rbind: 
datA <- rbind(train, test)

# =================================STEP-2===================================== #

## EXTRACT THE MEASUREMENTS
  # sort the mean and standard deviation feature variable indices 
mean_std <- sort( # sort variables by index
        c(                                # concatonate grep results
        grep("mean\\(", features[,2]),  # mean variables (not inc. meanFreq())
        grep("std", features[,2])       # standard deviation variables
        )
)

  # use those indices to subset the data
datA <- datA[,   # overwrite datA object with the following extract:
        c(                   
        mean_std,           # means & standard deviations (via column indices)
        ncol(datA)-1,       # subject number (penultimate column)
        ncol(datA)          # activity values (last column)
        )
]

# =================================STEP-3===================================== #

## NAME THE ACTIVITIES
  # make activity a factor in the dataset
datA$activity <- as.factor(datA$activity)
  # set the levels of the new factor as the names of the activities
levels(datA$activity) <- activities[,2]

# =================================STEP-4===================================== #

## NAME THE VARIABLES
  # create a vector of names from current names & clean them up for readability
  # fix feature measurement names using regular expressions:
a <- names(datA)              # create vector 'a' of current names
a <- gsub("[\\.]+", "_", a)   # remove all the dots and replace w/ an underscore
a <- gsub("_$", "", a)        # remove underscores at end of string (eg. "mean_")
  # NB: these did not affect 'subject' or 'activity'

  # change placeholder names of subject and activity to more descriptive names:
a <- gsub("subject", "subject_ID", a)
a <- gsub("activity", "activity_type", a)

  # change data names to the easier-to-read ones
names(datA) <- a

# =================================STEP-5===================================== #

## CREATE INDEPENDENT TIDY DATASET
  # create independent dataset from tidy data:
SamsungGSII_sensorData <- datA %>% 
          # gather measurement variables into 'measurement' column 
          # & their values into 'value'
        gather(measurement, value, tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std) %>%
          # group data by subject, activity, and measurement
        group_by(subject_ID, activity_type, measurement) %>%
          # print summary of data, calculating mean of values
        summarize(meanFeatureValue=mean(value))

## WRITE OUT TIDY DATASET
  # write data out as .txt file without row-names
write.table(
        SamsungGSII_sensorData, 
        file="SamsungGSII_sensorData.txt", 
        row.names=FALSE
)
