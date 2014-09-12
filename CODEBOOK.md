CODEBOOK.md
==========
<sup>Coursera :: GettingAndCleaningData :: CourseProject</sup>     
<sup>(12th September 2014)</sup>   
Author: Flic Anderson   

AIM:  describe all variables and transformations of the data.
--------------------------------------------------------------------------------
ORIGINAL READ-IN INFO:
--------------------------------------------------------------------------------
[at line 32]
**Data frame**: activities    
**Dimensions**: 6 obs of 2 variables     
V1: activity value - int (1-6)    
V2: activity name - unordered factor w/ 6 levels    
       
(V1) activity name. (V2) activity value               
1. WALKING              
2. WALKING_UPSTAIRS     
3. WALKING_DOWNSTAIRS     
4. SITTING                 
5. STANDING                      
6. LAYING                       

**Notes**:   
These were the activities measured during the study.

--------------------------------------------------------------------------------
[at line 38]
**Data frame**: features    
**Dimensions**: 561 obs of 2 variables    
V1: feature number - int (1-561)   
V2: feature name - unordered factor w/ 477 levels    
        
(V1) feature number. (V2) feature name     
1. tBodyAcc-mean()-X   
...   
561. angle(Z,gravityMean)   

**Notes**:   
The original variables are made up from combination of different measurements from the accelerometers, along different axes.  For more details, see features_info.txt

--------------------------------------------------------------------------------
[at line 44]
**Data frame**: train    
**Dimensions**: 7352 obs of 561 variables    
tBodyAcc-mean()-X: feature measurement - num
...
angle.Z.gravityMean.: feature measurement - num   

**Notes**:   
Numeric measurements of all 561 feature variables, bounded between -1 and 1. 

--------------------------------------------------------------------------------
[at line 46]
**Data frame**: train_subject    
**Dimensions**: 7352 obs of 1 variable    
subject:  subject ID - int  (1-30)

**Notes**:   
For training set data, number of subject for each observation.  

-------------------------------------------------------------------------------- 
[at line 48]
**Data frame**: train_labels    
**Dimensions**: 7352 obs of 1 variable    
activity:  activity values - int  (1-6)

**Notes**:   
For training set data, value of the activity being recorded.  

-------------------------------------------------------------------------------- 
[at line 52]
**Data frame**: test    
**Dimensions**: 2947 obs of 561 variables    
tBodyAcc-mean()-X: feature measurement - num
...
angle.Z.gravityMean.: feature measurement - num   

**Notes**:   
Numeric measurements of all 561 feature variables, bounded between -1 and 1. 

--------------------------------------------------------------------------------
[at line 54]
**Data frame**: test_subject    
**Dimensions**: 2947 obs of 1 variable    
subject:  subject ID - int  (1-30)

**Notes**:   
For test set data, number of subject for each observation.  

-------------------------------------------------------------------------------- 
[at line 56]
**Data frame**: test_labels    
**Dimensions**: 2947 obs of 1 variable    
activity:  activity values - int  (1-6)

**Notes**:   
For test set data, value of the activity being recorded.  

-------------------------------------------------------------------------------- 
[at line 60]
**Data frame**: train    
**Dimensions**: 7352 obs of 563 variables    
tBodyAcc-mean()-X: feature measurement - num
...
angle.Z.gravityMean.: feature measurement - num   
subject:  subject ID - int  (1-30)    
activity: activity values - int  (1-6)     

**Notes**:   
Numeric measurements of all 561 feature variables, bounded between -1 and 1.  And matching subject ID values and activity values.

-------------------------------------------------------------------------------- 
[at line 62]
**Data frame**: test    
**Dimensions**: 2947 obs of 563 variables    
tBodyAcc-mean()-X: feature measurement - num
...
angle.Z.gravityMean.: feature measurement - num   
subject:  subject ID - int  (1-30)    
activity: activity values - int  (1-6)     

**Notes**:   
Numeric measurements of all 561 feature variables, bounded between -1 and 1.  And matching subject ID values and activity values.

--------------------------------------------------------------------------------
[at line 66]
**Data frame**: datA    
**Dimensions**: 10299 obs of 563 variables    
tBodyAcc-mean()-X: feature measurement - num
...
angle.Z.gravityMean.: feature measurement - num   
subject:  subject ID - int  (1-30)    
activity: activity values - int  (1-6)     

**Notes**:   
Training and test set combined.  Numeric measurements of all 561 feature variables, bounded between -1 and 1.  And matching subject ID values and activity values.

