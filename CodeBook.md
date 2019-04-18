# Tidy Data Code Book

This contains information on the data, variables, and summaries calculated.

## Source File

The data used in this course assignment is from accelerometers from the Samsung Galaxy S smartphone.

* Data source: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Data full description: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Dataset Files
* README.txt
* features_info.txt: Shows information about the variables used on the feature vector.
* features.txt: List of all features.
* activity_labels.txt: Links the class labels with their activity name.
* train/X_train.txt: Training set.
* train/y_train.txt: Training labels.
* test/X_test.txt: Test set.
* test/y_test.txt: Test labels.

## Features
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
* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

## Activities
* WALKING
* WALKING_UPSTAIRS
* WALKING_DOWNSTAIRS
* SITTING
* STANDING
* LAYING

##The run_analysis.R script does the following

1) Merges the training and test set in 1 data set. <br/>
* use rbind() to merge each table in train and test. ( combine each x, y, and sub to create x_all,y_all, and sub_all)
* use cbind() to merge tbe  x_all,y_all, and sub_all to create train_test
2) Extracted mean and standard deviation measurements from the merged data set.<br/>
* use grepl on column names of train test to extract "std" and "mean"
* overwrite train_test
3) Renamed the activities and the features to more descriptive names.<br/>
* rename the columns using gsub()
4)Created the final data set as tidydata.txt with average of each variable for each activity and each subject.<br/>
* group_by() to group Activity and Subject
* get mean using summarize_all()
* create new file using write.table()
