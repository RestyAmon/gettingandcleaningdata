# Peer-graded Assignment: Getting and Cleaning Data Course Project 
Repository for Programming Assignment 1 for Getting and Cleaning Data Course Project on Coursera. The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.<br/>
1) Download and unzip data file. https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip <br/>
2) Run the source code to create the tidy data.<br/>

## The Data
1) X = the sesor signals mwasured from 30 subjects using waist mounted smartphones <br/>
2) Y = the activity performed by the participants</br>
## The Code
The code was written based on the assignment's instruction  <br/>
 <br/>
Read training and test dataset into R environment. Read variable names into R envrionment. Read subject index into R environment. <br/>

1) Merges the training and the test sets to create one data set. Use command rbind to combine training and test set <br/>
2) Extracts only the measurements on the mean and standard deviation for each measurement. Use grep command to get column indexes for variable name contains "mean()" or "std()"  <br/>
3) Uses descriptive activity names to name the activities in the data set Convert activity labels to characters and add a new column as factor <br/>
4) Appropriately labels the data set with descriptive variable names. Give the selected descriptive names to variable columns
From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. Use pipeline command to create a new tidy dataset with command group_by and summarize_each in dplyr package
