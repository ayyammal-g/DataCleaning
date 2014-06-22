CodeBook
========

Input Data : 
------------

Human Activity Recognition Using Smartphones Dataset Version 1.0 is the input data downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The input datasets are partitioned into two sets, where 70% are data from volunteers selected for training  and 30% are from volunteers selected for test. 


Data Clean Up:
--------------

### Omitted Data :

  * Inertia Signals Data Set in Test and Train do not represent the mean or standard deviation values. Hence the data are stored in train/Inertial Signals/, test/Inertial Signals  are ignored while preparing tidy data. Below are the list of files that omitted in train/Intertial Signals. Similar files in /test/inertia signals are also ignored.

      1.  Files containing values of Triaxial acceleration from the accelerometer (total acceleration): total _ acc_ x_ train.txt, total_ acc_ y_ train.txt, total_ acc_ z_train.txt
    
      2. Files containing Estimated Body Accelaration: body_ acc_ x _ train.txt, train/Inertial Signals/body_ acc_ y_ train.txt, body_ acc_z _train.txt

      3. Files containing The angular velocity vector measured by the gyroscope: body_ gyro_ x_ train.txt, body_ gyro_ y_ train.txt, body_ gyro_ z_train.txt
 

### Modified Data
 
  * Below files in train and test are merged together to form a new data set containing 516 Feature variables, Activity Label and Subject IDs as columns and each row represents the corresponding observations made for testing and training. 
 
      features.txt - A 561-feature vector with time and frequency domain variables. 
      y_train.txt -  activity label. 
      subject_train.txt - An identifier of the subject who carried out the experiment.
  
  * Activity Variable is added to give better description about the activity for each  observation. 
 
  * 561 feature variables are further refined to hold only measurements that has mean() or std() as its values. Thus the 561 variables are reduced to 66 variables. These 66 variable names are renamed with better descriptive names
   
  Names in Features.txt | Renamed Variables
  ---------------------| ----------------------------  
  tBodyAcc-mean()-X|TimeBodyAccelartionMeanX       
  tBodyAcc-mean()-Y|TimeBodyAccelartionMeanY
  tBodyAcc-mean()-Z|TimeBodyAccelartionMeanZ
  tBodyAcc-std()-X|TimeBodyAccelartionStdDevX
  tBodyAcc-std()-Y|TimeBodyAccelartionStdDevY
  tBodyAcc-std()-Z|TimeBodyAccelartionStdDevZ
  tGravityAcc-mean()-X| TimeGravityAccelartionMeanX
  tGravityAcc-mean()-Y| TimeGravityAccelartionMeanY
  tGravityAcc-mean()-Z| TimeGravityAccelartionMeanZ
  tGravityAcc-std()-X| TimeGravityAccelartionStdDevX
  tGravityAcc-std()-Y| TimeGravityAccelartionStdDevY
  tGravityAcc-std()-Z| TimeGravityAccelartionStdDevZ
  tBodyAccJerk-mean()-X| TimeBodyAccelartionJerkMeanX
  tBodyAccJerk-mean()-Y| TimeBodyAccelartionJerkMeanY
  tBodyAccJerk-mean()-Z| TimeBodyAccelartionJerkMeanZ
  tBodyAccJerk-std()-X| TimeBodyAccelartionJerkStdDevX
  tBodyAccJerk-std()-Y| TimeBodyAccelartionJerkStdDevY
  tBodyAccJerk-std()-Z| TimeBodyAccelartionJerkStdDevZ
  tBodyGyro-mean()-X|  TimeBodyGyroscopicMeanX
  tBodyGyro-mean()-Y|  TimeBodyGyroscopicMeanY
  tBodyGyro-mean()-Z|  TimeBodyGyroscopicMeanZ
  tBodyGyro-std()-X|  TimeBodyGyroscopicStdDevX
  tBodyGyro-std()-Y|  TimeBodyGyroscopicStdDevY
  tBodyGyro-std()-Z|  TimeBodyGyroscopicStdDevZ
  tBodyGyroJerk-mean()-X| TimeBodyGyroscopicJerkMeanX
  tBodyGyroJerk-mean()-Y| TimeBodyGyroscopicJerkMeanY
  tBodyGyroJerk-mean()-Z| TimeBodyGyroscopicJerkMeanZ
  tBodyGyroJerk-std()-X| TimeBodyGyroscopicJerkStdDevX
  tBodyGyroJerk-std()-Y| TimeBodyGyroscopicJerkStdDevY
  tBodyGyroJerk-std()-Z|TimeBodyGyroscopicJerkStdDevZ
  tGravityAccMag-mean()| TimeGravityAccelartionMagnitudeMean      
  tGravityAccMag-std()| TimeGravityAccelartionMagnitudeStdDev
  tBodyAccMag-mean()| TimeBodyAccelartionMagnitudeMean  
  tBodyAccMag-std()| TimeBodyAccelartionMagnitudeStdDev 
  tBodyAccJerkMag-mean()| TimeBodyAccelartionJerkMagnitudeMean  
  tBodyAccJerkMag-std()| TimeBodyAccelartionJerkMagnitudeStdDev 
  tBodyGyroMag-mean()| TimeBodyGyroscopicMagnitudeMean 
  tBodyGyroMag-std()| TimeBodyGyroscopicMagnitudeStdDev 
  tBodyGyroJerkMag-mean()| TimeBodyGyroscopicJerkMagnitudeMean 
  tBodyGyroJerkMag-std()| TimeBodyGyroscopicJerkMagnitudeStdDev
  fBodyAcc-mean()-X|FrequencyBodyAccelartionMeanX       
  fBodyAcc-mean()-Y|FrequencyBodyAccelartionMeanY
  fBodyAcc-mean()-Z|FrequencyBodyAccelartionMeanZ
  fBodyAcc-std()-X|FrequencyBodyAccelartionStdDevX
  fBodyAcc-std()-Y|FrequencyBodyAccelartionStdDevY
  fBodyAcc-std()-Z|FrequencyBodyAccelartionStdDevZ
  fBodyAccJerk-mean()-X| FrequencyBodyAccelartionJerkMeanX
  fBodyAccJerk-mean()-Y| FrequencyBodyAccelartionJerkMeanY
  fBodyAccJerk-mean()-Z|FrequencyBodyAccelartionJerkMeanZ
  fBodyAccJerk-std()-X| FrequencyBodyAccelartionJerkStdDevX
  fBodyAccJerk-std()-Y| FrequencyBodyAccelartionJerkStdDevY
  fBodyAccJerk-std()-Z| FrequencyBodyAccelartionJerkStdDevZ
  fBodyGyro-mean()-X|  FrequencyBodyGyroscopicMeanX
  fBodyGyro-mean()-Y| FrequencyBodyGyroscopicMeanY
  fBodyGyro-mean()-Z|  FrequencyBodyGyroscopicMeanZ
  fBodyGyro-std()-X|  FrequencyBodyGyroscopicStdDevX
  fBodyGyro-std()-Y| FrequencyBodyGyroscopicStdDevY
  fBodyGyro-std()-Z|  FrequencyBodyGyroscopicStdDevZ
  fBodyAccMag-mean()| FrequencyBodyAccelartionMagnitudeMean  
  fBodyAccMag-std()| FrequencyBodyAccelartionMagnitudeStdDev 
  fBodyAccJerkMag-mean()| FrequencyBodyAccelartionJerkMagnitudeMean  
  fBodyAccJerkMag-std()| FrequencyBodyAccelartionJerkMagnitudeStdDev 
  fBodyGyroMag-mean()| FrequencyBodyGyroscopicMagnitudeMean 
  fBodyGyroMag-std()| FrequencyBodyGyroscopicMagnitudeStdDev 
  fBodyGyroJerkMag-mean()| FrequencyBodyGyroscopicJerkMagnitudeMean 
  fBodyGyroJerkMag-std()| FrequencyBodyGyroscopicJerkMagnitudeStdDev
  
  
 
   

