## Input Raw Data Set

### Input Raw Data Name
[UCI HAR Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

### Variable Names for Raw Input Dataset
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag
The set of variables that were estimated from these signals are: 
* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.
Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean
For detailed description of features, see features.txt in the dataset

### Summary of Input Raw Data
* subjects: 1 - 30 (total 30 subjects)
* activity: 1 WALKING, 2 WALKING_UPSTAIRS, 3 WALKING_DOWNSTAIRS, 4 SITTING, 5 STANDING, 6 LAYING (total 6 activities)
* number of raw features: 561
* number of training data: 7352
* number of testing data: 2947

## Output Tidy Data

### Dataset Information
We merge training and testing dataset into one dataset. We extracts only the measurements on the mean and standard deviation for each measurement from raw dataset. Group dataset by subject and activity and compute the average for each subject and activity combination.

### Output Tidy Data Name
tidydata.txt

### Column Names for Output Tidy Data Frame
* subject                                                
* activity.id                                            
* activity.name                                         
* time.body.acceleration.mean.x.average                 
* time.body.acceleration.mean.y.average                  
* time.body.acceleration.mean.z.average                  
* time.body.acceleration.std.x.average                  
* time.body.acceleration.std.y.average                   
* time.body.acceleration.std.z.average                   
* time.gravityacceleration.mean.x.average                
* time.gravityacceleration.mean.y.average                
* time.gravityacceleration.mean.z.average                
* time.gravityacceleration.std.x.average                
* time.gravityacceleration.std.y.average                 
* time.gravityacceleration.std.z.average                 
* time.body.acceleration.jerk.mean.x.average             
* time.body.acceleration.jerk.mean.y.average             
* time.body.acceleration.jerk.mean.z.average             
* time.body.acceleration.jerk.std.x.average              
* time.body.acceleration.jerk.std.y.average              
* time.body.acceleration.jerk.std.z.average              
* time.body.gyroscope.mean.x.average                     
* time.body.gyroscope.mean.y.average                     
* time.body.gyroscope.mean.z.average                     
* time.body.gyroscope.std.x.average                     
* time.body.gyroscope.std.y.average                      
* time.body.gyroscope.std.z.average                      
* time.body.gyroscope.jerk.mean.x.average                
* time.body.gyroscope.jerk.mean.y.average                
* time.body.gyroscope.jerk.mean.z.average                
* time.body.gyroscope.jerk.std.x.average                 
* time.body.gyroscope.jerk.std.y.average                 
* time.body.gyroscope.jerk.std.z.average                 
* time.body.acceleration.magnitude.mean.average          
* time.body.acceleration.magnitude.std.average           
* time.gravityacceleration.magnitude.mean.average        
* time.gravityacceleration.magnitude.std.average         
* time.body.acceleration.jerk.magnitude.mean.average     
* time.body.acceleration.jerk.magnitude.std.average      
* time.body.gyroscope.magnitude.mean.average             
* time.body.gyroscope.magnitude.std.average              
* time.body.gyroscope.jerk.magnitude.mean.average       
* time.body.gyroscope.jerk.magnitude.std.average         
* frequency.body.acceleration.mean.x.average             
* frequency.body.acceleration.mean.y.average             
* frequency.body.acceleration.mean.z.average             
* frequency.body.acceleration.std.x.average             
* frequency.body.acceleration.std.y.average              
* frequency.body.acceleration.std.z.average              
* frequency.body.acceleration.jerk.mean.x.average        
* frequency.body.acceleration.jerk.mean.y.average        
* frequency.body.acceleration.jerk.mean.z.average        
* frequency.body.acceleration.jerk.std.x.average         
* frequency.body.acceleration.jerk.std.y.average         
* frequency.body.acceleration.jerk.std.z.average         
* frequency.body.gyroscope.mean.x.average                
* frequency.body.gyroscope.mean.y.average                
* frequency.body.gyroscope.mean.z.average                
* frequency.body.gyroscope.std.x.average                 
* frequency.body.gyroscope.std.y.average                 
* frequency.body.gyroscope.std.z.average                 
* frequency.body.acceleration.magnitude.mean.average     
* frequency.body.acceleration.magnitude.std.average      
* frequency.body.acceleration.jerk.magnitude.mean.average
* frequency.body.acceleration.jerk.magnitude.std.average 
* frequency.body.gyroscope.magnitude.mean.average        
* frequency.body.gyroscope.magnitude.std.average         
* frequency.body.gyroscope.jerk.magnitude.mean.average  
* frequency.body.gyroscope.jerk.magnitude.std.average 

### Row Name for Output Tidy Data
row name for output data has following format

subject.activity

where subject is the id of subject (from 1 to 30) and activity is the name of the activity (walking, walking.upstairs, walking.downstairs, sitting, standing, laying)

Example

1.walking is the row name for subject 1 and activity walking.

### Output Example
|       |subject |activity.id |activity.name |time.body.acceleration.mean.x.average|
| ----- |-------:|-----------:|-------------:|------------------------------------:|
|1.laying|       1|           6|        laying|                             0.2215982|
|2.laying|       2|           6|        laying|                             0.2813734|
|3.laying|       3|           6|        laying|                             0.2755169|
|4.laying|       4|           6|        laying|                             0.2635592|
|5.laying|       5|           6|        laying|                             0.2783343|
|6.laying|       6|           6|        laying|                             0.2486565|

### Output Tidy Data Summary
* subjects: 1 - 30 (total 30 subjects)
* activity: 1 walking, 2 walking.upstairs, 3 walking.downstairs, 4 sitting, 5 standing, 6 laying
* number of features measure average: 69 
* number of data: 180

## Data transformation
### Merges the training and the test sets to create one dataset
* load text files X_train.txt, subject_train.txt, y_train.txt in train folder to form a data frame called traindata
* load text files x_text.txt, subject_test.txt, y_text.txt in test folder to form a data frame called testdata
* texts files in Inertial Signals folder in both train and test folders are omitted
* bind traindata and testdata row-wise (rbind) to obtain a new data frame traintestdata

### Uses descriptive column names to name each column in traintest data
* load features.txt in UCI HAR Dataset folder; only keep the second column which contains all feature/measurement names into variable featurename
* turn featurename from factor to character vector
* use grepl to find feature/measurement names which contain "-mean()" and "-std()" substring. Ignore feature/measurement names containing "-meanFreq". Store the logic mask vector into variable featureindex
* subset featurenames to keep only names containing "-mean()" and "-std()" by subsetting on featureindex
* replace hypen "-" in featurenames by "."
* replace string "Body" in featurenames by "body."
* replace string "body.body." in featurenames by "body."
* replace string "Acc" in featurenames by "acceleration."
* replace string "Mag" in featurenames by "magnitude."
* replace string "Gyro" in featurenames by "gyroscope."
* replace string "Jerk" in featurenames by "gyroscope."
* replace pattern "^t" in featurenames by "time."
* replace pattern "^f" in featurenames by "frequency."
* replace string ".." in featurenames by "."
* turn all characters in featurenames into lower case
* subset traintestdata, only keep the first 3 columns (subject, activity id, activity name) and columns marked true in variable featureindex 
* rename traintestdata set. The name for each column from left to right would be "subject", "activity.id", "activity.name" and all strings in featurenames

### Uses descriptive activity names to name the activities in the dataset
* load activity_labels.txt in UCI HAR Dataset folder; only keep the second column which contains all activity names into variable activityname
* turn activityname from factor to character vector
* replace underscore "_" by "." in activityname
* turn all characters into lower case
* add activity name for each row based on the activity.id

### Creates a second, independent tidy data set with the average of each variable for each activity and each subject
* split traintestdata according to subject and activity.name columns, store it in splitdata
* for each list in splitdata, apply colMeans to columns from 4 to 69, store it in datamean
* combine subject, activity.id, activity.name and datamean as a data frame
* row bind (rbind) results for each list in splitdata. store it in variable tidydata
* rename tidydata. append ".average" for each feature/measurement name
* store tidydata in tidydata.txt file
