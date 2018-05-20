# run_analysis.R script

The run_analysis.R script works by:

Downloading the relevant data in zip format to the working directory, then unzipping the folder.
Reading the training and test datasets from the unzipped folder into R for the X, Y and subject data. Note that X data contains the 561 features, Y data contains the activity label and subject data contains the subject ID.
Merging the training and test datasets into singular sets (separate datasets for X, Y and subject data)
Converting activity labels (numbers 1 to 6) into descriptive names. The mapping is as follows: 1 = walking 2 = walking_upstairs 3 = walking_downstairs 4 = sitting 5 = standing 6 = laying
Applying descriptive column names to the X, Y and subject datasets. For Y and subject datasets, there is only one column in each set which correspond to the activity names and subject IDs respectively, so these are set manually - "activityName" for Y and "subjectID" for subject. The column names for the X dataset are applied using the features.txt file (included in the zip folder), which is a list of all the 561 features and their names.
Binding the X, Y and subject datasets into one dataset, named "one".
Using the grepl() function to select only columns that contain "mean()" or "std()" so as to included only those features that are means and standard deviations of the measurements. Note that the activityName and subjectID columns are also included in the reduced dataset, which is named "mean_std_one".
Using the "mean_std_one" dataset created in step 7 above to create a new dataset which averages all of the features by activityName and subjectID. The column names of these averaged features is also changed (adding a prefix of "Mean-" to each column name) so as not to confuse these columns with those in the "mean_std_one" dataset. This final dataset is named "mean_one".
Write the final dataset "mean_one" to a text file named "output.txt", using the write.table() function with the argument row.name=FALSE. This "output.txt" file is located in the GitHub repo - note: to read this dataset into R, use read.table() with the argument header=TRUE.

The data in output.txt is tidy since:

1) Each variable you measure should be in one column.
2) Each different observation of that variable should be in a different row.
3) There should be one table for each "kind" of variable.

# Variables in tidy data

subjectID 
    The ID label of subject taking part in the experiment. 
        Range from 1 to 30.
    
activityName
    The label of the type of activity done when measurements were taken.
        "laying"
        "sitting"
        "standing"
        "walking"
        "walking_downstairs"
        "walking_upstairs"

Mean-tBodyAcc-mean()-X	
    The mean of the tBodyAcc-mean()-X variable for the given subjectID and activityName

Mean-tBodyAcc-mean()-Y	
    The mean of the tBodyAcc-mean()-Y variable for the given subjectID and activityName

Mean-tBodyAcc-mean()-Z	
    The mean of the tBodyAcc-mean()-Z variable for the given subjectID and activityName

Mean-tBodyAcc-std()-X	
    The mean of the tBodyAcc-std()-X variable for the given subjectID and activityName

Mean-tBodyAcc-std()-Y	
    The mean of the tBodyAcc-std()-Y variable for the given subjectID and activityName

Mean-tBodyAcc-std()-Z	
    The mean of the tBodyAcc-std()-Z variable for the given subjectID and activityName

Mean-tGravityAcc-mean()-X	
    The mean of the tGravityAcc-mean()-X variable for the given subjectID and activityName

Mean-tGravityAcc-mean()-Y
    The mean of the tGravityAcc-mean()-Y variable for the given subjectID and activityName

Mean-tGravityAcc-mean()-Z
    The mean of the tGravityAcc-mean()-Z variable for the given subjectID and activityName

Mean-tGravityAcc-std()-X	
    The mean of the tGravityAcc-std()-X variable for the given subjectID and activityName

Mean-tGravityAcc-std()-Y	
    The mean of the tGravityAcc-std()-Y variable for the given subjectID and activityName

Mean-tGravityAcc-std()-Z	
    The mean of the tGravityAcc-std()-Z variable for the given subjectID and activityName

Mean-tBodyAccJerk-mean()-X
    The mean of the tBodyAccJerk-mean()-X variable for the given subjectID and activityName

Mean-tBodyAccJerk-mean()-Y	
    The mean of the tBodyAccJerk-mean()-Y variable for the given subjectID and activityName

Mean-tBodyAccJerk-mean()-Z	
    The mean of the tBodyAccJerk-mean()-Z variable for the given subjectID and activityName

Mean-tBodyAccJerk-std()-X	
    The mean of the tBodyAccJerk-std()-X variable for the given subjectID and activityName

Mean-tBodyAccJerk-std()-Y
    The mean of the tBodyAccJerk-std()-Y variable for the given subjectID and activityName