Tidy Data : 
-----------

The cleaned up data is written to  tidydata.txt which is stored in current working directory.

Fields:
-------

## Subject: 
    Represents the ID for the subjects who participated in  the experiment.
    Values range between 1 - 30
    
    
## Activity:

     During the experiment, the Subjects performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The activity variable represents one of those activities performed by the subject.
  
    
## Measurement:

    The measurement variable holds the names of feature variables which represents mean or standard deviation of the measurement. Measurement Variable holds any of the below 66 Features Variables as values. (The renamed variables column in Table mentioned under modified data)
    
    Time Domained Signals:
    
       TimeBodyAccelartionMeanX
       TimeBodyAccelartionMeanY
       TimeBodyAccelartionMeanZ
       
       TimeBodyAccelartionStdDevX
       TimeBodyAccelartionStdDevY
       TimeBodyAccelartionStdDevZ
       
       TimeGravityAccelartionMeanX
       TimeGravityAccelartionMeanY
       TimeGravityAccelartionMeanZ
       
       TimeGravityAccelartionStdDevX
       TimeGravityAccelartionStdDevY
       TimeGravityAccelartionStdDevZ
       
       TimeBodyAccelartionJerkMeanX
       TimeBodyAccelartionJerkMeanY
       TimeBodyAccelartionJerkMeanZ
       
       TimeBodyAccelartionJerkStdDevX
       TimeBodyAccelartionJerkStdDevY
       TimeBodyAccelartionJerkStdDevZ
       
       TimeBodyGyroscopicMeanX
       TimeBodyGyroscopicMeanY
       TimeBodyGyroscopicMeanZ
       
       TimeBodyGyroscopicStdDevX
       TimeBodyGyroscopicStdDevY
       TimeBodyGyroscopicStdDevZ
       
       TimeBodyGyroscopicJerkMeanX
       TimeBodyGyroscopicJerkMeanY
       TimeBodyGyroscopicJerkMeanZ
       
       TimeBodyGyroscopicJerkStdDevX 
       TimeBodyGyroscopicJerkStdDevY
       TimeBodyGyroscopicJerkStdDevZ
       
       TimeBodyAccelartionMagnitudeMean
       TimeBodyAccelartionMagnitudeStdDev
       
       TimeGravityAccelartionMagnitudeMean
       TimeGravityAccelartionMagnitudeStdDev
       
       TimeBodyAccelartionJerkMagnitudeMean
       TimeBodyAccelartionJerkMagnitudeStdDev
       
       TimeBodyGyroscopicMagnitudeMean 
       TimeBodyGyroscopicMagnitudeStdDev
       
       TimeBodyGyroscopicJerkMagnitudeMean
       TimeBodyGyroscopicJerkMagnitudeStdDev
       
       Frequency Domain Signals:
       
       FrequencyBodyAccelartionMeanX 
       FrequencyBodyAccelartionMeanY
       FrequencyBodyAccelartionMeanZ
       
       FrequencyBodyAccelartionStdDevX
       FrequencyBodyAccelartionStdDevY
       FrequencyBodyAccelartionStdDevZ
       
       FrequencyBodyAccelartionJerkMeanX
       FrequencyBodyAccelartionJerkMeanY
       FrequencyBodyAccelartionJerkMeanZ
       
       FrequencyBodyAccelartionJerkStdDevX
       FrequencyBodyAccelartionJerkStdDevY
       FrequencyBodyAccelartionJerkStdDevZ
       
       FrequencyBodyGyroscopicMeanX
       FrequencyBodyGyroscopicMeanY
       FrequencyBodyGyroscopicMeanZ
       
       FrequencyBodyGyroscopicStdDevX
       FrequencyBodyGyroscopicStdDevY
       FrequencyBodyGyroscopicStdDevZ
       
       FrequencyBodyAccelartionMagnitudeMean
       FrequencyBodyAccelartionMagnitudeStdDev 
       
       FrequencyBodyAccelartionJerkMagnitudeMean
       FrequencyBodyAccelartionJerkMagnitudeStdDev
       
       FrequencyBodyGyroscopicMagnitudeMean
       FrequencyBodyGyroscopicMagnitudeStdDev
       
       FrequencyBodyGyroscopicJerkMagnitudeMean
       FrequencyBodyGyroscopicJerkMagnitudeStdDev
    
## Mean

    It holds mean value for a  Feature Variable for a subject for an activity of an observation. Its value is decimal and the result is rounded to 5 digits.