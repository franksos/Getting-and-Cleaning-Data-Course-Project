# Getting-and-Cleaning-Data-Course-Project
Haifeng Yu

## Purpose of the project
To demonstrate ability to collect, work with, and clean a data set. 

## Goal
To prepare tidy data that can be used for later analysis. 

## Data source

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Function of run_analysis.R:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Detailed steps of run_analysis script (also in the actual script)

* download and unzip the files
* load train and test datasets
* merge these two datasets to "onedataset"
* read features from extracted txt files and change format from factor to character
* add descriptive labels to the data set
* extract subject, activity and columns of mean and standard deviation
* use descriptive activity names to name activities in the dataset
* create a second independant tidy data with the average of each variable for each activity and subject, using melt() and dcast()
* export the tidy data set to tidyset.txt with write.table() specifying row.names = FALSE
