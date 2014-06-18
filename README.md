Getting and Cleaning Data Course Project: RUN ANALYSIS 
========================================================

The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

DataSet Source:
---------------

The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. 

The Input data set for the project is obtained from

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

A full description about the data sets: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

run_analysis.R Script - What is has to do?

Given the data sets, run_analysis.R Script aims to 
  1) Merge the training and the test sets to create one data set. 
  2) Extract only the measurements on the mean and standard deviation for each measurement. 
  3) Use descriptive activity names to name the activities in the data set 
  4) Appropriately labels the data set with descriptive activity names. 
  5) Create a second, independent tidy data set with the average of each variable for each activity and each subject.

Assumptions:
------------

The datasets from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip are downloaded and unzipped and kept in the current working directory before running the script.


run_analysis.R Script - How it works?

1) Merging Training and Test data sets:
  
  To achieve this both Training and Test data sets are analysed. They had
  a) Inertia Data Set 
  b) A X data set containing 516 variables for each observation. Reading and analysing through features.txt, features_info.txt, those 516 variables are features measured for the experiment.
  c) A Y data set containing same number of observations as X, but has only one variable with values between 1-7. Reading and analysing through activity_labels.txt it is known that Y data set has the activity ID for n observations in X data set.
  d) A Subject data set containing same number of observations as X, but has only one variable with values between 1-30. Further analysis, lead to the fact that Subject data set has the Subject ID corresponding to the n observations in X data set.
  
  The Inertia data set carries less weightage and hence it is omitted. observations containing Feature Variables (X data set), Activity IDs (Y data set) and Subject ID (Subject data set) are taken for merging. First each of these data sets, observations in training and test  are taken together using rbind(). Then, variables in the data sets are merged together using cbind() method. 
  
`````````````````{r}
## Example of merging test and train data using rbind()
features_df <- rbind(read.table("./UCI HAR Dataset/train/X_train.txt"), 
                       read.table("./UCI HAR Dataset/test/X_test.txt"))
                       
### c) merge Feature, Subject and Activity Variables using cbind()
  merged_df <- cbind(features_df, subject_df, activity_df)
`````````````````
  
  
2) Extracting the measurements on the mean and standard deviation in Feature variables:

Out of the 561 feature variables, only the variables that has mean() or std() in its name are filtered using grep() command in R.

````````````````{r}
features_df[, grep ("mean\\(\\)|std\\(\\)", names(features_df))]

`````````````````

3) Descriptive naming for activity:

In newly constructed data set  we get after steps 1 and 2, a new variable is added to describe the Activity based on Activity ID.

`````````````{r}
## Retrieve the activity name by indexing based activity ID
activity_df["Activity"] <- ActivityNames_df[activity_df[[1]], 2]

```````````````

4) Labelling data set with Descriptive names for variables:

This work is simplified by using gsub(). The punctuation symbols are removed and some variables are renamed with better descriptive names. All the variable names are camel cased for better readability.

```{r}
## searchTerms vector are replaced with the corresponding value in replacement vector
gsub(searchTerms[i], replacementTerms[i], givenNames)
```

5)  Creating a tidy data set with the average of each variable for each activity and each subject:

With the N number of feature variables we got from steps 1-4, finding mean of each feature variable for each subject for activity gives N * 6 (no.of activities) * 30 different combination of mean values. Using aggregate() function a wide data set contain mean values of all N feature variables for each combination Subject and Activity is given as result.

```{r}
  aggregated_df <- aggregate(extracted_df[4:ncol(extracted_df)], by = list(extracted_df$SubjectID, extracted_df$ActivityID, extracted_df$Activity), simplify = TRUE, FUN = "mean", na.rm=T)

```

Wide data set looks tidy, but when it is written to text file it looks clumsy though it is  readble and technically correct. So, in order to give better readable data set the N feature variables are converted into values using reshape() function.

```{r}
tidy_df <- reshape(aggregated_df, 
                    varying = names(aggregated_df)[4:69], 
                    v.names = "Mean",
                    timevar = "Measurement", 
                    times = names(aggregated_df)[4:69], 
                    direction = "long")
```

The reshaped data is written in a text file in the current working environment. Refer **CodeBook.md** for more details on this file.

````{r}
capture.output( print(tidy_df, row.names = F, justify = "left"), file=paste0("./tidydata.txt"))
``````