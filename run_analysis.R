# Getting and Cleaning Data Course Asssignment
# by Haifeng Yu

library(reshape2)
## download and unzip the files
filename <- "course3project.zip"
if (!file.exists(filename)){
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip "
        download.file(fileURL, filename, method="curl")
}  
if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}
# load train and test datasets
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
train_activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
train <- cbind(train_subjects, train_activities, train_data)

test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
test_activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
test <- cbind(test_subjects, test_activities, test_data)

# merge these two datasets to "onedataset"
onedataset <- rbind(train, test)

# read features from extracted txt files
# and change format from factor to character

features_dataframe <- read.table("UCI HAR Dataset/features.txt")
features <- as.character(features_dataframe[,2])

# add descriptive labels to the data set
colnames(onedataset) <- c("subject", "activity", features)

# extract subject, activity and columns of mean and standard deviation

extract_index <- c(1, 2, grep(".*mean.*|.*std.*", colnames(onedataset)))
wanted_data <- onedataset[, extract_index]

# use descriptive activity names to name activities in the dataset
activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
wanted_data$activity <- factor(wanted_data$activity, levels = activity_labels[,1], labels = activity_labels[,2])
wanted_data$subject <- as.factor(wanted_data$subject)

# create a second independant tidy data with the average of each variable for each activity and subject
tidy_melted <- melt(wanted_data, id = c("subject", "activity"))
tidyset <- dcast(tidy_melted, subject + activity ~ variable, mean)

# export the tidy data set to tidyset.txt
write.table (tidyset, "tidyset.txt", row.names = FALSE)
