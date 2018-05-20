# Load libraries
library(dplyr)

# Download the zip file containing data:
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "UCI HAR Dataset.zip")

# Unzip folder
unzip("UCI HAR Dataset.zip")

# Read in data
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

# Merge training and test sets
x <- rbind(x_train, x_test)
y <- rbind(y_train, y_test)
subject <- rbind(subject_train, subject_test)

# Apply descriptive names to activity labels
# Create vector of activity names, arranged according to their label
activities <- c("walking", "walking_upstairs", "walking_downstairs", "sitting", "standing", "laying")

# Convert activity labels into descriptive names
y <- sapply(y, function(x) activities[x]) %>% as.data.frame()

# Apply decriptive variable names
names(subject) <- "subjectID"
names(y) <- "activityName"

# Use features.txt file to name features in x dataset
features <- read.table("UCI HAR Dataset/features.txt")
names(x) <- features$V2

# Cbind x, y and subject datasets to create one dataset
one <- cbind(subject, y, x)

# Create dataset with only the mean and standard deviation of each measurement 
# (keeping activityName and subjectID)
mean_std_one <- one[, grepl("mean()", names(one)) | 
                      grepl("std()", names(one)) |
                      names(one) %in% c("subjectID", "activityName")]

# Use mean_std_df dataset to create new dataset with the average of each variable 
# for each activity and each subject. 
mean_one <- mean_std_one %>% group_by(subjectID, activityName) %>%
                             summarise_all(funs(mean))

# Add "Mean-" prefix to mean_one dataset variables (excluding subjectID and activityName) 
# so as not to confuse between features in mean_std_one dataset
names(mean_one)[3:81] <- paste0("Mean-", names(mean_one)[3:81])

# Write mean_one dataset to output.txt
write.table(mean_one, file="output.txt", row.name=F)
