## R script that will download activity tracking data from study at:
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
## The testing and training data are merged and measurements on
## mean and standard deviation are extracted. Mean values 
## are produced from this dataset for each activity and subject.
## Requires data.table and plyr packages.

library(data.table)
library(plyr)

## Create "data" directory if doesn't already exist. 
if(!file.exists("data")) {
    dir.create("data")
}

## Download and unzip dataset if doesn't already exist
if(!file.exists("data/UCI HAR Dataset")) {
    temp <- tempfile()
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl, temp, mode="wb")
    unzip(temp, exdir="data")
}

## Extract test dataset
feature_vector_test <- read.table("./data/UCI HAR Dataset/test/x_test.txt")
activity_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

## Extract training dataset
feature_vector_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
activity_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

## Merge training and test columns
feature_vector <- rbind(feature_vector_test, feature_vector_train)
activity <- rbind(activity_test, activity_train)
subject <- rbind(subject_test, subject_train)

## Get feature vector names and rename merged columns 
feature_names <- read.table("./data/UCI HAR Dataset/features.txt", head=FALSE)
names(feature_vector) <- feature_names$V2
names(activity) <- "activity"
names(subject) <- "subject"

## Extract only the measurements on the mean and standard deviation
## by subsetting feature vector columns with "mean" or "std" in the name 
mean_std_feature <- feature_vector[grep(".*mean.*|.*std.*", names(feature_vector), ignore.case=TRUE)]

## Merge subsetted feature with activity and subject columns 
data <- cbind(mean_std_feature, activity, subject)

## Uses descriptive activity names to name the activities in the data set
## Using factor function to map activity lables to references
activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2) 

## Calculate mean feature vector values by activity and subject, using plyr
group_cols <- c("activity", "subject")
tidy_data <- ddply(data, group_cols, colwise(mean))

## Output text file containing tidied data
write.table(tidy_data, file="tidy_data.txt", row.names=FALSE)