--------------------------------------------------------------------------------
[at line 72]
**Vector**: mean_std    
**Dimensions**: 1:66    
int

**Notes**:   
Indices of feature measurements which contain mean and std (but not 'meanFreq'). 

--------------------------------------------------------------------------------
[at line 80]   
**Data frame**: datA    
**Dimensions**: 10299 obs of 68 variables    
tBodyAcc-mean()-X: feature measurement - num
...
angle.Z.gravityMean.: feature measurement - num   
subject:  subject ID - int  (1-30)    
activity: activity values - int  (1-6)     

**Notes**:   
Numeric measurements of subset 68 feature variables (containing mean or std), bounded between -1 and 1.  And matching subject ID values and activity values.

--------------------------------------------------------------------------------
[at line 117]   
FINAL TIDY DATA
**Data frame**: SamsungGSII_sensorData    
**Dimensions**: 11880 obs of 4 variables       
subject_ID: subject ID values - int (1-30)    
activity_type: activity values - factor w/ 6 levels    
"WALKING"    
"WALKING_UPSTAIRS"    
"WALKING_DOWNSTAIRS"    
"SITTING"              
"STANDING"     
"LAYING"    
measurement:  feature measurement values (mean or standard deviation) - factor w/ 66 levels   
tBodyAcc_mean_X      
tBodyAcc_mean_Y      
"tBodyAcc_mean_Z"             
"tBodyAcc_std_X"      
"tBodyAcc_std_Y"     
"tBodyAcc_std_Z"           
"tGravityAcc_mean_X"    
"tGravityAcc_mean_Y"      
"tGravityAcc_mean_Z"      
"tGravityAcc_std_X"     
"tGravityAcc_std_Y"       
"tGravityAcc_std_Z"           
"tBodyAccJerk_mean_X"    
"tBodyAccJerk_mean_Y"    
"tBodyAccJerk_mean_Z"         
"tBodyAccJerk_std_X"     
"tBodyAccJerk_std_Y"      
"tBodyAccJerk_std_Z"     
"tBodyGyro_mean_X"      
"tBodyGyro_mean_Y"      
"tBodyGyro_mean_Z"      
tBodyGyro_std_X"    
"tBodyGyro_std_Y"     
"tBodyGyro_std_Z"      
"tBodyGyroJerk_mean_X"     
"tBodyGyroJerk_mean_Y"     
"tBodyGyroJerk_mean_Z"       
"tBodyGyroJerk_std_X"       
"tBodyGyroJerk_std_Y"      
"tBodyGyroJerk_std_Z"      
"tBodyAccMag_mean"       
"tBodyAccMag_std"           
"tGravityAccMag_mean"         
"tGravityAccMag_std"      
"tBodyAccJerkMag_mean"     
"tBodyAccJerkMag_std"      
"tBodyGyroMag_mean"      
"tBodyGyroMag_std"          
"tBodyGyroJerkMag_mean"    
"tBodyGyroJerkMag_std"      
"fBodyAcc_mean_X"       
"fBodyAcc_mean_Y"        
"fBodyAcc_mean_Z"         
"fBodyAcc_std_X"       
"fBodyAcc_std_Y"       
"fBodyAcc_std_Z"     
"fBodyAccJerk_mean_X"     
"fBodyAccJerk_mean_Y"      
"fBodyAccJerk_mean_Z"     
"fBodyAccJerk_std_X"      
"fBodyAccJerk_std_Y"       
"fBodyAccJerk_std_Z"     
"fBodyGyro_mean_X"       
"fBodyGyro_mean_Y"         
"fBodyGyro_mean_Z"         
"fBodyGyro_std_X"          
"fBodyGyro_std_Y"          
"fBodyGyro_std_Z"      
"fBodyAccMag_mean"      
"fBodyAccMag_std"          
"fBodyBodyAccJerkMag_mean"     
"fBodyBodyAccJerkMag_std"     
"fBodyBodyGyroMag_mean"    
"fBodyBodyGyroMag_std"       
"fBodyBodyGyroJerkMag_mean"    
"fBodyBodyGyroJerkMag_std"
meanFeatureValue:  feature measurement values - num    

**Notes**:   
Summary of values from the Samsung Galaxy S II measurements, grouped by subject, activity, and with the calculated mean of each of the subset (mean or standard deviation) feature measurements.  

# ============================================================================ #

Further details on the original data from "features_info.txt":

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

--------------------------------------------------------------------------------
<sup>(Flic Anderson, 12th September 2014)</sup> 