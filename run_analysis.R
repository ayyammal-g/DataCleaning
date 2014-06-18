##run_analysis.R does the following. 
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

run_analysis <- function() {
  
  ## Step 1: Merge the training and test data sets from the source
  ### a) Merge  the training and test data set for Features, Subject and Activity Level.

  features_df <- rbind(read.table("./UCI HAR Dataset/train/X_train.txt"), 
                       read.table("./UCI HAR Dataset/test/X_test.txt"))
  
  subject_df <-  rbind( read.table("./UCI HAR Dataset/train/subject_train.txt"), 
                       read.table("./UCI HAR Dataset/test/subject_test.txt"))
  
  activity_df <-  rbind( read.table("./UCI HAR Dataset/train/y_train.txt"), 
                        read.table("./UCI HAR Dataset/test/y_test.txt"))
  
  featureNames_df <- read.table("./UCI HAR Dataset/features.txt")
  ActivityNames_df <- read.table("./UCI HAR Dataset/activity_labels.txt")
  
  ### b) Assign  Variable names for Feature, Subject and Activity data sets
  
  names(features_df) <- featureNames_df[[2]]
  names(subject_df)[1] <- "SubjectID"
  names(activity_df)[1] <- "ActivityID"
  
  ### c) merge Features, Subject and Activity Level into single data set
  merged_df <- cbind(features_df, subject_df, activity_df)
  
  ## Step 2: Extract only the measurements on the mean and standard deviation for each measurement.
  
  ###  variables with mean() or std() are extracted
  features_df <- features_df[, grep ("mean\\(\\)|std\\(\\)", names(features_df))]
    
  ## Step 3: Assign Descriptive activity names to name the activities in the data set
  
  activity_df["Activity"] <- ActivityNames_df[activity_df[[1]], 2]
  extracted_df <- cbind(subject_df, activity_df, features_df)
  
  ## Step 4: Appropriately label the data set with descriptive variable names
  givenNames <- names(extracted_df)
  
  ## a) Remove the special characters (, ) and - and add descriptive labels.
  
  searchTerms <- c("[-()]", "mean", "std", "^t", "^f", "Acc", "Gyro", "Mag", "BodyBody" )
  replacementTerms <- c ("", "Mean", "StdDev", "Time", "Frequency", 
                          "Accelartion", "Gyroscopic", "Magnitude", "Body")
  for (i in 1 : length(searchTerms)) 
    givenNames <- gsub(searchTerms[i], replacementTerms[i], givenNames)
  
  ## b) Further Refinement: CamelCase for easy reading
  givenNames <- sub('^(\\w?)', '\\U\\1', givenNames, perl=T)
  names(extracted_df) <- givenNames
  
  ## Step5: Find the Aggregate and reshape to long tidy data for clarity
  na.omit(extracted_df)
  aggregated_df <- aggregate(extracted_df[4:ncol(extracted_df)], by = list(extracted_df$SubjectID, extracted_df$ActivityID, extracted_df$Activity), simplify = TRUE, FUN = "mean", na.rm=T)
  
  ## Give meaningful column names before writing to txt file
  names(aggregated_df)[1] <- "Subject"
  names(aggregated_df)[2] <- "ActivityID"
  names(aggregated_df)[3] <- "Activity"
 
 format(aggregated_df, digits =2,scientific = TRUE)
 
 tidy_df <- reshape(aggregated_df, 
                    varying = names(aggregated_df)[4:69], 
                    v.names = "Mean",
                    timevar = "Measurement", 
                    times = names(aggregated_df)[4:69], 
                    direction = "long")
 
 tidy_df <- tidy_df[order(tidy_df$Subject, tidy_df$ActivityID),]
 tidy_df <- subset(tidy_df, select = c(-ActivityID, -id))
 row.names(tidy_df) <- NULL
 tidy_df$Mean <- round(tidy_df$Mean,5)
 capture.output( print(tidy_df, row.names = F, justify = "left"), file=paste0("./tidydata.txt"))

}
  