Mean-tBodyAccJerk-std()-Z
    The mean of the tBodyAccJerk-std()-Z variable for the given subjectID and activityName

Mean-tBodyGyro-mean()-X	
    The mean of the tBodyGyro-mean()-X variable for the given subjectID and activityName

Mean-tBodyGyro-mean()-Y	
    The mean of the tBodyGyro-mean()-Y variable for the given subjectID and activityName

Mean-tBodyGyro-mean()-Z	
    The mean of the tBodyGyro-mean()-Z variable for the given subjectID and activityName

Mean-tBodyGyro-std()-X	
    The mean of the tBodyGyro-std()-X variable for the given subjectID and activityName

Mean-tBodyGyro-std()-Y	
    The mean of the tBodyGyro-std()-Y variable for the given subjectID and activityName

Mean-tBodyGyro-std()-Z	
    The mean of the tBodyGyro-std()-Z variable for the given subjectID and activityName

Mean-tBodyGyroJerk-mean()-X	
    The mean of the tBodyGyroJerk-mean()-X variable for the given subjectID and activityName

Mean-tBodyGyroJerk-mean()-Y	
    The mean of the tBodyGyroJerk-mean()-Y variable for the given subjectID and activityName

Mean-tBodyGyroJerk-mean()-Z	
    The mean of the tBodyGyroJerk-mean()-Z variable for the given subjectID and activityName

Mean-tBodyGyroJerk-std()-X	
    The mean of the tBodyGyroJerk-std()-X variable for the given subjectID and activityName

Mean-tBodyGyroJerk-std()-Y	
    The mean of the tBodyGyroJerk-std()-Y variable for the given subjectID and activityName

Mean-tBodyGyroJerk-std()-Z	
    The mean of the tBodyGyroJerk-std()-Z variable for the given subjectID and activityName

Mean-tBodyAccMag-mean()	
    The mean of the tBodyAccMag-mean() variable for the given subjectID and activityName

Mean-tBodyAccMag-std()	
    The mean of the tBodyAccMag-std() variable for the given subjectID and activityName

Mean-tGravityAccMag-mean()	
    The mean of the tGravityAccMag-mean() variable for the given subjectID and activityName

Mean-tGravityAccMag-std()	
    The mean of the tGravityAccMag-std() variable for the given subjectID and activityName

Mean-tBodyAccJerkMag-mean()	
    The mean of the tBodyAccJerkMag-mean() variable for the given subjectID and activityName

Mean-tBodyAccJerkMag-std()	
    The mean of the tBodyAccJerkMag-std() variable for the given subjectID and activityName

Mean-tBodyGyroMag-mean()	
    The mean of the tBodyGyroMag-mean() variable for the given subjectID and activityName

Mean-tBodyGyroMag-std()	
    The mean of the tBodyGyroMag-std() variable for the given subjectID and activityName

Mean-tBodyGyroJerkMag-mean()
    The mean of the tBodyGyroJerkMag-mean() variable for the given subjectID and activityName

Mean-tBodyGyroJerkMag-std()	
    The mean of the tBodyGyroJerkMag-std() variable for the given subjectID and activityName

Mean-fBodyAcc-mean()-X	
    The mean of the fBodyAcc-mean()-X variable for the given subjectID and activityName

Mean-fBodyAcc-mean()-Y	
    The mean of the fBodyAcc-mean()-Y variable for the given subjectID and activityName

Mean-fBodyAcc-mean()-Z	
    The mean of the fBodyAcc-mean()-Z variable for the given subjectID and activityName

Mean-fBodyAcc-std()-X
    The mean of the fBodyAcc-std()-X variable for the given subjectID and activityName

Mean-fBodyAcc-std()-Y	
    The mean of the fBodyAcc-std()-Y variable for the given subjectID and activityName

Mean-fBodyAcc-std()-Z	
    The mean of the fBodyAcc-std()-Z variable for the given subjectID and activityName

Mean-fBodyAcc-meanFreq()-X	
    The mean of the fBodyAcc-meanFreq()-X variable for the given subjectID and activityName

Mean-fBodyAcc-meanFreq()-Y	
    The mean of the fBodyAcc-meanFreq()-Y variable for the given subjectID and activityName

Mean-fBodyAcc-meanFreq()-Z	
    The mean of the fBodyAcc-meanFreq()-Z variable for the given subjectID and activityName

