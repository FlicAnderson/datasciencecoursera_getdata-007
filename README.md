README.md
==========
<sup>Coursera :: GettingAndCleaningData :: CourseProject</sup>     
<sup>(12th September 2014)</sup>   
Author: Flic Anderson   


AIM: This README file will explain how run_analysis.R script works.  It should be used in combination with the codebook for this analysis - CODEBOOK.md.

Steps involved in this analysis:     
1. Merge training & test sets to create one data set    
2. Extract only measurements on mean & standard deviation for ea. measurement   
3. Use descriptive activity names to name activities in the data set   
4. Appropriately label data set with descriptive variable names    
5. From descriptively named dataset, create second, independent tidy data set w/ average of each variable for each activity and each subject.   

--------------------------------------------------------------------------------
###Setup: 

NOTE: Data is presumed to be unzipped to the same working directory as the script.

First the script will empty the environment to avoid confusion (using `rm(list=ls())`), and load any required packages.  If the package is not installed, it will be installed by the script. 

###Step 1:  

**Read in data** from text (.txt) files in the following order, using `read.table()`:   
1. Activity labels as 'activities' data frame from "./activity_labels.txt"     
2. Features variables as 'features' data frame from "./features.txt"     
3. Training set data     
    * Training set main data as 'train' data frame from "./train/X_train.txt", using column names from features\$V2 (second column)     
    * Training set subject data as 'train_subject' data frame with placeholder column name "subject"     
    * Raining set activity data as 'train_labels' data frame with placeholder column name "activity"   
4. Test set data   
    * test set main data as 'test' data frame from "./test/X_test.txt", using column names from features\$V2 (second column)        
    * test set subject data as 'test_subject' data frame  with placeholder column name "subject"      
    * test set activity data as 'test_labels' data frame with placeholder column name "activity"      

Attach activity labels values and subject ID numbers to training and test data respectively, using `cbind()`.    

**Merge** test and training data frames into `datA` data frame using `rbind()`.   

###Step 2: 

**Extract measurements** by using `grep()` to find all feature variable names in 'features' data frame which match pattern "mean\\(" to pull out indices which will match mean() but not meanFreq(), and "std" to match std() for standard deviations.  These were then concatonated using `c()` and then sorted using `sort()` to put them into the same order as they were found in features data frame.  These indices were then stored as `mean_std`.  

The columns for mean and standard deviation measurements were then extracted from datA via subsetting, replacing datA with: the columns pulled out by their indices stored in the mean_std variable, the second-last column (subject information), and the last column (activity value).


###Step 3:  

The **activity values were named** in the dataset by creating a factor from datA\$activity using `factor()` and setting the levels of this factor by using the values from the second column of the activity data frame (activity[,2]) with the `levels()` function.


###Step 4: 

The **feature (measurement) variables were then renamed** into more easily readable and descriptive variable names by extracting `names(datA)` and saving this as variable 'a'.  The `gsub()` function and regular expression patterns were then used to replace all dots with an underscore, and remove additional underscores from the end of variable names.  These replacements did not affect variables 'subject' or 'activity'.  

The `gsub()` function was used to edit the name() of 'subject' to "subject_ID".  

The same was done to alter 'activity' to "activity_type" in variable 'a'.

These edited names were then set as the new `names(datA)` values.  

###Step 5:  

An independent tidy dataset was then created from the datA which was merged and renamed in steps 1-4, using functions from the `{tidyr}` package, chained using the `%>%` chaining operator from the same package:  

``` 
SamsungGSII_sensorData <- datA %>%       
          # 1.     
        gather(measurement, value, tBodyAcc_mean_X:fBodyBodyGyroJerkMag_std) %>%    
          # 2.     
        group_by(subject_ID, activity_type, measurement) %>%     
          # 3.    
        summarize(meanFeatureValue=mean(value))    
```
Measurement variables (previously each separate columns) were gathered into a new 'measurement' column with their values set as a new 'value' column using `gather()`.  

The data was grouped by subject, activity and measurement using `group_by()` function.  

A summary of the data was printed using the `summarize()` function.  The summary contained subject.ID, activity_type and measurement columns, with a 'meanFeatureValue' feature calculated using `mean(value)`.  

This was saved as the object `SamsungGSII_sensorData`.  

The tidy dataset from SamsungGSII_sensorData was then written to a .txt file using:
`write.table(SamsungGSII_sensorData, file="SamsungGSII_sensorData.txt", row.names=FALSE)` to prevent row names being written to the file.  

--------------------------------------------------------------------------------
<sup>(Flic Anderson, 12th September 2014)</sup> 

