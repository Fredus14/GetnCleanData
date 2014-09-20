<p><markdown>
#Codebook#
##The original data set
The original data set can be download from [here][1] and has been originally extracted from the [UCI Machine Learning Repository][2]. The data set is split into training and test sets (70% and 30%, respectively) where each partition is also split into three files that contain:

 - measurements from the accelerometer and gyroscope
 - activity label
 - identifier of the subject

More details about the experiment and how the measurements were made can be found in the `README.txt` file from the original dataset.

##The modified tidy data set

The unified dataset was is composed by the following files:

 - `features.txt`
 - `X_train.txt`
 - `X_test.txt`
 - `subject_train.txt`
 - `subject_test.txt`
 - `y_train_txt`
 - `y_test_txt`
 - `activity_labels.txt`

These files were assembled together as in the diagram below to form a single large data frame.

![Diagram][3] Diagram showing how the various original datasets fit together to form a single data frame. Extracted from [David's project FAQ forum thread][4]


  [1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
  [2]: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
  [3]: https://coursera-forum-screenshots.s3.amazonaws.com/ab/a2776024af11e4a69d5576f8bc8459/Slide2.png
  [4]: https://class.coursera.org/getdata-007/forum/thread?thread_id=49

Rubric: Was code book submitted to GitHub that modifies and updates the codebooks available to you with the data to indicate all the variables and summaries you calculated, along with units, and any other relevant information?

##Tidy Data Set Feature Selection 

The text below was reproduce and partially modified from `features_info.txt` from the original dataset.

The features selected for the tidy dataset is a subset of the original database which comes from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

####Original labels          ->    New extended descriptive labels
 - tBodyAcc-XYZ          ->     tBodyAccelerationXYZ
 - tGravityAcc-XYZ       ->     tGravityAccelerationXYZ  
 - tBodyAccJerk-XYZ    ->     tBodyAccelerationJerkXYZ
 - tBodyGyro-XYZ        ->     tBodyAngularVelocityXYZ 
 - tBodyGyroJerk-XYZ  ->     tBodyAngularVelocityJerkXYZ
 - tBodyAccMag           ->     tBodyAccelerationMag  
 - tGravityAccMag       ->      tGravityAccelerationMag
 - tBodyAccJerkMag     ->     tBodyAccelerationJerkMag
 - tBodyGyroMag         ->     tBodyAngularVelocityMag   
 - tBodyGyroJerkMag   ->     tBodyAngularVelocityJerkMag
 - fBodyAcc-XYZ          ->     fBodyAccelerationXYZ 
 - fBodyAccJerk-XYZ    ->     fBodyAccelerationJerkXYZ
 - fBodyGyro-XYZ        ->     fBodyAngularVelocityXYZ  
 - fBodyAccMag           ->     fBodyAccelerationMag   
 - fBodyAccJerkMag     ->     fBodyAccelerationJerkMag
 - fBodyGyroMag         ->     fBodyAngularVelocityMag   
 - fBodyGyroJerkMag   ->     fBodyAngularVelocityJerkMag 

The final tidy data set only contain the mean and standard deviation of the above measurements which are represented in the labels as Mean and StandardDeviation respectively

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

####Original labels          ->    New extended descriptive labels

 - gravityMean -> gravityMean
 - tBodyAccMean -> tBodyAccelerationMean
 - tBodyAccJerkMean -> tBodyAccelerationJerkMean
 - tBodyGyroMean -> tBodyAngularVelocityMean 
 - tBodyGyroJerkMean -> tBodyAngularVelocityJerkMean


</markdown></p>