Mean-fBodyAccJerk-mean()-X	
    The mean of the fBodyAccJerk-mean()-X variable for the given subjectID and activityName

Mean-fBodyAccJerk-mean()-Y	
    The mean of the fBodyAccJerk-mean()-Y variable for the given subjectID and activityName

Mean-fBodyAccJerk-mean()-Z
    The mean of the fBodyAccJerk-mean()-Z variable for the given subjectID and activityName

Mean-fBodyAccJerk-std()-X	
    The mean of the fBodyAccJerk-std()-X variable for the given subjectID and activityName

Mean-fBodyAccJerk-std()-Y	
    The mean of the fBodyAccJerk-std()-Y variable for the given subjectID and activityName

Mean-fBodyAccJerk-std()-Z	
    The mean of the fBodyAccJerk-std()-Z variable for the given subjectID and activityName

Mean-fBodyAccJerk-meanFreq()-X	
    The mean of the fBodyAccJerk-meanFreq()-X variable for the given subjectID and activityName

Mean-fBodyAccJerk-meanFreq()-Y	
    The mean of the fBodyAccJerk-meanFreq()-Y variable for the given subjectID and activityName

Mean-fBodyAccJerk-meanFreq()-Z	
    The mean of the fBodyAccJerk-meanFreq()-Z variable for the given subjectID and activityName

Mean-fBodyGyro-mean()-X	
    The mean of the fBodyGyro-mean()-X variable for the given subjectID and activityName

Mean-fBodyGyro-mean()-Y	
    The mean of the fBodyGyro-mean()-Y variable for the given subjectID and activityName

Mean-fBodyGyro-mean()-Z	
    The mean of the fBodyGyro-mean()-Z variable for the given subjectID and activityName

Mean-fBodyGyro-std()-X	
    The mean of the fBodyGyro-std()-X variable for the given subjectID and activityName

Mean-fBodyGyro-std()-Y	
    The mean of the fBodyGyro-std()-Y variable for the given subjectID and activityName

Mean-fBodyGyro-std()-Z
    The mean of the fBodyGyro-std()-Z variable for the given subjectID and activityName

Mean-fBodyGyro-meanFreq()-X	
    The mean of the fBodyGyro-meanFreq()-X variable for the given subjectID and activityName

Mean-fBodyGyro-meanFreq()-Y	
    The mean of the fBodyGyro-meanFreq()-Y variable for the given subjectID and activityName

Mean-fBodyGyro-meanFreq()-Z	
    The mean of the fBodyGyro-meanFreq()-Z variable for the given subjectID and activityName

Mean-fBodyAccMag-mean()	
    The mean of the fBodyAccMag-mean() variable for the given subjectID and activityName

Mean-fBodyAccMag-std()	
    The mean of the fBodyAccMag-std() variable for the given subjectID and activityName

Mean-fBodyAccMag-meanFreq()	
    The mean of the fBodyAccMag-meanFreq() variable for the given subjectID and activityName

Mean-fBodyBodyAccJerkMag-mean()	
    The mean of the fBodyBodyAccJerkMag-mean() variable for the given subjectID and activityName

Mean-fBodyBodyAccJerkMag-std()	
    The mean of the fBodyBodyAccJerkMag-std() variable for the given subjectID and activityName

Mean-fBodyBodyAccJerkMag-meanFreq()	
    The mean of the fBodyBodyAccJerkMag-meanFreq() variable for the given subjectID and activityName

Mean-fBodyBodyGyroMag-mean()	
    The mean of the fBodyBodyGyroMag-mean() variable for the given subjectID and activityName
    
Mean-fBodyBodyGyroMag-std()	
    The mean of the fBodyBodyGyroMag-std() variable for the given subjectID and activityName

Mean-fBodyBodyGyroMag-meanFreq()	
    The mean of the fBodyBodyGyroMag-meanFreq() variable for the given subjectID and activityName

Mean-fBodyBodyGyroJerkMag-mean()	
    The mean of the fBodyBodyGyroJerkMag-mean() variable for the given subjectID and activityName

Mean-fBodyBodyGyroJerkMag-std()	
    The mean of the fBodyBodyGyroJerkMag-std() variable for the given subjectID and activityName

Mean-fBodyBodyGyroJerkMag-meanFreq()	
    The mean of the fBodyBodyGyroJerkMag-meanFreq() variable for the given subjectID and activityName


================================================================================

More information on the features that were averaged is listed below:


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



